module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland_press.init' do |app|
        if Setting.has_module?(:press)
          Homeland.register_plugin do |plugin|
            plugin.name           = 'press'
            plugin.display_name   = '头条'
            plugin.description    = 'A Press plugin for Homeland.'
            plugin.navbar_link    = true
            plugin.user_menu_link = true
            plugin.root_path      = "/posts"
            plugin.spec_path      = config.root.join('spec')
          end

          User.send :include, Homeland::Press::UserMixin

          app.routes.prepend do
            mount Homeland::Press::Engine, at: '/posts'
          end

          app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
        end
      end
    end
  end
end
