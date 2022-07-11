class Api::V1::SimpleItemsController < ApplicationController
  before_action :set_simple_item, only: %i[ show update destroy ]

  # GET /simple_items
  def index
    @simple_items = SimpleItem.all

    render json: @simple_items
  end

  # GET /simple_items/1
  def show
    render json: @simple_item
  end

  # POST /simple_items
  def create
    @simple_item = SimpleItem.new(simple_item_params)

    if @simple_item.save
      render json: @simple_item, status: :created, location: @simple_item
    else
      render json: @simple_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /simple_items/1
  def update
    if @simple_item.update(simple_item_params)
      render json: @simple_item
    else
      render json: @simple_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /simple_items/1
  def destroy
    @simple_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_item
      @simple_item = SimpleItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def simple_item_params
      params.require(:simple_item).permit(:value)
    end
end
