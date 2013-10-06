# -*- coding: utf-8 -*-
class System < ActiveRecord::Base
  has_many  :systems
  belongs_to  :system_type
  
  attr_accessible :name, :description, :system_type_id
  
  validates :name, :description, :system_type_id, :presence => true
end
