class ReviewsController < ApplicationController
  before_filter :require_login

  def create
    @product = Product.find(params[:product_id])
    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user

    @review = Review.new(
      product_id: @product[:id],
      user_id: @review.user,
      description: params[:review][:description],
      rating: params[:rating]
    )

    if @review.save
      redirect_to :back, notice: 'Review created!'
    end
  end

  private

  def require_login
    redirect_to :root, notice: 'Please login or singin!' unless current_user
  end

end
