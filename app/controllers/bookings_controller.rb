class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @airplane = Airplane.find(params[:airplane_id])
    @booking.airplane = @airplane
    @booking.renter = current_user
    authorize @booking
    if @booking.save
      redirect_to airplane_path(@booking.airplane), notice: "Your booking has been created"
    else
      render 'airplanes/show'
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Your booking has been updated"
    else
      render :new
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, notice: "Your booking has been deleted"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :renter, :airplane)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
