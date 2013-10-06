# -*- coding: utf-8 -*-
class Diagram < ActiveRecord::Base
  has_many  :formal_technical_reviews
  has_many  :concepts
  attr_accessible :name, :folio
  
  validates :name, :presence => true
  validates_format_of :name, :with => /^(?:[^_]|\s)*$/u
  validates :folio, :presence => true
  validates :folio, :uniqueness => true
  
  def get_attributes
    concepts = Concept.where(:diagram_id => self.id).select(:attribute_id)
    attributes = []
    concepts.each do |concept|
      attributes << Attribute.find(concept.attribute_id)
    end
    attributes.uniq!
    return attributes
  end
  

end
