# -*- coding: utf-8 -*-
class ConceptsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    result = Concept.all
    @concepts = Kaminari.paginate_array(result).page(params[:page]).per(10)
    @diagrams = Diagram.all
    @active = ""
    if(params[:id])
      @concepts = Concept.where(:diagram_id =>  params[:id]).page(params[:page]).per(10)
      @active = params[:id].to_i
    end
    
    if params.include? :description
      @concepts= Concept.where("description LIKE '%#{params[:description]}%'").page(params[:page]).per(10)
      flash[:success] = "Se encontraron los siguientes conceptos"
      if @concepts.count == 0
        flash[:error] = "No se encontró un un concepto que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def new
    @concept = Concept.new
    @sections = Section.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json =>  @concept }
    end
  end
  
  def create
    @concept = Concept.new(params[:concept])
    @sections = Section.all
    logger.info("CONCEPT.... " + @concept.inspect)
    @concept.is_automatic = false
    respond_to do |format|
      if @concept.save
        diagram = @concept.diagram.folio
        logger.info("diagram.... " + diagram.inspect)
        num = Concept.all.count.to_s
        folio = diagram + "_" + num
        logger.info("NUMERO: " + num.inspect)
        @concept.update_attribute(:folio, folio)
        
        flash[:success] = "El concepto fue creado exitosamente"
        format.html { redirect_to @concept }
        format.json { render :json =>  @concept, :status =>  :created, :location =>  @concept }
      else
        format.html { render :action =>  "new" }
        format.json { render :json =>  @concept.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def show
    @diagrams = Diagram.all
    if params[:id]
      begin
        @concept = Concept.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid concept with id: #{params[:id]}")
        flash[:alert] = "El concepto que busca no existe."
        redirect_to concept_path and return
      end
    end    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json =>  @concept }
    end
  end
  
  def edit
    @sections = Section.all
    if params[:id]
      begin
        @concept = Concept.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid concept with id: #{params[:id]}")
        flash[:alert] = "El concepto que busca no existe"
        redirect_to attribute_path and return
      end
    end        
  end
  
  def update
    @sections = Section.all
    @concept = Concept.find(params[:id])

    respond_to do |format|
      if @concept.update_attributes(params[:concept])
        flash[:success] = "El concepto fue actualizado exitosamente"
        format.html { redirect_to concept_path}
        format.json { head :ok }
      else
        format.html { render :action =>  "edit" }
        format.json { render :json =>  @concept.errors, :status =>  :unprocessable_entity }
      end
    end
  end
  
  def destroy
    if params[:id]
      begin
         @concept = Concept.find(params[:id])
        @concept.destroy
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access an invalid concept with id: #{params[:id]}")
        flash[:alert] = "El concepto que usted busca no existe."
        redirect_to attribute_path and return
      end
      
    end    
    
    respond_to do |format|
      format.html { redirect_to :action => 'index'}
      flash[:success] = "Concepto eliminado exitosamente"
      format.json { head :ok }
    end
  end
  
end
