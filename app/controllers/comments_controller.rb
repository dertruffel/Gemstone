class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_manager, only: [:destroy]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @post, notice: 'Comment couldnt be created.' }
      end
    end
  end

  def vote_up
    begin
      comentt = Comment.find(params[:id])
      if current_user.voted_how?(comentt)==nil or current_user.voted_how?(comentt)==false
        current_user.vote_exclusively_for(comentt)
        flash[:notice] = "Upvoted!"
        redirect_back fallback_location: root_path
      end
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Error has occured!"
    end
  end
  def vote_down
    begin
      comentt = Comment.find(params[:id])
      if current_user.voted_how?(comentt)==nil or current_user.voted_how?(comentt)==true
        current_user.vote_exclusively_against(comentt)
        flash[:notice] = "Downvoted!"
        redirect_back fallback_location: root_path
      end
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Error has occured!"
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def admin_manager
    if isadmin
      @comment = Comment.find_by(id:params[:id])
    end
  end

end
