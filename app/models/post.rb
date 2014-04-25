class Post < ActiveRecord::Base
 # attr_accessible :content  # not needed with strong_params

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  scope :published, -> { where(published: true) }
  validates :title, presence: true, length: { minimum: 5 }


  def publish!
    publish = true
    save!
  end

end
