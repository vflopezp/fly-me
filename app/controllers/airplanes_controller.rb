class AirplanesController < ApplicationController
  before_action :set_airplane, only: %i[show edit update destroy]
  def index
    @airplanes = Airplane.all
  end

  def show; end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    if @airplane.save
      redirect_to @airplane, notice: "Your airplane has been created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @airplane.update(airplane_params)
      redirect_to @airplane, notice: "Your airplane details have been updated"
    else
      render :edit
    end
  end

  def destroy
    @airplane.destroy
    redirect_to airplanes_path, notice: "Your airplane has been deleted"
  end

  private

  def airplane_params
    params.require(:airplane).permit(:model, :price, :capacity, :owner)
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end
end
