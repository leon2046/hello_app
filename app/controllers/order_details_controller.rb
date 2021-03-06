class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]
  before_action :order_details_search_params, only: [:search]
  before_action :check_good_id, only: [:update, :create]
  # GET /order_details
  # GET /order_details.json
  def index
    @order_details = OrderDetail.search(attach_owner_user_id)
  end

  # POST /order_details/search
  def search
    @order_details = OrderDetail.search(@params)
    render "index"
  end

  # GET /order_details/1
  # GET /order_details/1.json
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new(new_params)
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details
  # POST /order_details.json
  def create
    @order_detail = OrderDetail.new(attach_owner_user_id(order_detail_params))
    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully created.' }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_details/1
  # PATCH/PUT /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_details_url, notice: 'Order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = check_owner_user_id(OrderDetail.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      p_order = params.require(:order_detail).permit(:order_id, :good_id, :order_time, :quantity, :purchase_price, :selling_price, :order_status, :total_amount, :order_note)

      if p_order[:total_amount].strip.blank?
        p_order[:total_amount] = p_order[:selling_price].to_i * p_order[:quantity].to_i
      end
      return p_order
    end

    def order_details_search_params
      @params = params.require(:search).permit(:order_id, :order_status)
      @params = attach_owner_user_id(@params)
    end

    def new_params
      params.permit(:order_id).merge({:quantity => 1})
    end

    def check_good_id
      params = order_detail_params
      raise SystemError if Good.where(attach_owner_user_id({:id => params[:good_id]})).empty?
    end
end
