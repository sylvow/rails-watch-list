class ReviewsController < ApplicationController
  # def index
  # end
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list_id = @list.id
    if @review.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
