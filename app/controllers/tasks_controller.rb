class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:honeys_list]
      # Query to get honey's list
    else
      tasks = current_user.assigned_tasks
    end

    render json: tasks
  end
end