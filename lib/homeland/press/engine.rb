module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland.press.init' do |app|
        if Setting.has_module?(:press)
          Homeland.register_plugin do |plugin|
            plugin.name              = 'press'
            plugin.display_name      = 'Press'
            plugin.description       = 'A Press/News plugin for Homeland.'
            plugin.navbar_link       = true
            plugin.admin_navbar_link = true
            plugin.user_menu_link    = true
            plugin.root_path         = "/posts"
            plugin.admin_path        = "/admin/posts"
          end

          User.send :include, Homeland::Press::UserMixin

          app.routes.prepend do
            mount Homeland::Press::Engine => '/'
          end

          app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
        end
      end
    end
  end
end
