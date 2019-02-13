# class ReviewsController < ApplicationController
#     def index
#     @reviews = Review.all
#   end
#   def show
#     @review = Review.find(params[:id])
#   end
#   def new
#     @review = Review.new
#   end
#   def create
#     # @review = review.new(params[:review])
#     @review = Review.new(review_params)
#     @review.save
#     redirect_to root_path
#   end
#   # def edit
#   #   @review = Review.find(params[:id])
#   # end
#   # def update
#   #   @review = Review.find(params[:id])
#   #   @review.update(review_params)
#   #   redirect_to root_path
#   # end
#   # def destroy
#   #   @review = Review.find(params[:id])
#   #   @review.destroy
#   #   redirect_to root_path
#   # end
#   private

#   def review_params
#     params.require(:review).permit(:name, :address, :category, :phone_numer)
#   end
# end
# end

# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    # if @review.save
    # redirect_to root_path
    # end
    if @review.save
      redirect_to restaurant_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
