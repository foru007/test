class ChargesController < ApplicationController
	before_action :authenticate_user! 
	def new
	end

	def create
	  # Amount in cents
	  @post = Post.find(params[:id])

	  print(params)

	  customer = Stripe::Customer.create(
	    :email => 'test20069@gmail.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @post.price,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  @post.sold = true      
      @post.save
	  redirect_to posts_path
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
