class Author < ActiveRecord::Base
  has_many :posts

  def self.by_author(author_id)
    where(author: author_id)
  end
  
end
