class SiteController < ApplicationController
  before_action :authenticate_user!
  def home
      @name = current_user ? @current_user.username : "test: not logged in"
  end
end
