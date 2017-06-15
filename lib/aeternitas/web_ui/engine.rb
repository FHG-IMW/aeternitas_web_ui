module Aeternitas
  module WebUi
    class Engine < ::Rails::Engine
      isolate_namespace Aeternitas::WebUi

      initializer 'aeternitas.assets.precompile' do |app|
        app.config.assets.precompile += [
          'aeternitas/web_ui/aeternitas_web_ui.js',
          'aeternitas/web_ui/aeternitas_web_ui.css',
          'aeternitas/web_ui/logo_large.png'
        ]
      end
    end
  end
end
