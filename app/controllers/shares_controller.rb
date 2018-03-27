class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :session_login, only: [:index, :new, :edit, :show, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    # binding.pry
    @shares = Share.all
    @q      = Share.search(params[:q])
    @shares = @q.result(distinct: true)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @comment = @share.comments.build
    @comments = @share.comments
    # @favorite = current_user.favorites.find_by(share_id: @share.id)
  end

  # GET /pictures/new
  def new
     @share = Share.new
     @comment = Comment.new
    if params[:back]
      @share = Share.new(share_params)
    else
      @share = Share.new
    end
  end

  # GET /pictures/1/edit
  def edit
  end
  
  def confirm
    @share = Share.new(share_params)
    @share.user_id = current_user.id  #ここで、user_idに値を入れないといけない
    render :new if @share.invalid?
  end

  # POST /pictures
  # POST /pictures.json
  def create
    
    @share = Share.new(share_params)
    @share.user_id = current_user.id
    
    # binding.pry
    # @share.image   ##画像のurlが空ではなければ,メッソドが動く
    respond_to do |format|
      if @share.save
        # PictureMailer.picture_mail(@picture).deliver  ##追記
        format.html { redirect_to @share, notice: 'Successfully created.' }
        format.json { render :show, status: :created, location: @share }
      else
        format.html { render :new }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    # @picture = Picture.find_by_id(params[:id])
    respond_to do |format|
      # binding.pry
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url, notice: 'Successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:title, :content, :image, :image_cache)
    end
    
    def session_login
      if session[:user_id] == nil
        redirect_to new_user_session_path
      end
    end
end


