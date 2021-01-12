class AdminsController < ApplicationController

  get "/login" do
    erb :login
  end

  post "/login" do
    @admin = Admin.find_by(email: params[:email])

    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      redirect '/admins/home'
    else
      redirect '/login'
    end
  end

  # get "/success" do
  #   if logged_in?
	# 		redirect "/admins/home"
	# 	else
	# 		redirect "/login"
	# 	end
	# end

  get "/logout" do
    session.clear
    redirect "/"
  end

  get "/failure" do
    erb :failure
  end

  get '/admins/home' do
    @admin = Admin.find(session[:admin_id])
    erb :'/admins/home.html'
  end

end
