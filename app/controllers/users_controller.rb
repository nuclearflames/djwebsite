class UsersController < ApplicationController
  # GET /users
  # GET /users.json 
  skip_before_filter :authenticate, :only => ['new', 'create', 'show']

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
	if current_user 
		@user = User.find(current_user) 
	end
	if !params[:code]
	    @user = User.new

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @user }
	    end
    
	else code = params[:code]
		if code
			code_components = code.split(/_/)
			if code_components.length == 2
				@user = User.find(code_components[0])
				if @user and @user.verify_id_digest(code_components[1])
					@user.activated = true
					@user.save
					respond_to do |format|
						flash[:notice] = 'Welcome! You are a valid user, you can now logon.'
						format.html {redirect_to(:controller => 'home', :action => 'index')}
					end
				end
			end
		end	
	end	    
  end

  # GET /users/1/edit
  def edit
	if session[:edit] == nil
		redirect_to "/login"
		session[:edit] == false
		flash[:notice] = "Re-sign in to validate your right to make edits"
	elsif session[:edit] == true
		@user = User.find(params[:id])
	end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
	RegistrationMailer.registration_email(@user).deliver
	{:action=> "/logout"}
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
	session[:edit] = nil
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
