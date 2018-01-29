class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :payment_search_params, only: [:search]
  before_action :check_order_info, only: [:update, :create]
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.search(attach_owner_user_id)
  end

  # POST /orders/search
  def search
    @payments = Payment.search(@params)
    render "index"
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new(new_params)
  end

  # GET /payments/1/edit
  def edit
  end

  # GET /payments/query
  def query
    render :json => Payment.paymentsNameLike(params[:keyword])
  end
  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(attach_owner_user_id(payment_params))
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = check_owner_user_id(Payment.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:order_id, :customer_id, :amounts, :payment_method, :note)
    end

    def payment_search_params
      @params = params.require(:search).permit(:order_id, :customer_id)
    end

    def new_params
      check_customer_id
      check_order_id
      params.permit(:order_id, :customer_id)
    end

    def check_order_info
      params = payment_params
      raise SystemError if Order.where(attach_owner_user_id({:id => params[:order_id],
                                                              :customer_id => params[:customer_id]})).empty?
    end
end
