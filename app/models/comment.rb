class Comment < ActiveRecord::Base
#  belongs_to :post

  belongs_to :post, :commentable, polymorphic: true

  validates :content, presence: true

  scope :approved, -> { where(approved: true) }

end
