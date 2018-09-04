class FoodMenusController < ApplicationController
  before_action :set_food_menu, only: [:show, :edit, :update, :destroy]

  # GET /food_menus
  # GET /food_menus.json
  def index
    @food_menus = FoodMenu.all
  end

  # GET /food_menus/1
  # GET /food_menus/1.json
  def show
  end

  # GET /food_menus/new
  def new
    @food_menu = FoodMenu.new
  end

  # GET /food_menus/1/edit
  def edit
  end

  # POST /food_menus
  # POST /food_menus.json
  def create
    @food_menu = FoodMenu.new(food_menu_params)

    respond_to do |format|
      if @food_menu.save
        format.html { redirect_to @food_menu, notice: 'Food menu was successfully created.' }
        format.json { render :show, status: :created, location: @food_menu }
      else
        format.html { render :new }
        format.json { render json: @food_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_menus/1
  # PATCH/PUT /food_menus/1.json
  def update
    respond_to do |format|
      if @food_menu.update(food_menu_params)
        format.html { redirect_to @food_menu, notice: 'Food menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_menu }
      else
        format.html { render :edit }
        format.json { render json: @food_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_menus/1
  # DELETE /food_menus/1.json
  def destroy
    @food_menu.destroy
    respond_to do |format|
      format.html { redirect_to food_menus_url, notice: 'Food menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_menu
      @food_menu = FoodMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_menu_params
      params.require(:food_menu).permit(:serve_date, :food_id)
    end
end
