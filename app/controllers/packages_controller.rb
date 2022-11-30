class PackagesController < ApplicationController
  before_action :validate_params

  def show
    @package = Package.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @package }
    end
  end

  private

  def validate_params
    return if params[:id].to_i.even?

    respond_to do |format|
      format.html { render :forbidden, status: 403 }
      format.json { render json: { "error" => "No!" } }
    end
  end
end
