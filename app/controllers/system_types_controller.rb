# -*- coding: utf-8 -*-
class SystemTypesController <  ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = SystemType.all
    @system_types = Kaminari.paginate_array(result).page(params[:page]).per(5)
    
    if params.include? :system_type_name
      @system_types = SystemType.where("name LIKE '%#{params[:system_type_name]}%'").page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes sistemas"
      if @system_types.count == 0
        flash[:error] = "No se encontró un sistema que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @system_type = SystemType.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @diagram }
    end
  end
  
  def create
    @system_type = SystemType.new(params[:system_type])

    respond_to do |format|
      if @system_type.save
        flash[:success] = "El tipo de sistema fue creado exitosamente"
        format.html { redirect_to @system_type }
        format.json { render :json =>  @system_type, :status =>  :created, :location =>  @system_type }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @system_type.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    if params[:id]
      begin
        @system_type = SystemType.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid system_type with id: #{params[:id]}")
        flash[:alert] = "El tipo de sistema que busca no existe."
        redirect_to system_type_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @system_type }
    end
  end
  
  def edit
    if params[:id]
      begin
        @system_type = SystemType.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid system_type with id: #{params[:id]}")
        flash[:alert] = "El tipo de sistema que busca no existe"
        redirect_to system_type_path and return
      end
    end        
  end
  
  def update
    @system_type = SystemType.find(params[:id])

    respond_to do |format|
      if @system_type.update_attributes(params[:system_type])
        flash[:success] = "El tipo de sistema fue actualizado exitosamente"
        format.html { redirect_to system_type_path }
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @system_type.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @system_type = SystemType.find(params[:id])
        @system_type.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid system_type with id: #{params[:id]}")
        flash[:alert] = "El tipo de sistema que usted busca no existe."
        redirect_to system_type_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Tipo de sistema eliminado exitosamente"
      format.json { head :ok }
    end
  end
end
