class CommentMailer < ActionMailer::Base

  default from: "surfside656@gmail.com"

  def new_comment(comment, commentable)
    @comment = comment
    @commentable = commentable
    mail to: "surfside656@gmail.com"
  end

end
