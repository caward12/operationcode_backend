class ServicesController < ApplicationController
  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
  end

  def create
    @service = Service.new(service_params)

    @service.save
    redirect_to @service

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
  end

private
  def service_params
    params.require(:service).permit(:title, :text)
  end
end
