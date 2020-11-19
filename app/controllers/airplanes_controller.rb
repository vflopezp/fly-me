class AirplanesController < ApplicationController
  before_action :set_airplane, only: %i[show edit update destroy]
  def index
    if params[:query]
      sql_query = "model @@ :query OR address @@ :query OR description @@ :query"
      @airplanes = Airplane.where(sql_query, query: "%#{params[:query]}%")
    else
      @airplanes = Airplane.all
    end
    @markers = @airplanes.geocoded.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { airplane: airplane }),
        image_url: helpers.asset_url('https://www.pikpng.com/pngl/m/2-20957_logo-avion-png-clipart.png')
      }
    end
  end

  def show
    authorize @airplane
    @booking = Booking.new
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
