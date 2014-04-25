class ProjectPolicy < ApplicationPolicy

  attr_reader :user, :project

    def initialize(user, projec)
      @user = user
      @project = project
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

    def destroy?
      if user.present?
        return true if user.editor?
        user.id == project.author_id
      end
    end

end
