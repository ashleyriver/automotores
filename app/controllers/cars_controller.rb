class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car=Car.new
  end

  def create
    @car = Car.new(placa: params[:car][:placa], color: params[:car][:color], estado: params[:car][:estado])
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end

  end

  def update
    @car= Car.find(params[:id])
    if @car.update(placa: params[:car][:placa], color: params[:car][:color], estado: params[:car][:estado])
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def show
    @car= Car.find(params[:id])
  end

  def edit
    @car= Car.find(params[:id])
  end
end
