class CommentsController < ApplicationController
  def create
    # Shareをパラメータの値から探し出し,Shareに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @share = @comment.share

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to share_path(@share), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:share_id, :content)
  end
end
