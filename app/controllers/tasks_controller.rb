# frozen_string_literal: true
class TasksController < ApplicationController
  # Read all tasks
  def index
    @tasks = Task.all
  end

  # Read a task
  def show
    @task = Task.find(params[:id])
  end

  # Create a task
  # first create the new task as an instance of Task
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path # WHAT IS THIS DOING --> redirecting to home page
  end

  # Update a task
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end
  # Destroy a task

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
