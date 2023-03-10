class ToiletsController < ApplicationController
  before_action :set_toilet, only: [:show, :edit, :update]

  def show
    @booking = Booking.new
  end

  def index
    @toilets = Toilet.all
  end

  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user = current_user
    if @toilet.save
      redirect_to toilet_path(@toilet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @toilet.update(toilet_params)
    redirect_to toilet_path(@toilet)
  end

  def destroy
    @toilet = Toilet.find(params[:id])
    @toilet.destroy
    redirect_to toilets_path, status: :see_other
  end

  def mytoilet
    @toilets = Toilet.where(user_id: current_user.id)
  end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end

  def toilet_params
    params.require(:toilet).permit(:name, :description, :price, :photo)
  end
end
