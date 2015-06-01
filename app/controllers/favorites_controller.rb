class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new
    new_name = nil
    if params[:name] == 'on' && params[:favorite][:new_folder_name].present?
      new_name = params[:favorite][:new_folder_name]
    elsif params[:name].present?
      new_name = params[:name]
    end
    if new_name
      folder = Folder.where(name: new_name, user_id: current_user.id).first_or_create!
      @favorite.post_id = params[:post_id]
      @favorite.user_id = current_user.id
      @favorite.folder_id = folder.id
    end


    respond_to do |format|
      if @favorite.save
        format.html { redirect_to request.referer }
        format.json { render action: 'show', status: :created, location: @favorite }
      else
        format.html { redirect_to root_path }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :post_id, :folder_id)
    end
end
