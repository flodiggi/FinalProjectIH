class SiteController < ApplicationController
  def home
    def home
      @name = current_user ? @current_user.username : "test: not logged in"
    end
  end
end
