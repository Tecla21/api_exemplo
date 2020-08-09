class Api::V1::PostsController < Api::V1::ApiController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /api/v1/posts
  def index
    @posts = current_user.posts
    render json: @posts
  end

  # GET /api/v1/posts/1
  def show
    @post.update(number_of_view: @post.number_of_view + 1)
    render json: @post
  end

  # PATCH/PUT /api/v1/posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # POST /api/v1/posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  def destroy
    @post.destroy
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :detalhe, :number_of_view, :category_id, :user_id, :source_id, :status)
    end
end
