class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @product = Product.find(params[:product_id])

    @review = Review.new(
      product_id: @product[:id],
      user_id: current_user.id,
      description: params[:review][:description],
      rating: params[:rating]
    )

    if @review.save
      redirect_to :back, notice: 'Review created!'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Review deleted!'
  end


  private

  def require_login
    redirect_to :root, notice: 'Please login or singin!' unless current_user
  end

end
