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
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
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
  
  private

    def task_params
      params.require(:task).permit(:name, :description)
    end
  
end
