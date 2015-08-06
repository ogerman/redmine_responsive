# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
  get 'plugin_assets/redmine_responsive/javascripts/responsive', :to => 'responsive#responsive', :format => :js
end
