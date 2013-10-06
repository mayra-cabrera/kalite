# -*- coding: utf-8 -*-
class Attribute < ActiveRecord::Base
  has_many :concepts
  attr_accessible :name
  
  validates :name, :presence => true
  validates_format_of :name, :with => /^(?:[^_]|\s)*$/u
  
  def how_many_concepts(concepts, attribute_id)
    count = 0;
    concepts.each do |c|
      concept = Concept.find(c)
      if(concept.attribute_id == attribute_id)
        count = count + 1;
      end
    end
    return count;
  end
  
  def return_concepts(concepts,attribute_id)
    array_concepts = []
    concepts.each do |c|
      concept = Concept.find(c)
      if(concept.attribute_id == attribute_id)
        array_concepts << concept
      end
    end
    return array_concepts
  end
  
  def create_rtf_concepts(concepts, rtf_id, weight)
    logger.info("CONCEPTS: " + concepts.inspect)
    if(!concepts.empty?)
      concepts.each do |c|
        RtfConcept.create!(:rtf_id => rtf_id, :concept_id => c.id, :weight => weight)
      end
    end
  end
end
