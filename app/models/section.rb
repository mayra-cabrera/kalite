# -*- coding: utf-8 -*-
class Section < ActiveRecord::Base
  has_many  :concepts
  belongs_to  :diagram
  attr_accessible :name, :diagram_id
  
  validates :name, :presence => true
  validates :diagram_id, :presence => true
  validates_format_of :name, :with => /^(?:[^_]|\s)*$/u
end
