class AirplanesController < ApplicationController
  before_action :set_airplane, only: %i[show edit update destroy]
  def index
    @airplanes = Airplane.all
  end

  def show
    authorize @airplane
  end

  def new
    @airplane = Airplane.new
    authorize @airplane
  end

  def create
    @airplane = Airplane.new(airplane_params)
    authorize @airplane
    if @airplane.save
      redirect_to @airplane, notice: "Your airplane has been created"
    else
      render :new
    end
  end

  def edit
    authorize @airplane
  end

  def update
    authorize @airplane
    if @airplane.update(airplane_params)
      redirect_to @airplane, notice: "Your airplane details have been updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @airplane
    @airplane.destroy
    redirect_to airplanes_path, notice: "Your airplane has been deleted"
  end

  private

  def airplane_params
    params.require(:airplane).permit(:model, :price, :capacity, :owner, photos: [])
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end
end
