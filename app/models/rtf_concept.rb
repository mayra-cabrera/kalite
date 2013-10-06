class RtfConcept < ActiveRecord::Base
  belongs_to  :concept
  
  validates :weight, :numericality =>  {:greater_than_or_equal_to => 0.001}
  

end
