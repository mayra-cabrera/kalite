# -*- coding: utf-8 -*-

class Programmer < ActiveRecord::Base

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable, :lockable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  validates :first_name, :last_name, :presence => true
  validates_format_of :first_name, :with => /^(?:[^_]|\s)*$/u
  validates_format_of :last_name, :with => /^(?:[^_]|\s)*$/u
  
  def complete_name
    self.first_name + "  " + self.last_name
  end
end
