class RtfAttribute < ActiveRecord::Base
  belongs_to  :attribute
  belongs_to  :formal_technical_review
  

end
