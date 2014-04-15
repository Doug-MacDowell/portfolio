class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  scope :published, -> { where(published: true) }
  # has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }


  def publish!
    publish = true
    save!
  end

end
