class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_redirect, only: [:create, :destroy]
  before_action :set_bookmark_check_owner, only: [:destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.user_bookmarks(current_user)
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id


    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @redirect, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: bookmarks_path }
      else
        format.html { redirect_to @redirect, alert: "Bookmark could not be saved" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @redirect, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Check if the current user is the owner of the bookmark and also set the bookmark
    def set_bookmark_check_owner
      @bookmark = Bookmark.find(params[:id])

      if @bookmark.user != current_user
        respond_to do |format|

          format.html { redirect_to root_url, alert: "You dont have permissions for this action"}

        end
      end
    end

    # Custom redirect for create and destroy methodss
    def set_redirect
      @redirect = params[:origin_url] == nil ? bookmarks_path : params[:origin_url]
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.permit(:bookmark, :post_id)
    end
end
