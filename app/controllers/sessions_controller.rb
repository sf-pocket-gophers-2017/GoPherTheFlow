get '/sessions/new'do
erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.user_id
    redirect "sessions/#{@user.id}"
  else
    status 422
    erb :'sessions/new'
  end
end

delete 'sessions/delete' do
  session.delete([:user_id])
  redirect '/'
end
