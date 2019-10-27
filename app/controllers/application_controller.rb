class ApplicationController < ActionController::Base
  include DeviseWhitelist
  before_action :authenticate_user!, except: [:home]

end
