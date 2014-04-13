class CommentsController < ApplicationController

   def create
     @comment = Comment.new(comment_params)
     if @comment.save
       flash[:notice] = "This comment is awaiting moderation"
    #   redirect_to post_path(@comment.post_id)
       redirect_to posts_path
     else
       @post = Post.find(@comment.post_id)
       render template: "posts/show"
     end
   end

  private

   def comment_params
     params.require(:comment).permit(:author,
                                    :author_url,
                                    :author_email,
                                    :content,
                                    :referrer,
                                    :post_id)
   end

end
