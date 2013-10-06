# -*- coding: utf-8 -*-
class Subsystem < ActiveRecord::Base
  has_many      :formal_technical_reviews
  belongs_to    :system
  
  attr_accessible :name, :description, :system_id
  
  validates :name, :description, :system_id, :presence => true
end
