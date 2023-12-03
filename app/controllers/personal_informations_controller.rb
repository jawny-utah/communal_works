class PersonalInformationsController < ApplicationController
  before_action :require_authorization

  def show
    @user = current_user
  end
end
