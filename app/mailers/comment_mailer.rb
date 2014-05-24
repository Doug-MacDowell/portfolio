class CommentMailer < ActionMailer::Base

  default from: "dougmac9@uw.edu"

  def new_comment(comment, commentable)
    @comment = comment
    @commentable = commentable
    mail to: "surfside656@gmail.com"
  end

end
