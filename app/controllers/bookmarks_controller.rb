class BookmarksController < ApplicationController
  # def new
  #   @bookmark = Bookmark.new
  #   @list = List.find(params[:list_id])
  #   # @titles = []
  #   # Movie.all.each do |movie|
  #   #   @titles << movie.title
  #   # end
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
