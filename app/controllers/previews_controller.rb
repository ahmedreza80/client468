class PreviewsController < ApplicationController
  before_action :set_preview, only: [:show, :edit, :update, :destroy]
  before_action :set_product
  before_action :authenticate_user!



  # GET /previews/new
  def new
    @preview = Preview.new
  end

  # GET /previews/1/edit
  def edit
  end

  # POST /previews
  # POST /previews.json
    def create
    @preview = Preview.new(preview_params)
    @preview.user_id = current_user.id
    @preview.product_id = @product.id

    if @preview.save
      redirect_to @product
    else
      render 'new'
    end
  end

  # PATCH/PUT /previews/1
  # PATCH/PUT /previews/1.json
  def update
    respond_to do |format|
      if @preview.update(preview_params)
        format.html { redirect_to @preview, notice: 'Preview was successfully updated.' }
        format.json { render :show, status: :ok, location: @preview }
      else
        format.html { render :edit }
        format.json { render json: @preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /previews/1
  # DELETE /previews/1.json
  def destroy
    @preview.destroy
    respond_to do |format|
      format.html { redirect_to previews_url, notice: 'Preview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preview
      @preview = Preview.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preview_params
      params.require(:preview).permit(:rating, :comment)
    end
end