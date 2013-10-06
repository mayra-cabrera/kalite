# -*- coding: utf-8 -*-
class Concept < ActiveRecord::Base
  scope :ordered, Concept.joins(:attribute).order('attributes.name')
  belongs_to :attribute
  belongs_to :section
  belongs_to :diagram
  has_many   :rtf_concepts
  
  validates :description, :attribute_id, :diagram_id, :section_id, :presence => true
  
end
