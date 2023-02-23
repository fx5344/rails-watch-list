class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    list = List.find(params[:list_id])
    @bookmark.list = list
    if @bookmark.save
      redirect_to list_path(list)
    else
      redirect_to list_path(list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.delete

    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
