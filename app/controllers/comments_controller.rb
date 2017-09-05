class CommentsController < ApplicationController
  def new
    @category = Category.new
    @job = Job.find(params[:job_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @job = params[:job_id]
    if @comment.save
      redirect_to company_job_path(@comment.job)
    end
  end

  private

  def comment_params
   params.require(:comment).permit(:content, :job_id)
  end
end