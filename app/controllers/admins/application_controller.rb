class Admins::ApplicationController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
end
