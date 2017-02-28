module Homeland::Press
  module ApplicationHelper
    delegate :comments_path, to: :main_app

    def press_user_name_tag(user)
      return '官方' if user.admin?
      user_name_tag(user)
    end
  end
end
