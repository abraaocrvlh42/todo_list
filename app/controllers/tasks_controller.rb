class TasksController < ApplicationController
  before_action :set_task, only: %i[ update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.order(created_at: :desc)
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_url
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task.solved = !@task.solved
    @task.save

    redirect_to tasks_url
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    redirect_to tasks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :solved)
    end
end
