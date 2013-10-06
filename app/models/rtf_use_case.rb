# -*- coding: utf-8 -*-
class RtfUseCase < ActiveRecord::Base
  has_attached_file :attach, :default_url => "public/files/",  :path => "public/files/:id/_:filename"
  validates_attachment_content_type :attach, :content_type => 'text/xml'
  
  
  def is_usecase
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    array = doc.xpath("//UML:Package")
    name = array.first.attributes["name"].value
    name.downcase!
    logger.info("NOMBRE" + name.inspect)
    if(name == "use case model" || name == "modelo de casos de uso")
      
      return true
    else
      return false
    end
  end
  
  def get_actors_name
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    actors_array = doc.xpath("//UML:Actor")
    names = []
    actors_array.each do | actor|
      if(actor.attributes.has_key?("name"))
        names << actor.attributes.first.last.value
      end
    end
    logger.info("ACTORES_CASOS_USO " + names.inspect)
    return names
  end
  
  def get_actors
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    actors_array = doc.xpath("//UML:Actor")
    logger.info("NO. ACTORES: "  + actors_array.count.inspect)
    return actors_array.length
  end
  
  def get_usescases
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    how_many_cases = doc.xpath("//UML:UseCase").count
    logger.info("HOW_MANY_CASES " + how_many_cases.inspect)
    return how_many_cases
  end
  
  def get_name_of_usecases
    names = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    use_cases = doc.xpath("//UML:UseCase")
    use_cases.each do |use|
      names << use.attributes.first.last.value
    end
    logger.info("NAMES: " + names.inspect)
    return names
  end
  
  def get_descriptions_of_usecases
    descriptions = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    use_case_hash = doc.xpath("//UML:UseCase/UML:ModelElement.taggedValue/UML:TaggedValue")
    use_case_hash.each do |use_case|
      if(use_case.attributes.first.last.value == "documentation")
        descriptions << use_case.attributes["value"].value
      end
      
    end
    logger.info("DESCRIPTIONS: " + descriptions.inspect)
    return descriptions
  end
  
  def get_packages
    array_packages = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    packages = doc.xpath("//UML:Package")
    packages.each do |package|
      array_packages << package.attributes["name"].value
    end
    array_packages.delete_if { |x| x == "Use Case Model" || x == "Actors" || x == "System Boundary"  || x == "Model"}
    logger.info("ARRAY_PACKAGES: " + array_packages.inspect)
    return array_packages
  end
  
  def get_use_cases_from_package(package)
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    packages = doc.xpath("//UML:Package")
    names = []
    packages.each do |p|
      if(p.attributes["name"].value == package)
        p.children.children.each do |children|
          if(children.name == "UseCase")
            names << children.attributes.first.last.value
          end
        end
        break
      end
    end
#    logger.info("CASES IN THE PACKAGE: " + names.inspect)
    return names
  end
  
  def get_requerimients_name(packages)
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    requerimients = doc.xpath("//UML:ClassifierRole")
    array_requerimients = []
    tmp = []
    requerimients.each do |r|
      if (r.attributes["name"].nil? == false)
        tmp << r.attributes["name"].value
      end    
    end
    tmp.delete_if { |x| x == "Use Case Model" || x == "Actors" || x == "System Boundary"  || x == "Model"}
    array_requerimients = tmp - packages
    logger.info("REQUERIMIENTOS_NOMBRE " + array_requerimients.inspect)
  end
  
  def get_requerimients_id(packages)
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    requerimients = doc.xpath("//UML:ClassifierRole")
    hash_requerimients = Hash.new
    requerimients.each do |r|
      if (r.attributes["name"].nil? == false)
        name = r.attributes["name"].value
        if(packages.include? name)
          hash_requerimients[r.attributes["xmi.id"].value] = name 
        end
      end
      
    end
    logger.info("REQUERIMIENTOS_ID" + hash_requerimients.inspect)
    return hash_requerimients
  end
  
  def get_use_cases_id()
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    use_cases = doc.xpath("//UML:UseCase")
    hash_use_cases = Hash.new
    use_cases.each do |use_case|
      hash_use_cases[use_case.attributes["xmi.id"].value] =  use_case.attributes["name"].value
    end
    logger.info("USE_CASES_ID" + hash_use_cases.inspect)
    return hash_use_cases
  end
  
  def match_use_case_with_requerimients(requerimients_id)
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    dependencies = doc.xpath("//UML:Dependency")
    requerimient_use_case = Hash.new
    dependencies.each do |d|
      client = d.attributes["client"]
      supplier = d.attributes["supplier"]
      requerimient_use_case[requerimients_id[supplier.to_s]] = client.to_s
    end
    logger.info("REQUERIMIENTS WITH USE_CASE" + requerimient_use_case.inspect)
    return requerimient_use_case
  end
  
  def get_tests
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    tests = doc.xpath("//EATest")
    hash_test = Hash.new
    tests.each do |test|
      if(!hash_test.has_value?(test.attributes["subject"].value))
        hash_test[test.attributes["name"].value] = test.attributes["subject"].value
      end
      
    end
    logger.info("TEST WITH USE_CASE" + hash_test.inspect)
    return hash_test
  end
  
  
  def match_case_test_with_use_case(use_cases_id)
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    tests = doc.xpath("//EATest")
    tests_use_cases = Hash.new
    tmp = []
    tests.each do |test|
      id = test.attributes["subject"].value
      name = use_cases_id[id]
      if(tests_use_cases.has_key?(name))
        tmp << test.attributes["name"].value
      else
        tmp = []
        tmp << test.attributes["name"].value
      end
      tests_use_cases[name] = tmp
    end

    logger.info("TESTS_USE_CASES" + tests_use_cases.inspect)
    return tests_use_cases
  end
  
  def all_test
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    tests = doc.xpath("//EATest")
    array = []
    tests.each do |test|
       array << test.attributes["name"].value
    end
    return array
  end
  
  def all_test_with_status
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    tests = doc.xpath("//EATest")
    array = []
    tests.each do |test|
      children = test.children.children
      children.each do |c|
        if(!c.attributes["tag"].nil? && c.attributes["tag"].value =="status")
          array << test.attributes["name"].value
        end
      end
     
    end
    return array
  end
  
  def all_test_with_types
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    tests = doc.xpath("//EATest")
    array = []
    tests.each do |test|
      if(test.attributes["type"].value != "none")
        array << test.attributes["name"].value
      end
    end
    return array
  end
  
  def get_usecases_with_descriptions
    use_cases = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    use_case_hash = doc.xpath("//UML:UseCase")
    use_case_hash.each do |use_case|
      children = use_case.children.children
      children.each do |c|
        if(!c.attributes["tag"].nil? && c.attributes["tag"].value == "documentation" )
          use_cases << use_case.attributes["name"].value
        end     
      end      
    end
    
    return use_cases
  end
  
  def get_scenarios()
    use_cases = []
    subjects = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    scenarios = doc.xpath("//EAModel.scenario/EAScenario")
    scenarios.each do |scene|
      if(scene.attributes["type"].value == "Basic Path")
        use_case = scene.attributes["subject"].value     
        if(!subjects.include? use_case)
          use_cases << use_case
        end     
      end
    end
    use_cases.uniq!
    logger.info("BASIC: " + use_cases.inspect)
    return use_cases
  end
  
  def get_altern_scenarios()
    use_cases = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    scenarios = doc.xpath("//EAModel.scenario/EAScenario")
    scenarios.each do |scene|
      if(scene.attributes["type"].value == "Alternate")
        use_case = scene.attributes["subject"].value
        use_cases << use_case
      end
    end
    use_cases.uniq!
    logger.info("ALTERN: " + use_cases.inspect)
    return use_cases
  end
  
  def compound_use_cases
    use_cases = []
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    diagrams = doc.xpath("//UML:Diagram/UML:ModelElement.taggedValue")
    diagrams.each do |diagram|
      childrens = diagram.children
      childrens.each do |children|
        if(children.attributes["tag"].nil? == false)
          if(children.attributes["tag"].value == "parent")
            use_cases << children.attributes["value"].value
          end
        end
      end
    end
    return use_cases
  end
  
#  def compound_use_cases
#    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
#    doc = Nokogiri::XML(File.open(path))
#    use_cases = []
#    compounds = doc.xpath("//UML:Association") 
#    compounds.each do |c|
#      childrens = c.children.children
#      childrens.each do |children|
#        if(children.name == "Stereotype" && children.attributes["name"].value == "include")
#          use_cases << get_source_in_compound(c)
#          break
#        end
#      end
#    end
#    use_cases.uniq!
#    logger.info("USE_CASES_NAME COMPOUNDS" + use_cases.inspect)
#    return use_cases
#  end
#  
#  def get_source_in_compound(compound)
#    compound.children.children.each do |c|
#      if(c.name == "AssociationEnd")
#        childrens = c.children.children
#        childrens.each do |chil|
#          if(chil.name == "TaggedValue")
#            if(chil.attributes["value"].to_s == "source")
#              return c.attributes["type"].value.to_s
#            end
#          end
#        end
#      end
#    end
#  end
  
  def get_all_uses_cases_from_packages(packages)
    package_usecases = Hash.new
    packages.each do |package|
      use_cases = get_use_cases_from_package(package)
      package_usecases[package] = use_cases
    end
    array = []
    package_usecases.each_value{|value| value.each do |v| array << v end} 
    return array
  end
  
  
  ###############Calificaciones#######################
  def concept_3(actors_domain, actors_use_case, rtf_id)
    logger.info("CONCEPTO 3")
    domain = []
    use_case = []
    actors_domain.each do |actor| domain << actor.upcase end
    actors_use_case.each do |actor| use_case << actor.upcase end
    intersection = domain & use_case
    grade = get_grade_concept_3(intersection, domain)
    update_rtf_concept(rtf_id, 3, grade)
    return grade
  end
  
  def get_grade_concept_3(result, must_be_result)
    logger.info("ACTORES QUE ESTÁN EN EL MODELO DE DOMINIO: " + result.inspect + " MODELO DE DOMINIO " + must_be_result.inspect)  
    result.sort!
    must_be_result.sort!
    if(result.empty?)
      return 1
    end
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    logger.info("MEDIUM: " + medium.inspect)
    if(medium == result.length)
      return 2
    end
    
    if(result.length > medium )
      return 3
    else
      return 1
    end
  end
  
  def concept_5(actors_use_case, rtf_id)
    logger.info("CONCEPTO 5")
    actors_singular = []
    actors_use_case.each do |actor|
      first_word = actor.split.first
      tmp = first_word.singularize
      if(tmp == actor.split.first)
        actors_singular << actor
      end
    end
    grade = get_grade_concept_5(actors_singular, actors_use_case)
    update_rtf_concept(rtf_id, 5, grade)
    return grade
  end
  
  def get_actors_singular_count(actors_use_case)
    actors_singular = []
    actors_use_case.each do |actor|
      first_word = actor.split.first
      tmp = first_word.singularize
      if(tmp == actor.split.first)
        actors_singular << actor
      end
    end
    return actors_singular.count
  end
  
  def get_grade_concept_5(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("ACTORES EN SINGULAR: " + result.inspect + " COMO DEBE SER " + must_be_result.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
       return 2
     end
     
    if(result.length > medium)
      return 3
    else 
      return 2
    end  
  end
  
   def concept_6(actors_count, actors_name, rtf_id)
    logger.info("CONCEPTO 6")
    grade = get_grade_concept_6(actors_name.count, actors_count)

    update_rtf_concept(rtf_id, 6, grade)
    return grade
  end
  
   def get_grade_concept_6(result, must_be_result)
    logger.info("NUMERO DE ACTORES: " + result.inspect + " DEBERIA SER " + must_be_result.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.to_f / 2
    if(result == medium)
       return 2
     end
     
    if(result > medium)
      return 3
    else 
      return 2
    end   
   end
   
  def concept_10(description_use_case, rtf_id)
    logger.info("CONCEPTO 10")
    logger.info(description_use_case.inspect)
    good_descriptions = []
    description_use_case.each do |description |
      word = description.split[1]
      logger.info(word.inspect + "-----")
      if(word.nil? == false)
        last_characters = word[-2..-1]
        if(last_characters == "ar" || last_characters == "er" || last_characters == "ir")
          good_descriptions << description
        end 
      end
      
    end
    grade = get_grade_concept_10(good_descriptions, description_use_case)
    update_rtf_concept(rtf_id, 10, grade)
    return grade
  end
  
  def get_number_of_good_descriptions(description_use_case)
    good_descriptions = []
    description_use_case.each do |description |
      word = description.split[1]
      if(word.nil? == false)
        last_characters = word[-2..-1]
        if(last_characters == "ar" || last_characters == "er" || last_characters == "ir")
          good_descriptions << description
        end 
      end
    end
    return good_descriptions.count
  end
  
  def get_grade_concept_10(good_descriptions, description_use_case)
    logger.info("BUENAS DESCRIPCIONES: " + good_descriptions.count.inspect + " DEBERIA SER: " + description_use_case.count.inspect)
    logger.info("LA QUE SOBRA: " + (description_use_case - good_descriptions).inspect)
    if(good_descriptions == description_use_case)
      return 4
    end
    medium = description_use_case.length / 2
    if(good_descriptions.length == medium)
      return 2
    end
    if(good_descriptions.length > medium)
      return 3
    else
      return 1  
    end
  end
  
  def concept_12(packages, use_cases_name,rtf_id)
    logger.info("CONCEPT0 12")
    package_usecases = Hash.new
    packages.each do |package|
      use_cases = get_use_cases_from_package(package)
      package_usecases[package] = use_cases
    end
    array = []
    package_usecases.each_value{|value| value.each do |v| array << v end}     
    grade = get_grade_concept_12(array, use_cases_name)
    update_rtf_concept(rtf_id,12, grade)
    return grade
  end
  
  def get_how_many_use_cases_from_packages(packages)
    package_usecases = Hash.new
    packages.each do |package|
      use_cases = get_use_cases_from_package(package)
      package_usecases[package] = use_cases
    end
    array = []
    package_usecases.each_value{|value| value.each do |v| array << v end}  
    return array.count
  end
  
  def get_grade_concept_12(array, use_cases_name)
    array.sort!
    use_cases_name.sort!
    logger.info("RESULT: " + array.count.inspect + " DEBERIA SER  " + use_cases_name.count.inspect)
    if(array == use_cases_name)
      return 4
    end
    medium = use_cases_name.length.to_f / 2
    if(array.length == medium)
      return 2
    end
    if(array.length > medium)
      return 3
    else
      return 1
    end
  end
  
  def concept_14(use_cases_name, rtf_id)
    logger.info("CONCEPTO 14")
    without_identifier = []
    use_cases_name.each do |use|
      tmp = use.split
      tmp.shift
      tmp2 = tmp.join(" ")
      if(tmp2.nil? == true)
        without_identifier << tmp2.upcase!
      end
      
    end
    unique_names = without_identifier.uniq   
    grade = get_grade_concept_14(unique_names, without_identifier)

    update_rtf_concept(rtf_id, 14, grade)
    return grade
  end
  
  def get_same_use_cases(use_cases_name)
    without_identifier = []
    use_cases_name.each do |use|
      tmp = use.split
      tmp.shift
      tmp2 = tmp.join(" ")
      if(tmp2.nil? == true)
        without_identifier << tmp2.upcase!
      end
      
    end
    unique_names = without_identifier.uniq
    return without_identifier.count - unique_names.count 
  end
  
  def get_grade_concept_14(result, must_be_result)
    logger.info(result.inspect)
    result.sort!
    must_be_result.sort!
    logger.info("NOMBRES: " + result.inspect)
    logger.info("SIN REPETICION: " + must_be_result.inspect)
    if(must_be_result == result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length  == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else 
      return 1
    end
  end
  
  def concept_16(requerimients_with_use_case, use_cases_id, use_cases_name, rtf_id)
    logger.info("CONCEPTO 16")
    array = []
    requerimients_with_use_case.each do |key, value|
      array << use_cases_id[value]
    end
    grade = get_grade_concept_16(array, use_cases_name)
    update_rtf_concept(rtf_id, 16, grade)
    return grade
  end
  
  def get_grade_concept_16(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("CASOS DE USO CON REQUERIMIENTOS: " + result.count.inspect)
    logger.info("USE_CASES "  + must_be_result.count.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else 
      return 1
    end
  end
  
  
  def concept_17(tests, use_cases, use_case_name, rtf_id)
    logger.info("CONCEPTO 17")
#    logger.info("TESTS: " + tests.inspect)
#    logger.info("USE_CASES: " + use_cases.inspect)
    array = []
    use_cases.each do |key, value|
      tests.each_value{|value_test| 
        if(value_test == key)
          array << value
        end
      }
    end
    if(array.length == 0)
      grade = 1
    else
      grade = get_grade_concept_17(array, use_case_name)
    end
    update_rtf_concept(rtf_id, 17, grade)
    return grade
  end
  
  def get_grade_concept_17(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("CASOS DE USO CON PRUEBAS " + result.count.inspect)
    logger.info("DEBERIA SER: " + must_be_result.count.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else 
      return 1
    end
  end
  
  def concept_19(tests, test_with_status, rtf_id)
    grade = get_grade_concept_19(test_with_status,tests)
 
    update_rtf_concept(rtf_id, 19, grade)
    return grade
  end
  
  def get_grade_concept_19(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("PRUEBAS CON ESTATUS: " + result.count.inspect)
    logger.info("TODAS LAS PRUEBAS: " + must_be_result.count.inspect)
    if result.empty?
      return 1
    end
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else 
      return 1
    end
  end
  
  def concept_20(tests, test_with_type, rtf_id)
    grade = get_grade_concept_20(test_with_type, tests)
    update_rtf_concept(rtf_id, 20, grade)
    return grade
  end
  
  def get_grade_concept_20(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("PRUEBAS CON TIPO: " + result.count.inspect)
    logger.info("TODAS LAS PRUEBAS: " + must_be_result.count.inspect)
    if result.empty?
      return 1
    end
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else 
      return 1
    end
  end
  
  def concept_21(use_cases, descriptions_use_case, rtf_id)
    logger.info("CONCEPTO 21")
    grade = get_grade_concept_21(descriptions_use_case, use_cases)
    update_rtf_concept(rtf_id, 21, grade)
    return grade
  end
  
  def get_grade_concept_21(result, must_be_result)
    logger.info("CASOS DE USO CON DESCRIPCIÓN: " + result.count.inspect)
    logger.info("TODOS LOS CASOS DE USO: " + must_be_result.count.inspect)
    result.sort!
    must_be_result.sort!
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else
      return 1
    end
  end
  
  def concept_25(use_cases, use_cases_with_scenario, rtf_id)
    grade = get_grade_concept_25(use_cases_with_scenario, use_cases)
    update_rtf_concept(rtf_id, 25, grade)
    return grade
  end
  
  def get_grade_concept_25(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("CASOS DE USO CON ESCENARIO BÁSICO: " + result.count.inspect)
    logger.info("TODOS LOS CASOS DE USO: " + must_be_result.count.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else
      return 1
    end
  end
  
  def concept_26(use_cases, use_cases_with_altern_scenario, rtf_id)
    grade = get_grade_concept_26(use_cases_with_altern_scenario, use_cases)
    update_rtf_concept(rtf_id, 26, grade)
    return grade
  end
  
  def get_grade_concept_26(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("CASOS DE USO CON ESCENARIO ALTERNO: " + result.count.inspect)
    logger.info("TODOS LOS CASOS DE USO: " + must_be_result.count.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else
      return 1
    end
  end
  
  def concept_29(compounds, scenarios, altern_scenarios, rtf_id)
    logger.info("CONCEPTO 29")
#    logger.info("COMPUNDS: " + compounds.inspect)
#    logger.info("SCENARIOS: " + scenarios.inspect)
#    logger.info("ALTERN_SCENARIOS: " + altern_scenarios.inspect)
    good_use_cases = []
    compounds.each do |c|
      if(!scenarios.include? c or !altern_scenarios.include? c)
        good_use_cases << c
      end
    end
    grade = get_grade_concept_29(good_use_cases, compounds)
    update_rtf_concept(rtf_id, 29, grade)
    return grade
  end
  
  def get_compunds_without_scenarios(compounds, scenarios, altern_scenarios)
    good_use_cases = []
    compounds.each do |c|
      if(!scenarios.include? c or !altern_scenarios.include? c)
        good_use_cases << c
      end
    end
    return good_use_cases.count
  end
  
  def get_grade_concept_29(result, must_be_result)
    result.sort!
    must_be_result.sort!
    logger.info("COMPUESTOS SIN ESCENARIOS: " + result.count.inspect)
    logger.info("COMPOUNDS: " + must_be_result.count.inspect)
    if(result == must_be_result)
      return 4
    end
    medium = must_be_result.length.to_f / 2
    if(result.length == medium)
      return 2
    end
    if(result.length > medium)
      return 3
    else
      return 1
    end
    
  end
  ########################################################
  
  def update_rtf_concept(rtf_id, concept_id, grade)
    rtf_concept = RtfConcept.where(:concept_id => concept_id, :rtf_id => rtf_id).first
    rtf_concept.update_attribute(:grade, grade)
    rtf_concept.update_attribute(:total, grade * rtf_concept.weight)
  end
end


