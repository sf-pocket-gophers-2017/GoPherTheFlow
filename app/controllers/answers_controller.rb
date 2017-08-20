get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  @answer = Answer.new
  if request.xhr?
    erb :"answers/_new", layout: false
  else
    erb :"answers/_new"
  end
end

post '/questions/:question_id/answers' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answer = Answer.new({description: params[:description], question_id: @question.id, user_id: @user.id})
  if @answer.save
    if request.xhr?
      erb :"answers/_show", locals: {answer: @answer}, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @answer.errors.full_messages
    erb :'answers/_new', layout: false
  end
end

get '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @comments = @answer.comments
  erb :'comments/_show'
end

