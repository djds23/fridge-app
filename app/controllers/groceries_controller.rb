class GroceriesController < ApplicationController
  before_action :set_grocery, only: [
    :quantity, :show, :edit, :update, :destroy
  ]

  # GET /groceries
  # GET /groceries.json
  def index
    @in_stock = Grocery.in_stock.order(id: :desc)
    @running_low = Grocery.running_low.order(id: :desc)
    @out_of_stock = Grocery.out_of_stock.order(id: :desc)
  end

  # GET /groceries/1
  # GET /groceries/1.json
  def show
  end

  # GET /groceries/new
  def new
    @grocery = Grocery.new
    @residents = HouseHold.first.residents
  end

  # GET /groceries/1/edit
  def edit
    @residents = HouseHold.first.residents
  end

  # POST /groceries
  # POST /groceries.json
  def create
    @grocery = Grocery.new(grocery_params)

    respond_to do |format|
      if @grocery.save
        format.html { redirect_to groceries_url }
        format.json { render :show, status: :created, location: @grocery }
      else
        format.html { render :new }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groceries/1
  # PATCH/PUT /groceries/1.json
  def update
    respond_to do |format|
      if @grocery.update(grocery_params)
        format.html { redirect_to @grocery, notice: 'Grocery was successfully updated.' }
        format.json { render :show, status: :ok, location: @grocery }
      else
        format.html { render :edit }
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groceries/1
  # DELETE /groceries/1.json
  def destroy
    @grocery.destroy
    respond_to do |format|
      format.html { redirect_to groceries_url, notice: 'Grocery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def quantity
    case grocery_params[:direction]
    when 'up'
      @grocery.up_quantity!
    when 'down'
      @grocery.down_quantity!
    end

    respond_to do |format|
      format.json { render json: @grocery }
    end
  end

  def update_purchased_at
    @grocery.update(:purchased_at, grocery_params[:purchased_at] || Time.now)

    respond_to do |format|
      format.json { render json: @grocery }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery
      grocery_id = params[:id] || params[:grocery][:id]
      @grocery = Grocery.find(grocery_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grocery_params
      params.require(:grocery).permit(
        :name,
        :quantity,
        :resident_id,
        :direction,
        :purchased_at,
      )
    end
end

