# -*- coding: utf-8 -*-
class FormalTechnicalRevisionController < ApplicationController
  before_filter :authenticate_administrator!
  
  def new_rtf
    @subsystems = Subsystem.order(:name).page(params[:page]).per(5) 
    if params.include? :subsystem_name
      @subsystems = Subsystem.where("name LIKE '%#{params[:subsystem_name]}%'").page(params[:page]).per(5)
      flash.delete(:error)
      flash[:success] = "Se encontraron los siguientes subsistemas"
      if @subsystems.count == 0
        flash.delete(:success)
        flash[:error] = "No se encontró un subsistema que coincidera con los criterios de búsqueda"
      end 
    end
  end
  
  def choose_programmer_and_model
    @subsystem = Subsystem.find(params[:format])
    @programmers = Programmer.order(:first_name)
    @diagrams = Diagram.order(:name)
  end
  
  def choose_attributes_per_model
    @diagram_attributes = Hash.new
    @subsystem = Subsystem.find(params[:subsystem_id])
    @programmer = Programmer.find(params[:programmer][:id])
    @diagram = Diagram.find(params[:diagram_id])
    @attributes = Attribute.order(:name)
    
    attributes = @diagram.get_attributes
    @diagram_attributes[@diagram] = attributes
  end
  
  def choose_concepts
    
    @subsystem = Subsystem.find(params[:subsystem_id])
    @programmer = Programmer.find(params[:programmer_id])
    @diagram = Diagram.find(params[:diagram_id])
    
    @attributes = params[@diagram.id.to_s].keys
    logger.info("ATTRIBUTES: " + @attributes.inspect)
    @weights = []
    params["w_" +  @diagram.id.to_s].each_value{|value| @weights << value}
    logger.info("WEIGHTS: " + @weights.inspect)
    @concepts = Concept.ordered.where(:diagram_id => @diagram.id)
  end
  
  def save_rtf
    programmer = Programmer.find(params[:programmer_id])
    subsystem = Subsystem.find(params[:subsystem_id])
    diagram = Diagram.find(params[:diagram_id])
    @rtf = FormalTechnicalReview.create!(:administrator_id => current_administrator.id, :programmer_id => programmer.id, :subsystem_id => subsystem.id, :diagram_id => diagram.id, :result => 0)
    attributes = params[:attributes]
    weights = params[:weigths]
    count = 0
    concepts = params[:concepts].keys
    attributes.each do |a|
      attribute = Attribute.find(a.to_i)
      weight = weights[count]
      @rtf_attribute = RtfAttribute.create!(:attribute_id => attribute.id, :rtf_id => @rtf.id, :weight => weight.to_f)
      number_concepts = attribute.how_many_concepts(concepts, attribute.id)
      weight_for_concept = @rtf_attribute.weight / number_concepts
      concepts_attribute = attribute.return_concepts(concepts, attribute.id)
      attribute.create_rtf_concepts(concepts_attribute, @rtf.id, weight_for_concept)
      count = count + 1
    end

    
    flash[:success] = 'Revisión Técnica Formal creada exitosamente'
    redirect_to :controller => "administrator_home", :action => 'show_formal_technical_reviews'
  end
end
