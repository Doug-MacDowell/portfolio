class Post < ActiveRecord::Base

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  scope :published, -> { where(published: true) }
  validates :title, presence: true, length: { minimum: 5 }

  def publish!
    publish = true
    save!
  end

  def authored_by?(user)
    author == user
  end

  def self.create_from_postmark(mitt)
    api_token = mitt.from
    user = User.find_by_email(api_token)
    if user
      post = user.posts.new
      #binding.pry
      #post.message_id = mitt.message_id
      post.title = mitt.subject
      post.body = if mitt.text_body.blank?
        mitt.html_body
      else
        mitt.text_body
      end
      post.save
    else
      return false
    end
  end

end
