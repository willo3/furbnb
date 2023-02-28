class BookingsController < ApplicationController
  def index
    @booking = Booking.all
  end

  def show
    set_booking
  end

  def new
    @booking = Bookng.new
  end
  def create
    @booking = Booking.new(pet_params)
    @booking.user = current_user
    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_booking
  end

  def update
    set_booking
    @booking.update(pet_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to booking_path(@booking), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:pet).permit(:name, :species, :sex, :neutered, :age, :special_instructions)
  end
end

end
