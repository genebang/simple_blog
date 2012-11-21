class Article < ActiveRecord::Base

  include TextValidations

  has_many :comments, dependent: :destroy
  belongs_to :user

  # validates_associated :comments

  attr_accessible :body, :title, :user_id

  # validates :title, :presence => true, :format => {:without => /kitten/}
  # validates :body, :presence => true, :format => {:without => /kitten/}

  def self.ordered_by(param1, param2 = 10)
    case param1
    when 'title' then self.order('title').limit(param2)
    when 'published' then self.order('created_at DESC').limit(param2)
    when 'word_count' then self.word_count[0..(param2.to_i-1)]
    else self.all
    end
    #
    # if param2 == 0
    #   self.all
    # else
    #   self.limit(param2)
    # end
  end


  def self.word_count
    # count_array = []
    # @articles = Article.all
    # @articles.each do |article|
    #   count = article.body.split(" ").size
    #   count_array << [article, count]
    # end
    # count_array.sort_by!{|count| count[1]}
    @articles = self.all
    @articles.sort_by{|article|article.body.split(" ").size}
  end
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
