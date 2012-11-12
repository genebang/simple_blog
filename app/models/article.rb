class Article < ActiveRecord::Base
  
  include TextValidations
  
  has_many :comments, dependent: :destroy

  validates_associated :comments
  
  attr_accessible :body, :title
    
  validates :title, :presence => true, :format => {:without => /kitten/}
  validates :body, :presence => true, :format => {:without => /kitten/}
  
  # validate :word_count
  # 
  # def word_count
  #   self.body = "" if self.body == nil
  #   if self.body.split(' ').size > 2
  #     # errors.add(:base, "The description has too many words")
  #     raise "error"
  #   end
  # end
  
end
