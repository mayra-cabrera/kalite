class Score < ActiveRecord::Base
  validates :description, :start, :end, :presence => true
  has_many :formal_technical_reviews
  
  def get_scale(percentage)
    number = sprintf("%.3f",percentage)
    logger.info(number.inspect + " " + self.start.inspect + " " + self.end.inspect)   
    name = ""
    if(number.to_f >= self.start && number.to_f <= self.end )
      name = self.description
    end
    logger.info("NAME : " + name.inspect)
    return name
  end
  
  def get_id(percentage)
    number = sprintf("%.3f",percentage)
    id = ""
    if(number.to_f >= self.start && number.to_f <= self.end )
      id = self.id
    end
    return id
  end
end
