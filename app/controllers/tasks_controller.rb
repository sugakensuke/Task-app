class TasksController < ApplicationController
  
  def new
  end
  
  def create
    @task = Task.new(name: params[:name], user_id: params[:user_id])
    @task.save
    redirect_to user_tasks_url
  end
  
  def index
    @tasks = Task.all
    @user = User.find(params[:user_id]) 
  end
  
  def show
    @task_id = params[:id] #不要
    @task = Task.find(params[:id])
  end
  
end
