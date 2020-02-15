# frozen_string_literal: true

module Homeland::Press
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u
      if @user.blank?
        roles_for_anonymous
      elsif @user.admin?
        roles_for_maintainers
      elsif @user.maintainer?
        roles_for_maintainers
      else
        roles_for_members
      end
    end

    protected

    def roles_for_maintainers
      can :manage, Post
    end

    # 普通会员权限
    def roles_for_members
      can :create, Post
      can :update, Post, user_id: user.id, status: Post.statuses[:upcoming]
      can :destroy, Post, user_id: user.id, status: Post.statuses[:upcoming]
      basic_read_only
    end

    # 未登录用户权限
    def roles_for_anonymous
      cannot :manage, Post
      basic_read_only
    end

    def basic_read_only
      can %i[read upcoming], Post
    end
  end
end
