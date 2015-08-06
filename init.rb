require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'view_layouts_base_hooks'
  require_dependency 'application_helper_patch'
end

Redmine::Plugin.register :redmine_responsive do
  name 'Redmine Responsive plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
