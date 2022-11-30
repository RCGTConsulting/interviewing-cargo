class PackagesController < ApplicationController
  def show
    @package = Package.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @package }
    end
  end
end
