class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(name: params[:name], user_id: params[:user_id])
    if @task.save
      flash[:notice] = "投稿しました！"
      redirect_to user_tasks_url
    else
      render :new
    end
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
      flash[:notice] = "投稿を編集しました。"
      redirect_to user_tasks_url
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to user_tasks_url
  end
  
end
