class Comment < ActiveRecord::Base
  
  include TextValidations
  
  belongs_to :article

  attr_accessible :body
  
  validates_associated :articles
  
  validates :body, :length => {:maximum => 250}#, :format => {:without => /kitten/}
  validates :article, :presence => true
  
end
