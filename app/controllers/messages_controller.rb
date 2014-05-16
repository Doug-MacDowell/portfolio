class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      flash[:error] = nil
      flash[:notice] = "Message sent! Thanks for contacting us."
      redirect_to root_url
    else
      flash[:error] = 'Cannot send message.'
      render :action => 'new'
    end
  end

end
