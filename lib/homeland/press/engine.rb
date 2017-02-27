module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland_press.register' do |app|
        Homeland.register_plugin do
          self.name = 'press'
          self.display_name = '头条'
          self.description = 'A Press plugin for Homeland.'
          self.navbar_link = true
          self.user_menu_link = true
          self.root_path = "/posts"
        end
      end

      initializer 'homeland_press.mount' do |app|
        app.routes.prepend do
          mount Homeland::Press::Engine, at: '/posts'
        end
      end

      initializer 'homeland_press.migrations' do |app|
        app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
      end
    end
  end
end
