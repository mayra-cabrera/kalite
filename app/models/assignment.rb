class Assignment < ActiveRecord::Base
  belongs_to :attribute
  belongs_to :diagram
  belongs_to :system_type
end
