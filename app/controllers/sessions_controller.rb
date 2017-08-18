get '/login'do
  erb :'login/index'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
  else
    status 422
    errors.add('login failed')
    erb :'login/index'
  end
end

delete '/logout' do
  logout
  redirect '/'
end
