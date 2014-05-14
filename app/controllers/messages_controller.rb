class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      # TODO send message goes here...
      flash[:notice] = "Message sent! Thanks for contacting us."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

end