require_dependency "#{Rails.root}/app/helpers/application_helper"

module ApplicationHelperPatch       
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do    
      unloadable # Send unloadable so it will not be unloaded in development
      alias_method_chain :render_project_jump_box, :responsive
    end
  end

  module InstanceMethods
    def render_project_jump_box_with_responsive
      return unless User.current.logged?
      if Redmine::VERSION::MAJOR >= 2
        projects = User.current.projects.active.select(:id, :name, :identifier, :lft, :rgt).to_a
      else
        projects = User.current.memberships.collect(&:project).compact.select(&:active?).uniq
      end

      if projects.any?
        options =
          ("<option value=''>#{ l(:label_jump_to_a_project) }</option>" +
           '<option value="" disabled="disabled">---</option>').html_safe

        options << project_tree_options_for_select(projects, :selected => @project) do |p|
          { :value => project_path(:id => p, :jump => current_menu_item) }
        end

        select_tag('project_quick_jump_box', options, :onchange => 'if (this.value != \'\') { window.location = this.value; }')
      end
    end
  end


end

unless ApplicationHelper.included_modules.include? ApplicationHelperPatch
  ApplicationHelper.send(:include, ApplicationHelperPatch) 
end
