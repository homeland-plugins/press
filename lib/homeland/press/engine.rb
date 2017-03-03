module Homeland
  module Press
    class Engine < ::Rails::Engine
      isolate_namespace Homeland::Press

      initializer 'homeland.press.init' do |app|
        return unless Setting.has_module?(:press)
        app.config.after_initialize do
          # Because need use I18n.t
          # must after Rails application initialized will get correct locale
          Homeland.register_plugin do |plugin|
            plugin.name              = 'press'
            plugin.display_name      = I18n.t('plugin.press')
            plugin.description       = 'A Press/News plugin for Homeland.'
            plugin.navbar_link       = true
            plugin.admin_navbar_link = true
            plugin.user_menu_link    = true
            plugin.root_path         = "/posts"
            plugin.admin_path        = "/admin/posts"
          end
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
