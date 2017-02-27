module Homeland::Press
  module UserMixin
    extend ActiveSupport::Concern

    included do
      action_store :like, :post, counter_cache: true, class_name: 'Post'
    end
  end
end
