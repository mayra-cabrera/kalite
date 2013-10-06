# -*- coding: utf-8 -*-
class AssignmentsController < ApplicationController
  before_filter :authenticate_administrator!
  
  def index
    @system_types = SystemType.all
    if(params[:id])
      @assignments = Assignment.where(:system_type_id => params[:id]).group("diagram_id")
      logger.info("Assignments: " + @assignments.inspect)
      @active = params[:id].to_i
    end
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    @assignment = Assignment.find(params[:id])
    @all_assignments = Assignment.where(:system_type_id => @assignment.system_type_id, :diagram_id => @assignment.diagram_id)
    logger.info("Assignment: " + @assignment.inspect)
    if params[:id]
      begin
        @assignment =Assignment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid assignment  with id: #{params[:id]}")
        flash[:alert] = "La asignación que busca no existe"
        redirect_to assignment_path and return
      end
    end  
  end
  
  def update
   # rails stop
    @assignment = Assignment.find(params[:id])
    attributes = Attribute.all
    attributes.each do |attribute|
      weight = params["d_" + attribute.id.to_s]
      Assignment.where(:system_type_id => @assignment.system_type_id, :diagram_id => @assignment.diagram_id, :attribute_id => attribute.id).first.update_attribute(:weight, weight)
    end
    
     respond_to do |format|
      flash[:success] = "Pesos actualizados exitosamente"
      format.html { redirect_to @assignment}
      format.json { render :json =>  @assignment, :status =>  :created, :location =>  @assignment }
    end
  end
  
  def show
    @assignment = Assignment.find(params[:id])
    @all_assignments = Assignment.where(:system_type_id => @assignment.system_type_id, :diagram_id => @assignment.diagram_id)
  end
  
end
