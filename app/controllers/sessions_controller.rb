get '/login'do
  erb :'sessions/index'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/questions"
  else
    status 422
    @errors = ['The email or password is incorrect.']
    erb :'sessions/index'
  end
end

delete '/logout' do
  logout
  redirect '/'
end

