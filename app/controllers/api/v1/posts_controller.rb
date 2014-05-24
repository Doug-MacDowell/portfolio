class Api::V1::PostsController < ApplicationController
 skip_before_filter :verify_authenticity_token

     def create
       logger.debug request.body.inspect
       if Post.create_from_postmark(Postmark::Mitt.new(request.body.read))
         render :text => "A new post has been submitted.", status: :created
       else
         render :text => "Unauthorized!", status: :unauthorized
       end
     end

end
