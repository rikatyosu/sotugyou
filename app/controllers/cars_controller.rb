class CarsController < ApplicationController
    before_action :require_login, only: %i[new create]   # Sorcery のヘルパ
    def index
      @cars = Car.all
    end
  
    def new
      @car = Car.new
    end
  
    def create
      @car = Car.new(car_params)
      if @car.save
        redirect_to cars_path, notice: '車種を登録しました！'
      else
        render :new
      end
    end

    def destroy
        @car = Car.find(params[:id])
        @car.destroy
        redirect_to cars_path, notice: '車種を削除しました'
      end

      private
  
    def car_params
      params.require(:car).permit(:name, :description, :image)
    end
  end
  