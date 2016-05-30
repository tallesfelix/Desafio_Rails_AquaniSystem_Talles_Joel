class HomeController < ApplicationController
  def index
  	if current_client
  		redirect_to rails_admin_path
  	end
  end

  def about
  end
end
