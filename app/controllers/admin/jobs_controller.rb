class Admin::JobsController < Admin::BaseController

  before_action :set_job, only: [
    :edit,
    :update,
    :destroy
  ]


  def dashboard
    @published_job_count = Job.published.count
    @draft_job_count = Job.drafted.count
  end

  def index
    @jobs = Job.published.page(params[:page]).per(50)
  end

  def drafts
    @jobs = Job.drafted.page(params[:page]).per(50)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params.merge!(user: current_user))
    @job.user_id = current_user.id
    if @job.save
      redirect_to admin_jobs_dashboard_path, notice: "New job published."
    else
      flash[:alert] = "Job not published."
      render :new
    end
  end

  def edit
  end

  def update
    @job.slug = nil
    if @job.update(job_params.merge!(user: current_user))
      redirect_to admin_jobs_dashboard_path, notice: "Job successfully edited."
    else
      flash[:alert] = "The job was not edited."
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, notice: "The job has been deleted."
  end


  private

  def set_job
    @job = Job.where(user: current_user).friendly.find(params[:id])
  end

  def job_params
    params.require(:job).permit(
      :title,
      :content_md,
      :draft,
      :updated_at,
      :keywords,
      :city,
      :job_length,
      :job_type,
      :suitable_for_graduates,
      :category_id,
      :salary,
      :reference
    )
  end


end
