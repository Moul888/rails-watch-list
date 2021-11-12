class BookmarksController < ApplicationController
  # GET "restaurants/38/reviews/new" -- new -- Review;
  before_action :set_list, only: [:create, :new]
  before_action :set_bookmark, only: :destroy
  def new
    @bookmark = Bookmark.new
  end
  # POST "restaurants/38/reviews" -- create -- Review;
  def create
    #@review = Review.find(review_params)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created!"
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
