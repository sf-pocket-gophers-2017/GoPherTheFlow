get '/answers/:id' do
  @answers = Answer.all
  erb :'/answers/_show', layout: false
end

post '/questions/:id/answers' do
  @user = current_user
  @question = Question.find(params[:id])
  @answer = Answer.new({description: params[:description], question_id: @question.id, user_id: @user.id})
  if @answer.save?
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/_new', layout: false
  end
end


