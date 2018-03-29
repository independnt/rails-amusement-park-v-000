class AttractionsController < ApplicationController
  before_action :set_attraction, only:[:show, :edit, :update]
  before_action :is_admin?, only:[:new, :create, :destroy]
  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction), flash:{notice: "The #{@attraction.name} has been added to the carnival!"}
    else
      render :new
    end
  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction), flash:{notice: "The #{@attraction.name} has been updated!"}
  end

  def destroy
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
