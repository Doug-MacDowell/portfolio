class Project < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  validates :technologies_used, presence: true
  validates :name, length: {in: 4..255}
  has_many :comments, as: :commentable
end
