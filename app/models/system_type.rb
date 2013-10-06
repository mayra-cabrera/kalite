# -*- coding: utf-8 -*-
class SystemType < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  validates_format_of :name, :with => /^(?:[^_]|\s)*$/u
end
