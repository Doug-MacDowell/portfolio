class PostPolicy < ApplicationPolicy

  attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def permitted_attributes
      if user.editor? || user.author?
        [:title, :body, :published, :tag_list]
      else
        [:title, :body, :tag_list]
      end
    end

    def update?
      @user.author? || @user.editor?
    end

    def create?
      if user.present?
        @user.author? || @user.editor?
      end
    end

    alias_method :update?, :create?

    def approve?
      @user.author? || @user.editor?
    end

    def publish?
      if user.present?
        user.editor?
      end
    end

    def destroy?
      if user.present?
        return true if user.editor?
        user.id == post.author_id
      end
    end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end

end
