class RtfDomain < ActiveRecord::Base
  has_attached_file :attach, :default_url => "public/files/",  :path => "public/files/:id/_:filename"
  validates_attachment_content_type :attach, :content_type => 'text/xml'
  
  def is_domain
  #  @rtf_domain = rtf_domain
    path = "public/files/" + self.id.to_s + "/_" + self.attach_file_name
    doc = Nokogiri::XML(File.open(path))
    array = doc.xpath("//UML:Package")
    name = array.first.attributes["name"].value
    name.downcase!
    logger.info("NOMBRE" + name.inspect)
    if(name == "domain model" || name == "modelo de dominio")
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
      names << actor.attributes.first.last.value
    end
    logger.info("ACTORES_DOMINIO " + names.inspect)
    return names
    
  end
  

end
