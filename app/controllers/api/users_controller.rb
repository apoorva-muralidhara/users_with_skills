class Api::UsersController < ApplicationController
  def index
    render json: { }, status: :ok
  end
end
