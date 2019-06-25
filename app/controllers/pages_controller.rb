class PagesController < ApplicationController
  respond_to :html, :xml, :json





  def homepage
    # I've just copy-paste your code with database querying
    # It should be optimized with scopes at model level,
    # but this is not the main question
    @highlights = Highlight.all
    @products = Product.where('(name ILIKE ? OR description ILIKE ? )', "%#{params[:search]}%", "%#{params[:search]}%")
    @products = @products.where(state: params[:state]) if params[:state].present?
    @products = @products.where(city: params[:city]) if params[:city].present?

    if current_user
      current_user.update_attributes(
        search_state: params[:state],
        search_city: params[:city],
        search_area: params[:area]
      )
    end

    respond_with @products
  end
end
