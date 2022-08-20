class PostsController < ApplicationController
  protect_from_forgery
  
  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      id: params[:id],
      title: params[:title],
      start_date: params[:start_date],
      end_date: params[:end_date],
      all_date: params[:all_date],
      updated_at: params[:updated_at],
      text: params[:text]
    )
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.start_date = params[:start_date]
    @post.end_date = params[:end_date]
    @post.all_date = params[:all_date]
    @post.text = params[:text]
    if @post.save
      flash[:notice] = "スケジュールを更新しました"
      redirect_to("/")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to("/")
  end

  

end

