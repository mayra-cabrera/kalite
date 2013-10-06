# -*- coding: utf-8 -*-
class Management::ProgrammersController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Programmer.all
    @programmers = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :programmer_name
      @programmers = Programmer.where("first_name LIKE '%#{params[:programmer_name].upcase}%' OR last_name LIKE '%#{params[:programmer_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes programadores"
      if @programmers.count == 0
        flash[:error] = "No se encontró un programador que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @programmer = Programmer.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @programmer }
    end
  end
  
  def create
    @programmer = Programmer.new(params[:programmer])

    respond_to do |format|
      if @programmer.save
        flash[:success] = "El programador fue creado exitosamente"
        format.html { redirect_to management_programmers_path }
        format.json { render :json =>  @programmer, :status =>  :created, :location =>  @programmer }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @programmer.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @programmer = Programmer.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid programmer with id: #{params[:id]}")
        flash[:alert] = "El programador que busca no existe."
        redirect_to management_programmer_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @programmer }
    end
  end
  
  def edit
    if params[:id]
      begin
        @programmer = Programmer.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid programmer with id: #{params[:id]}")
        flash[:alert] = "El programmer que busca no existe"
        redirect_to management_programmers_path and return
      end
    end        
  end
  
  def update
    @programmer = Programmer.find(params[:id])

    respond_to do |format|
      if @programmer.update_attributes(params[:programmer])
        flash[:success] = "El programador fue actualizado exitosamente"
        format.html { redirect_to management_programmers_path}
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @programmer.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
        @programmer = Programmer.find(params[:id])
        @programmer.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid programmer with id: #{params[:id]}")
        flash[:alert] = "El programador que usted busca no existe."
        redirect_to management_programmers_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Programador eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
