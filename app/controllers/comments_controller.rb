class CommentsController < ApplicationController
  before_filter :load_commentable, except: [:index]

  include Sidekiq::Worker

   def index
     authorize Comment
     @comments = Comment.all
   end

   def create
     @comment = @commentable.comments.new(comment_params)
     if @comment.save
       flash[:notice] = "This comment is awaiting moderation"
       redirect_to @commentable
       CommentMailer.delay_for(2.minutes).new_comment(@comment, @commentable)
     else
       instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
       render template: "#{@resource}/show"
     end
   end

  def update
    if @commentable.class == Comment
      @comment_entity = @commentable
    else
      @comment_entity = @commentable.comment
    end

    if @comment_entity.update_attributes(comment_params)
      flash[:notice] = "Comment has been updated"
      if @comment_entity.class == Comment
        redirect_to comments_path
      else
        redirect_to @commentable
      end
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def approve
    @comment = Comment.find(params[:id])
    if @comment.update(approved: true)
      redirect_to request.referrer, notice: "Successfully approved comment!"
      redirect_to comments_path
    else
      redirect_to request.referrer, notice: "Can't approve comment"
      redirect_to comments_path
    end
  end

  private

  def comment_params
     params.require(:comment).permit(:author,
                                    :author_url,
                                    :author_email,
                                    :content,
                                    :referrer,
                                    :approved,
                                    :commentable_id)
  end


  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

end
