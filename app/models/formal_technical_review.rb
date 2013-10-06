class FormalTechnicalReview < ActiveRecord::Base
  belongs_to  :administrator
  belongs_to  :programmer
  belongs_to  :subsystem
  belongs_to  :diagram
  belongs_to  :score
end
