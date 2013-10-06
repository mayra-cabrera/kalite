# -*- coding: utf-8 -*-
class RtfUseCasesController < ApplicationController
  before_filter :authenticate_programmer!
  
  def import_file_domain
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_domain = RtfDomain.new
  end
  
  def create_file_domain
    @rtf_domain = RtfDomain.new(params[:rtf_domain])
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
   # logger.info(Rails.root.to_s.inspect)
   # rails stop
    if @rtf_domain.save
      if(@rtf_domain.is_domain)
        @rtf_domain.update_attribute(:formal_technical_review_id, @rtf.id)
        flash[:success] = "Modelo de dominio ingresado exitosamente"
        redirect_to :action => "import_file", :rtf_id => @rtf.id, :rtf_domain_id => @rtf_domain.id
      else
        flash[:error] = "El archivo no corresponde a un modelo de dominio"
        render :action => "import_file_domain", :rtf_id => @rtf.id
      end
    else
      flash.delete(:success)
      flash[:error] = "El archivo no es válido, seleccione un archivo xmi"
      render :action => "import_file"
    end
  end
  
  def import_file
    @rtf_domain = RtfDomain.find(params[:rtf_domain_id])
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_usecase = RtfUseCase.new
  end
  
  def create_file
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_usecase = RtfUseCase.new(params[:rtf_use_case])
    @rtf_domain = RtfDomain.find(params[:rtf_domain_id])
    if @rtf_usecase.save
      if(@rtf_usecase.is_usecase)
        @rtf_usecase.update_attribute(:formal_technical_review_id, @rtf.id)
        redirect_to :action => "evaluate_automatic_concepts", :rtf_id => @rtf.id, :rtf_use_case_id => @rtf_usecase.id, :rtf_domain_id => @rtf_domain.id
      else
        flash[:error] = "El archivo no corresponde a un modelo de casos de uso"
        render :action => "import_file", :rtf_id => @rtf.id, :rtf_domain_id => @rtf_domain.id
      end
      
   else
      flash.delete(:success)
      flash[:error] = "El archivo no es válido, seleccione un archivo xmi"
      render :action => "import_file"
   end
  end
 
  def evaluate_automatic_concepts
    @rtf_domain = RtfDomain.find(params[:rtf_domain_id])
    @rtf_usecase = RtfUseCase.find(params[:rtf_use_case_id])
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @concepts = Concept.where(:diagram_id => @rtf.diagram_id, :is_automatic => true)
    @rtf_concepts = []
    rtf_concept = RtfConcept.where(:rtf_id => @rtf.id)
    rtf_concept.each do |rtf_c|
      if(rtf_c.concept.is_automatic)
        @rtf_concepts << rtf_c.concept_id.to_i
      end
    end
    @rtf_concepts.sort!
    
    
    actors_domain = @rtf_domain.get_actors_name
    @actors_domain = actors_domain
    @actors_domain.sort!
    actors_use_case = @rtf_usecase.get_actors_name
    @actors_use_case = actors_use_case
    @actors_use_case.sort!
    name_use_case = @rtf_usecase.get_name_of_usecases
    @name_use_case = name_use_case
    packages = @rtf_usecase.get_packages
    @packages = packages
    all_tests = @rtf_usecase.all_test
    @tests = all_tests
    actors_count = @rtf_usecase.get_actors
    @actors_count = actors_count 
    use_cases_packages = @rtf_usecase.get_all_uses_cases_from_packages(packages)
    @use_cases_without_packages =  name_use_case  - use_cases_packages 
    case_test = @rtf_usecase.get_tests
    use_cases_id = @rtf_usecase.get_use_cases_id
    case_test_with_use_case = @rtf_usecase.match_case_test_with_use_case(use_cases_id)
    @usescases_with_test = case_test_with_use_case
    all_test_with_status = @rtf_usecase.all_test_with_status
    all_test_with_types = @rtf_usecase.all_test_with_types
    use_cases_with_description = @rtf_usecase.get_usecases_with_descriptions
    escenarios = @rtf_usecase.get_scenarios
    @use_cases_with_escenarios = []
    escenarios.each do |e| 
      @use_cases_with_escenarios << use_cases_id[e]
    end
    altern_scenarios = @rtf_usecase.get_altern_scenarios
    @use_cases_with_altern_scenarios = []
    altern_scenarios.each do |as|
      @use_cases_with_altern_scenarios << use_cases_id[as]
    end
    
    compounds = @rtf_usecase.compound_use_cases
    @use_cases_with_compounds = []
    compounds.each do |c|
      @use_cases_with_compounds << use_cases_id[c]
    end
    
    requerimients_name = @rtf_usecase.get_requerimients_name(packages)
    requerimients_id = @rtf_usecase.get_requerimients_id(requerimients_name)
    requerimients_with_use_cases = @rtf_usecase.match_use_case_with_requerimients(requerimients_id)
      
    
    if @rtf_concepts.include? 3 
      @grade_concept_3 = @rtf_usecase.concept_3(actors_domain, actors_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 5
      @grade_concept_5 = @rtf_usecase.concept_5(actors_use_case, @rtf.id)  
    end
    
    if @rtf_concepts.include? 6
      @grade_concept_6 = @rtf_usecase.concept_6(actors_count, actors_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 10
      @grade_concept_10 = @rtf_usecase.concept_10(name_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 12
      @grade_concept_12 = @rtf_usecase.concept_12(packages, name_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 14
      @grade_concept_14 = @rtf_usecase.concept_14(name_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 16
      @grade_concept_16 = @rtf_usecase.concept_16(requerimients_with_use_cases, use_cases_id, name_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 17
      @grade_concept_17 = @rtf_usecase.concept_17(case_test, use_cases_id, name_use_case, @rtf.id)
    end
    
    if @rtf_concepts.include? 19
      @grade_concept_19 = @rtf_usecase.concept_19(all_tests, all_test_with_status, @rtf.id)
    end
    
    if @rtf_concepts.include? 20
      @grade_concept_20 = @rtf_usecase.concept_20(all_tests, all_test_with_types, @rtf.id)
    end
    
    if @rtf_concepts.include? 21
      @grade_concept_21 = @rtf_usecase.concept_21(name_use_case, use_cases_with_description, @rtf.id)
    end
    
    if @rtf_concepts.include? 25
      @grade_concept_25 = @rtf_usecase.concept_25(name_use_case, @use_cases_with_escenarios, @rtf.id)
    end
    
    if @rtf_concepts.include? 26
      @grade_concept_26 = @rtf_usecase.concept_26(name_use_case, @use_cases_with_altern_scenarios, @rtf.id)
    end
    
    if @rtf_concepts.include? 29
      @grade_concept_29 = @rtf_usecase.concept_29(compounds, escenarios, altern_scenarios, @rtf.id)
    end
    
    @bad_actors = @actors_use_case - @actors_domain
    @bad_actors_singular = @actors_use_case.count - @rtf_usecase.get_actors_singular_count(@actors_use_case)
    @total_use_cases = @rtf_usecase.get_usescases
    @good_descriptions = @rtf_usecase.get_number_of_good_descriptions(name_use_case)
    @use_cases_from_package = @rtf_usecase.get_how_many_use_cases_from_packages(packages)
    @repeated_use_cases = @rtf_usecase.get_same_use_cases(name_use_case)
    @use_cases_with_requerimients = requerimients_with_use_cases.count
    @test_with_status = all_test_with_status.count
    @test_with_types = all_test_with_types.count
    @how_many_use_cases_with_description = use_cases_with_description.count
    @good_compounds = @rtf_usecase.get_compunds_without_scenarios(compounds, escenarios, altern_scenarios)
#    descriptions_use_case = @rtf_usecase.get_descriptions_of_usecases
    #@descriptions = descriptions_use_case
#    use_cases = @rtf_usecase.get_usescases
#    
#    use_cases_id = @rtf_usecase.get_use_cases_id()
#    
#    case_test = @rtf_usecase.get_tests
   
#    @tests_with_status = all_test_with_status
#    
#    @tests_with_type = all_test_with_types
#    
#    @use_cases_with_description = use_cases_with_description
#    escenarios = @rtf_usecase.get_scenarios
#    @use_cases_with_escenarios = []
#    escenarios.each do |e| 
#      @use_cases_with_escenarios << use_cases_id[e]
#    end
#    altern_scenarios = @rtf_usecase.get_altern_scenarios
#    @use_cases_with_altern_scenarios = []
#    altern_scenarios.each do |as|
#      @use_cases_with_altern_scenarios << use_cases_id[as]
#    end
#    
#    compounds = @rtf_usecase.compound_use_cases()
#    @use_cases_with_compounds = []
#    compounds.each do |c|
#      @use_cases_with_compounds << use_cases_id[c]
#    end
#    
#    all_scenarios = []
#    altern_scenarios.each do |a| all_scenarios << a end
#    escenarios.each do |e| all_scenarios << e end
#    all_scenarios.uniq!
#    @all_use_cases_with_any_scenario = [] 
#    all_scenarios.each do |all|
#      @all_use_cases_with_any_scenario << use_cases_id[all]
#    end
#    

  end
 
  
  def show_concepts
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    rtf_concepts = RtfConcept.where(:rtf_id => @rtf.id)
    @concepts = []
    rtf_concepts.each do |rtf|
      concept = Concept.find(rtf.concept_id)
      if(!concept.is_automatic)
        @concepts << Concept.find(rtf.concept_id)
      end
      
    end
    
    logger.info("CONCEPTS"  + @concepts.inspect)
  end
  
  def evaluate_concepts
  #  rails stop
    @rtf = FormalTechnicalReview.find(params[:rtf_id])
    @rtf_concepts = RtfConcept.where(:rtf_id => @rtf.id)
    @rtf_concepts.each do |rtf_concept|
      if(params[rtf_concept.concept_id.to_s])
        grade = params[rtf_concept.concept_id.to_s]
        weight = rtf_concept.weight
        total = grade.to_i * weight
      
        rtf_concept.update_attribute(:grade, grade)
        rtf_concept.update_attribute(:total, total)
      end
    end
    
    total_weight = 0
    total = 0
    total_wanted = 0
    @rtf_concepts.each do | concept |
      total_weight = total_weight + concept.weight
      total = total + concept.total
      total_wanted = total_wanted + (concept.weight * 4)
    end
    @percentage = (total * 100 ) / total_wanted
    @rtf.update_attribute(:result, @percentage)
    
    Score.all.each do |score|
      id = score.get_id(@percentage)
      if(id != "")
        @rtf.update_attribute(:score_id, id)
        break
      end
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
    
    
  end
  
  
  
  
end
