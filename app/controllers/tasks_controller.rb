class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:honeys]
      tasks = current_user.created_tasks
    else
      tasks = current_user.assigned_tasks
    end

    render json: tasks
  end
end