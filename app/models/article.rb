class Article < ApplicationRecord
  belongs_to :user

  def self.search(str)
    if str
      Article.where("title LIKE '%#{str}%' OR content LIKE '%#{str}%'")
    else
      Article.all
    end
  end
end
