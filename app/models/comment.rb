class Comment < ActiveRecord::Base
  
  include TextValidations
  
  belongs_to :article

  attr_accessible :body
  
  # validates_associated :articles
  
  # validates :body, :length => {:maximum => 250}#, :format => {:without => /kitten/}
  validates :article, :presence => true
  
  # validate :word_count
  # 
  # def word_count
  #   self.body = "" if self.body == nil
  #   if self.body.split(' ').size > 5
  #     # errors.add(:base, "The description has too many words")
  #     raise "error"
  #   end
  # end
  
end
