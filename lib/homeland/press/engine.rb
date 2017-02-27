module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland_press.register' do |app|
        Homeland.register_plugin do |plugin|
          plugin.name           = 'press'
          plugin.display_name   = '头条'
          plugin.description    = 'A Press plugin for Homeland.'
          plugin.navbar_link    = true
          plugin.user_menu_link = true
          plugin.root_path      = "/posts"
          plugin.spec_path      = config.root.join('spec')
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
