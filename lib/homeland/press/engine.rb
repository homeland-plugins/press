# frozen_string_literal: true

module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland.site.migrate' do |_app|
        Homeland.migrate_plugin(File.expand_path('../../../migrate', __dir__))
      end

      initializer 'homeland.press.init' do |app|
        User.include Homeland::Press::UserMixin

        app.routes.prepend do
          mount Homeland::Press::Engine => '/'
        end
      end
    end
  end
end
