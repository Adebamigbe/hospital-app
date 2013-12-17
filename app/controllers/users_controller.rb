class UsersController < ApplicationController


  # load_and_authorize_resource except: [:create, :new]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @title = "Sign up"
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @title = "Sign up"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.role = @user.role

    if @user.save
      @user.authenticate(params[:user][:password])
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      @title = "Sign up"
      render :new
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes params[:user]
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
     @user.delete
    redirect_to user_url(@user)
  end
end
