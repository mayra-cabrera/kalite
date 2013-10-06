# -*- coding: utf-8 -*-
class ProgrammerHomeController < ApplicationController
  before_filter :authenticate_programmer!
  
  def show_formal_technical_reviews
    result = FormalTechnicalReview.where(:programmer_id => current_programmer.id)
    @rtf = Kaminari.paginate_array(result).page(params[:page]).per(5)
    @diagram = Diagram.find_by_folio("CU")
    if params.include? :subsystem_name
      subsystems = Subsystem.where("name LIKE '%#{params[:subsystem_name]}%'").select(:id)
      tmp = []
      subsystems.each do |sub|
        tmp << sub.id
      end
      @rtf = FormalTechnicalReview.where(:subsystem_id => tmp, :programmer_id => current_programmer.id).page(params[:page]).per(5)
      flash[:success] = "Se encontraron los siguientes subsistemas "
      if @rtf.count == 0
        flash[:error] = "No sé encontró un subsistema que coincida con los criterios de búsqueda"
      end
    end
  end
  
  def help_options
    
  end
  
  def rtf_detail
    @rtf = FormalTechnicalReview.find(params[:rtf_id])  
    @concepts = RtfConcept.where(:rtf_id => @rtf.id).order(:concept_id).page(params[:page]).per(5)
    @total_concepts = RtfConcept.where(:rtf_id => @rtf.id).count
  end
  
  def show_results
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    sections = Section.where(:diagram_id =>  @rtf.diagram.id)
    @rtf_concepts = RtfConcept.where(:rtf_id => @rtf.id)
    @concepts = []
    @rtf_concepts.each do |rtf|
      @concepts << Concept.find(rtf.concept_id)
    end
    @sections_concept = Hash.new
    sections.each do |s|
      concept = @concepts.select { | concept | concept.section_id == s.id} 
      tmp = []
      concept.each do | concept |
        tmp << concept.description
        weight = RtfConcept.where(:concept_id => concept.id, :rtf_id => @rtf.id).first.weight
        tmp << sprintf("%.3f", weight)
        grade = RtfConcept.where(:concept_id => concept.id, :rtf_id => @rtf.id).first.grade
        total = RtfConcept.where(:concept_id => concept.id, :rtf_id => @rtf.id).first.total
        tmp << grade
        tmp << sprintf("%.3f", total)

      end
      @sections_concept[s.name] = tmp
    end
    @total_weight = 0
    @total = 0
    @total_wanted = 0
    @rtf_concepts.each do | concept |
      @total_weight = @total_weight + concept.weight
      @total = @total + concept.total
      @total_wanted = @total_wanted + (concept.weight * 4)
    end
    @percentage = (@total * 100 ) / @total_wanted
    logger.info("SECTIONS_CONCEPTS " + @sections_concept.inspect)
    logger.info("TOTAL_WANTED " + @total_wanted.inspect)
    
  end
end
