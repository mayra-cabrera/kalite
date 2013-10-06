# -*- coding: utf-8 -*-
class DiagramsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Diagram.all
    @diagrams= Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :diagram_name
      @diagrams = Diagram.where("name LIKE '%#{params[:diagram_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes diagramas"
      if @diagrams.count == 0
        flash[:error] = "No se encontró un diagrama que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @diagram = Diagram.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @diagram }
    end
  end
  
  def create
    @diagram = Diagram.new(params[:diagram])
    

    respond_to do |format|
      if @diagram.save
        flash[:success] = "El diagrama fue creado exitosamente"
        format.html { redirect_to @diagram }
        format.json { render :json =>  @diagram, :status =>  :created, :location =>  @diagram }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @diagram.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @diagram = Diagram.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid diagram with id: #{params[:id]}")
        flash[:alert] = "El diagrama que busca no existe."
        redirect_to diagram_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @diagram }
    end
  end
  
  def edit
    if params[:id]
      begin
        @diagram = Diagram.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid course with id: #{params[:id]}")
        flash[:alert] = "El diagrama que busca no existe"
        redirect_to diagram_path and return
      end
    end        
  end
  
  def update
    @diagram = Diagram.find(params[:id])

    respond_to do |format|
      if @diagram.update_attributes(params[:diagram])
        flash[:success] = "El diagrama fue actualizado exitosamente"
        format.html { redirect_to diagram_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @diagram.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @diagram = Diagram.find(params[:id])
        @diagram.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid diagram with id: #{params[:id]}")
        flash[:alert] = "El diagram que usted busca no existe."
        redirect_to diagram_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Diagrama eliminado exitosamente"
      format.json { head :ok }
    end
  end
  
end
