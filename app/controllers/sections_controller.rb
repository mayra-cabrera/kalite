# -*- coding: utf-8 -*-
class SectionsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Section.all
    @sections = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :section_name
      @sections = Section.where("name LIKE '%#{params[:section_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron las siguientes secciones"
      if @sections.count == 0
        flash[:error] = "No se encontró una sección que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @section = Section.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @section }
    end
  end
  
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        flash[:success] = "La sección fue creada exitosamente"
        format.html { redirect_to @section }
        format.json { render :json =>  @section, :status =>  :created, :location =>  @section }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @section.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @section = Section.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid section with id: #{params[:id]}")
        flash[:alert] = "La sección que busca no existe."
        redirect_to section_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @section }
    end
  end
  
  def edit
    if params[:id]
      begin
        @section = Section.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid section with id: #{params[:id]}")
        flash[:alert] = "La sección que busca no existe"
        redirect_to section_path and return
      end
    end        
  end
  
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        flash[:success] = "La sección fue actulizada exitosamente"
        format.html { redirect_to section_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @section.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @section = Section.find(params[:id])
        @section.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid section with id: #{params[:id]}")
        flash[:alert] = "La sección que usted busca no existe."
        redirect_to section_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Sección eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
