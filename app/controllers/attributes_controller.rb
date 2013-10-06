# -*- coding: utf-8 -*-
class AttributesController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Attribute.all
    @attributes = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :attribute_name
      @attributes = Attribute.where("name LIKE '%#{params[:attribute_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes atributos"
      if @attributes.count == 0
        flash[:error] = "No se encontró un atributo que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @attribute = Attribute.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @attribute }
    end
  end
  
  def create
    @attribute = Attribute.new(params[:attribute])

    respond_to do |format|
      if @attribute.save
        flash[:success] = "El atributo fue creado exitosamente"
        format.html { redirect_to @attribute }
        format.json { render :json =>  @attribute, :status =>  :created, :location =>  @attribute }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @attribute.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @attribute = Attribute.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid attribute with id: #{params[:id]}")
        flash[:alert] = "El atributo que busca no existe."
        redirect_to attribute_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @attribute }
    end
  end
  
  def edit
    if params[:id]
      begin
        @attribute = Attribute.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid attribute with id: #{params[:id]}")
        flash[:alert] = "El atributo que busca no existe"
        redirect_to attribute_path and return
      end
    end        
  end
  
  def update
    @attribute = Attribute.find(params[:id])

    respond_to do |format|
      if @attribute.update_attributes(params[:attribute])
        flash[:success] = "El atributo fue actualizado exitosamente"
        format.html { redirect_to attribute_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @attribute.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @attribute = Attribute.find(params[:id])
        @attribute.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid attribute with id: #{params[:id]}")
        flash[:alert] = "El atributo que usted busca no existe."
        redirect_to attribute_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Atributo eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
