class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # se o restaurant criado for salvo com sucesso
      # redirecione para a pag do restaurante criado e exiba a msg 'Restaurant was successfully created'
      redirect_to @restaurant, notice: 'Restaurant was successfully created'
    else
      render :new # volte para a rota e metodo new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated'
    else
      render :edit # volte para a rota /edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to @restaurant, notice: 'Restaurant was successfully deleted'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
