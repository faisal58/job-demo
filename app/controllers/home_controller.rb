class HomeController < ApplicationController

  include ApplicationHelper
  before_action :authenticate_user!

  def index

  end
end
