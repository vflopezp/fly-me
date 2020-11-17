class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Your booking has been updated"
    else
      render :new
    end
  end

  def destroy
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
