class SiteController < ApplicationController
  def home
    def home
      @name = current_user ? @current_user.username : "Ironhacker"
    end
  end
end
