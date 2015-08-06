class ResponsiveController < ApplicationController
  skip_before_filter :check_if_login_required
  protect_from_forgery :except => :responsive
  def responsive
  end
end
