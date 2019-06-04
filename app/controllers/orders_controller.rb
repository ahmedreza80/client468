class OrdersController < ApplicationController

	def order_tracking
	    if params[:order_number].present?
	      if Order.where(id: params[:order_number]).exists?
	        @order = Order.find(params[:order_number])
	        redirect_to  action: 'order_status', order_number: @order.id
	      else
	      	flash[:success] = "Please enter correct tracking Number"
	      end	
	    end  		
	end

	def order_status
		if params[:order_number].present?
	    	@order = Order.find(params[:order_number])
		end
	end
	def new
		@order = current_cart.order
	end

	def show
		@orders = Order.all
	end

	def create
		@order = current_cart.order
		if @order.update_attributes(order_params.merge(status:'open'))
			session[:cart_token] = nil
			redirect_to action: 'show'
		else
			render:new
		end
	end

	private
	def order_params
		params.require(:order).permit(:first_name, :las_name, :city, :mobile_number, :delivery_address, :email, :pincode, :tracking)
	end

end