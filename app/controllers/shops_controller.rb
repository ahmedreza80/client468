class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @products = Product.all
    @reviews = Review.where(shop_id: @shop.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
       @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
    end
  end

  # GET /shops/new
  def new
    @shop = current_user.build_shop
  end

  # GET /shops/1/edit
  def edit
  end
  def home
  end

  # POST /shops
  # POST /shops.json
  def create
    if params[:shop][:registeration_number].present?
      code = RegisterationNumber.where(code: params[:shop][:registeration_number]).first
      if code.present?
        @shop = current_user.build_shop(shop_params)
        @shop.user = current_user
        @shop.registeration_number_id = code.id
        respond_to do |format|
          if @shop.save
            format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
            format.json { render :show, status: :created, location: @shop }
          else
            format.html { render :new }
            format.json { render json: @shop.errors, status: :unprocessable_entity }
          end
        end
      else    
        respond_to do |format|
          format.html { redirect_to new_shop_path, notice: 'Shop was successfully created.'  }
          format.json { render json: {registeration: "Registeration Number not foud"}, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_shop_path, notice: 'Shop was successfully created.'   }
        format.json { render json: {registeration: "Registeration Number not foud"}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :description, :imageshop, :location, :list, :gst, :web, :email, :facebook, :twitter, :linkedin, :operating_hours, :state, :city, :area, :phone, :business, :category, :status)
    end
end
