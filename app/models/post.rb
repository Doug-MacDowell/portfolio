class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  def publish!
    publish = true
    save!
  end

end
