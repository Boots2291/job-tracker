class CommentsController < ApplicationController
  def new
    @category = Category.new
    @job = Job.find(params[:job_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @job = @comment.job
    @company = @job.company
    if @comment.save
      redirect_to company_job_path(@company, @job)
    else
    render :new
    end
  end

  private

  def comment_params
   params.require(:comment).permit(:content, :job_id)
  end
end