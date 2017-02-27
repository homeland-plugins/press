module Homeland::Press
  class ApplicationController < ::ApplicationController
    helper Homeland::Press::ApplicationHelper

    def current_ability
      @current_ability ||= Homeland::Press::Ability.new(current_user)
    end
  end
end
