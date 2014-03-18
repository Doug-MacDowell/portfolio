class PostPolicy < ApplicationPolicy
  #class PostPolicy < Struct.new(:user, :post)

  attr_reader :user, :post

#  class Scope < Struct.new(:user, :scope)
 #   def resolve
 #     if user
 #       return scope.where(author_id: user.id) if user.author?
 #       return scope.all if user.editor?
 #     end
 #     scope.where(published: true)
 #   end
 # end

    def initialize(user, post)
      @user = user
      @post = post
    end

    def permitted_attributes
   #  if user.editor? || user.owner_of?(post)
      if user.editor?
        [:title, :body, :published, :tag_list]
      else
        [:tag_list]
        #return [] if user.nil?
      end
    end

    def update?
      @user.author? || @user.editor?
    end

    def create?
      @user.author?
    end

    def publish?
      @user.editor?
    end

    def destroy?
      @user.editor?
    end

    def index?
      if ! @user.nil?
        @user.author? || @user.editor?
      end
    end
end
