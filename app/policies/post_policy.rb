class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user
        return scope.where(author_id: user.id) if user.author?
        return scope.all if user.editor?
      end
      scope.where(published: true)
    end
  end

    def initialize(user, post)
      @user = user || NullUser.new
      @post = post
    end

    def permitted_attributes
      return [] if user.nil?
      attributes = [:title, :body]
      attributes << [:published] if @user.editor?
    end

    def update?
      @post.author == @user || @user.editor?
    end

    def create?
      @user.author? || @user.editor?
    end

    def publish?
      @user.editor?
    end

    def destroy?
      @user.editor?
    end
end
