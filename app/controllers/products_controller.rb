class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :authenticate_user!, only: [:get_cities_by_state, :get_areas_by_city]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @previews = Preview.where(product_id: @product.id).order("created_at DESC")
    if @previews.blank?
      @avg_preview = 0
    else
       @avg_preview = @previews.average(:rating).present? ? @previews.average(:rating).round(2) : 0
    end
  end

  # GET /products/new
  def new
    @product = current_user.shop.products.build
    
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.shop.products.build(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #get cities from state
  def get_cities_by_state
    @cities = State.find(params[:state]).cities
    respond_to do |format|
      format.json { render :json => @cities }
    end
  end 

  #get area from city
  def get_areas_by_city
    @areas = City.find(params[:city]).areas
    respond_to do |format|
      format.json { render :json => @areas }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :brand, :ram, :storage, :phone, :offerprice, :gst, :image, :imagetwo, :imagethree, :category, :city, :state, :area, :sub_category)
    end
end
