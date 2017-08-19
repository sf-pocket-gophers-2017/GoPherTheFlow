get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  @answer = Answer.new
  erb :'/answers/_new', layout: false
end

post '/questions/:question_id/answers' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answer = Answer.new({description: params[:description], question_id: @question.id, user_id: @user.id})
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/_new', layout: false
  end
end

get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments

  erb :'comments/_show'
end

