require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'view_layouts_base_hooks'
  require_dependency 'application_helper_patch'
end

Redmine::Plugin.register :redmine_responsive do
  name 'Redmine Responsive layout plugin'
  author 'Oleg German, original patches by Jan from plan.io'
  description 'Patches from https://www.redmine.org/issues/19097 extracted to plugin, originally by Jan from plan.io'
  version '0.0.1'
  url 'https://github.com/ogerman/redmine_responsive'
  author_url 'https://github.com/ogerman/redmine_responsive'
end
