class CsvUploadsController < ApplicationController
  def new
  end

  def create
    puts "params is #{params.inspect}!"
  end
end
