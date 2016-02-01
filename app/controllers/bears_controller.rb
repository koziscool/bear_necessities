class BearsController < ApplicationController

  before_action :set_bear, only: [:show, :edit, :update, :destroy]

  def index
    @bears = Bear.all
  end

  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(bear_params)

    if @bear.save
      redirect_to @bear, notice: "Created successfully."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bear.update(bear_params)
      redirect_to @bear, notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @bear.destroy
      redirect_to bears_path, notice: "Destroyed successfully."
    else
      render :edit
    end
  end

  private

  def set_bear
    @bear = Bear.find(params[:id])
  end

  def bear_params
    params.require(:bear).permit(:name,:description)
  end

end
