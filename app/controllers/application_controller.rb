# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource
  
  protected
  
  def layout_by_resource
    if administrator_signed_in?
      "administrator"
   elsif programmer_signed_in?
      "programmer"
    else
      "application"
    end
  end
end
