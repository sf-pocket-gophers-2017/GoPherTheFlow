# Show all questions on the home page
get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

# Fetch the form for posting a new question
get '/questions/new' do
  erb :'questions/new'
end

# Post the form with question params
post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @corr_answers = @question.answers

  erb :'questions/show'
end

get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @question_comments = @question.comments
end

