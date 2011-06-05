class Admin::BaseController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :admin_required!
  
  def admin_required!
    if current_user.admin?
      true
    else
      render :file => "#{Rails.root}/public/401.html"
    end
  end
  
end