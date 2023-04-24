class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    # require 'pry'; binding.pry
  end
end