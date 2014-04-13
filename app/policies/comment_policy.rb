class CommentPolicy < ApplicationPolicy

  attr_reader  :comment, :user, :post

  def create?
  end

  def update?
    @user.author? || @user.editor?
  end

  def approved?
    @user.author? || @user.editor?
  end

end
