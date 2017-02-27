module Homeland::Press
  module ApplicationHelper
    delegate :comments_path, to: :main_app
  end
end
