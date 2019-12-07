class Author < ActiveRecord::Base
  has_many :posts

  def by_author
  end
  
end
