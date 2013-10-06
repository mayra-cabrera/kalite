# -*- coding: utf-8 -*-
class RtfDomainsController < ApplicationController
  before_filter :authenticate_programmer!
  
  def import_file
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_domain = RtfDomain.new
  end
  
  def create_file
    #rails stop
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_domain = RtfDomain.new(params[:rtf_domain])
    if @rtf_domain.save
      @rtf_domain.update_attribute(:formal_technical_review_id, @rtf.id)
      redirect_to :action => "read_file", :rtf_id => @rtf.id, :rtf_domain_id => @rtf_domain.id
   else
      flash.delete(:success)
      flash[:error] = "El archivo no es válido, seleccione un archivo XML"
      render :action => "import_file"
   end

    
  end

  
  def read_file
    @rtf_domain = RtfDomain.find(params[:rtf_domain_id])
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    flash[:success] = "Archivo ingresado exitosamente"
    redirect_to :action => "show_concepts", :rtf_id => @rtf.id, :rtf_domain_id => @rtf_domain.id
  end
  
  def show_concepts
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_domain = RtfDomain.find(params[:rtf_domain_id])
    rtf_concepts = RtfConcept.where(:rtf_id => @rtf.id)
    @concepts = []
    rtf_concepts.each do |rtf|
      @concepts << Concept.find(rtf.concept_id)
    end
    
    logger.info("CONCEPTS"  + @concepts.inspect)
  end
  
  def evaluate_concepts
  #  rails stop
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    rtf_concepts = RtfConcept.where(:rtf_id => @rtf.id)
    rtf_concepts.each do |rtf_concept|
      grade = params[rtf_concept.concept_id.to_s]
      weight = rtf_concept.weight
      total = grade.to_i * weight
      
      rtf_concept.update_attribute(:grade, grade)
      rtf_concept.update_attribute(:total, total)
    end
    flash[:success] = "Revisión técnica formal calificada correctamente"
    redirect_to :action => "show_results", :rtf_id => @rtf.id
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
    
    Score.all.each do |score|
      @name = score.get_scale(@percentage)
      if(@name != "")
        @rtf.update_attribute(:score_id, score.id)
        break
      end
    end
  end
end
