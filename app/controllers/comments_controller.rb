class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index, :show]
  before_action :authorize_member, only: [:create]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user_id = current_user.id
    @comment.posted = DateTime.now

    respond_to do |format|
      if @comment.save

        # User can edit this comment.
        current_user.add_role :can_edit, @comment

        format.html { redirect_to post_path(id: @comment.post_id), notice: 'Your comment will need to be approved before it is displayed' }
        format.json { render :show, status: :created, location: @comment }
      else
        # Form errors, redisplay
        @post = Post.find(@comment.post_id)
        format.html { render 'posts/show' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    authorize @comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.post, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :approved)
    end
end
