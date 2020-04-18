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
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.name = params[:name]
    if @task.save
      redirect_to user_tasks_url
    else
      render :edit
    end
  end

  


  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_url
  end
  
end
