class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(votes: :desc).limit(3)
    @subjects = %w(INFORMÁTICA CULINÁRIA PROFISSÃO AUTOMOTIVOS CONSERTOS GAMES EDUCAÇÃO TECNOLOGIA)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = [["Informática", "Culinária"], ["Profissão", "Automotivo"], ["Conserto", "Games"], ["Educação", "Tecnologia"]]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.tags = params[:tags_list]

    respond_to do |format|
      if @post.save
        flash.now[:success] = 'Post criado com sucesso'
        format.html { redirect_to my_account_path(current_user) }
      else
        format.html { render action: 'new' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote_post
    @post = Post.find(params[:id])
    if @post.user.id == current_user.id
      flash.now[:danger] = 'Você é o dono do post'
    else
      if current_user.voted_in?(@post)
        flash.now[:danger] = 'Você já votou neste post'
      else
        Vote.create(post_id: @post.id, user_id: current_user.id)
        @post.update_votes_count
      end
    end
    respond_to do |format|
      format.js {
        render template: "posts/vote_post_changer.js.erb",
               layout: false
      }
    end
  end

  def unvote_post
    session[:return_to] ||= request.referer
    @post = Post.find(params[:id])
    Vote.find_by(user_id: current_user.id, post_id: @post.id).delete
    @post.update_votes_count
    respond_to do |format|
      format.js {
        render template: "posts/vote_post_changer.js.erb",
               layout: false
      }
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :tags)
    end
end
