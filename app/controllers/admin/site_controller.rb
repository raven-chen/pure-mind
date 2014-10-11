class Admin::SiteController < ApplicationController
  before_action :authenticate_admin!
  layout "admin/site"

  def index
    render "site/index"
  end
end
