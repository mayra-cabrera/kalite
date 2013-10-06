# -*- coding: utf-8 -*-
class SystemsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = System.order('created_at DESC').all
    @systems = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :system_name
      @systems = System.where("name LIKE '%#{params[:system_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes sistemas"
      if @systems.count == 0
        flash[:error] = "No se encontró un sistema que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @system = System.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @system }
    end
  end
  
  def create
    @system = System.new(params[:system])

    respond_to do |format|
      if @system.save
        flash[:success] = "El sistema fue creado exitosamente"
        format.html { redirect_to @system}
        format.json { render :json =>  @system, :status =>  :created, :location =>  @system }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @system.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @system = System.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid system with id: #{params[:id]}")
        flash[:alert] = "El sistema que busca no existe."
        redirect_to system_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @system }
    end
  end
  
  def edit
    if params[:id]
      begin
        @system = System.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid  system with id: #{params[:id]}")
        flash[:alert] = "El sistema que busca no existe"
        redirect_to system_path and return
      end
    end        
  end
  
  def update
    @system = System.find(params[:id])

    respond_to do |format|
      if @system.update_attributes(params[:system])
        flash[:success] = "El sistema fue actualizado exitosamente"
        format.html { redirect_to system_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @system.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
        @system = System.find(params[:id])
        @system.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid system with id: #{params[:id]}")
        flash[:alert] = "El sistema  que usted busca no existe."
        redirect_to system_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Sistema eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
