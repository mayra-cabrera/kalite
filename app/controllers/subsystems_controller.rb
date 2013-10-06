# -*- coding: utf-8 -*-
class SubsystemsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Subsystem.order('created_at DESC').all
    @subsystems = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :subsystem_name
      @subsystems = Subsystem.where("name LIKE '%#{params[:subsystem_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes subsistemas"
      if @subsystems.count == 0
        flash[:error] = "No se encontró un subsistema que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @subsystem = Subsystem.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @subsystem }
    end
  end
  
  def create
    @subsystem = Subsystem.new(params[:subsystem])

    respond_to do |format|
      if @subsystem.save
        flash[:success] = "El subsistema fue creado exitosamente"
        format.html { redirect_to @subsystem}
        format.json { render :json =>  @subsystem, :status =>  :created, :location =>  @subsystem }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @subsystem.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @subsystem = Subsystem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid subsystem with id: #{params[:id]}")
        flash[:alert] = "El subsistema que busca no existe."
        redirect_to subsystem_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @subsystem }
    end
  end
  
  def edit
    if params[:id]
      begin
        @subsystem = Subsystem.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid subsystem with id: #{params[:id]}")
        flash[:alert] = "El subsistema que busca no existe"
        redirect_to subsystem_path and return
      end
    end        
  end
  
  def update
    @subsystem = Subsystem.find(params[:id])

    respond_to do |format|
      if @subsystem.update_attributes(params[:subsystem])
        flash[:success] = "El subsistema fue actualizado exitosamente"
        format.html { redirect_to subsystem_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @subsystem.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
        @subsystem = Subsystem.find(params[:id])
        @subsystem.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid subsystem with id: #{params[:id]}")
        flash[:alert] = "El subsistema  que usted busca no existe."
        redirect_to system_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Subsistema eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
