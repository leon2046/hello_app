class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  before_action :search_params, only: [:search]
  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.where(attach_owner_user_id).order({id: :desc})
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = Good.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods/search
  def search
    if(@params["keyword"].empty?)
      @goods = Good.where(attach_owner_user_id)
    else
      @goods = Good.goods_name_like(@params)
    end
    render 'index'
  end

  # GET /goods/query
  def query
    keyword_hash = {:keyword => params[:keyword]}
    render :json => Good.goods_name_like(attach_owner_user_id(keyword_hash))
  end
  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(attach_owner_user_id(good_params))

    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Good was successfully created.' }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = check_owner_user_id(Good.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:jan_cd, :name_jp, :name_cn, :price_jpy, :profit_rate, :selling_price_cny, :image_path)
    end

    def search_params
      @params = params.require(:search).permit(:keyword)
      @params = attach_owner_user_id(@params)
    end
end
