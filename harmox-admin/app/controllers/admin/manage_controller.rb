class Admin::ManageController < ApplicationController
  include ManageConcern

  def index
    rm_all_sessions
  end
end
