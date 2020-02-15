# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'homeland/press'

Homeland.register_plugin do |plugin|
  plugin.name              = 'press'
  plugin.display_name      = '头条'
  plugin.description       = '头条栏目插件，可以独立发布官方内容。'
  plugin.version           = Homeland::Press::VERSION
  plugin.navbar_link       = true
  plugin.admin_navbar_link = true
  plugin.root_path         = '/posts'
  plugin.admin_path        = '/admin/posts'
end
