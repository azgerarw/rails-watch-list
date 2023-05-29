class BookmarksController < ApplicationController

  def new
    # retrieve the course to build the right action in the form
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
   # AN INSTANCE OF COURSE


    if @bookmark.save
    redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy

    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
