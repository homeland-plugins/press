module Homeland
  module Press
    class Engine < ::Rails::Engine
      engine_name Homeland::Press::NAME
      isolate_namespace Homeland::Press

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
