class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :commentable,  polymorphic: true
  validates :content,       presence: true
  validates :author_email,  presence: true
  validates :author,        presence: true

end
