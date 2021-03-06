class FoodsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_food, only: [:show, :edit, :assign, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    if current_user.super_admin?
      @foods = Food.all
    else
      @foods = Food.where(user_id: current_user.id)
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Request created successfully.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def assign
    @food = Food.find(params[:id].to_i)
  end

  def assign_food
    if food_params[:assigned_user].present?
      @food = Food.find(food_params[:id].to_i)
      if @food.present?
        @food.status = true
        @food.assigned_user = food_params[:assigned_user]
        @food.save
        @food_req_user = Food.where(name: food_params[:assigned_user]).first
        @food_req_user.status = true
        @food_req_user.assigned_user = @food.name
        @food_req_user.save
      end
      respond_to do |format|
        format.html { redirect_to foods_url, notice: 'Food assigned successfully' }
        format.json { head :no_content }
      end
    else
      redirect_back(fallback_location: root_path, notice: 'Please select User')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:id, :assigned_user, :name, :food_type, :user_type, :number_of_plate, :status, :email, :phone, :address, :description, :user_id)
    end
end
