class CsvUploadsController < ApplicationController
  def new
  end

  def create
    User.import(params[:file].path)
    render status: :created
  end
end
