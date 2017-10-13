class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    @review = Review.new(
      product_id: @product[:id],
      user_id: session[:user_id],
      description: params[:review][:description],
      rating: params[:rating]
    )

    if @review.save
      redirect_to :root, notice: 'Review created!'
    end
  end
end
