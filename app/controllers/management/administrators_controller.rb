# -*- coding: utf-8 -*-
class Management::AdministratorsController < ApplicationController
  
   before_filter :authenticate_administrator!
  
  def index
    result = Administrator.all
    @administrators = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :administrator_name
      @administrators = Administrator.where("first_name LIKE '%#{params[:administrator_name].upcase}%' OR last_name LIKE '%#{params[:administrator_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes administradores"
      if @administrators.count == 0
        flash[:error] = "No se encontró un administrador que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @administrator = Administrator.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @administrator }
    end
  end
  
  def create
    @administrator = Administrator.new(params[:administrator])

    respond_to do |format|
      if @administrator.save
        flash[:success] = "El administrador fue creado exitosamente"
        format.html { redirect_to management_administrators_path }
        format.json { render :json =>  @administrator, :status =>  :created, :location =>  @administrator }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @administrator.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @administrator = Administrator.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid administrator with id: #{params[:id]}")
        flash[:alert] = "El atdministrador que busca no existe."
        redirect_to management_administrators_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @administrator }
    end
  end
  
  def edit
    if params[:id]
      begin
        @administrator = Administrator.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid administrator with id: #{params[:id]}")
        flash[:alert] = "El adminisrador que busca no existe"
        redirect_to management_administrators_path and return
      end
    end        
  end
  
  def update
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      if @administrator.update_attributes(params[:administrator])
        flash[:success] = "El administrador fue actualizado exitosamente"
        format.html { redirect_to management_administrators_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @administrator.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @administrator = Administrator.find(params[:id])
        @administrator.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid administrator with id: #{params[:id]}")
        flash[:alert] = "El administrador que usted busca no existe."
        redirect_to management_administrators_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Administrador eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
