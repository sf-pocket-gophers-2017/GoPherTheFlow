# Get new comment on a question
get "questions/:question_id/comments/new" do
  @question = Question.find(params[:question_id])
  @comment = Comment.new
  erb :'comments/_new_question_comment'
end

# Get new comment on an answer
get "answers/:answer_id/comments/new" do
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new
  erb :'/comments/_new_answer_comment'
end

# Create new comment on a question
post '/questions/:question_id/comments' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @comment = Comment.new({
    description: params[:description],
    user_id: @user.id,
    commentable_id: @question.id,
    commentable_type: Question
    })

  if @comment.save?
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/_new_question_comment', layout: false
  end
end

# Create new comment on an answer
post '/answers/:answer_id/comments' do
  @user = current_user
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new({
    description: params[:description],
    user_id: @user.id,
    commentable_id: @answer.id,
    commentable_type: Answer
    })

  if @comment.save?
    redirect "/questions/#{@answer.question_id}"
  else
    @errors = @comment.errors.full_messages
    erb :'/comments/_new_answer_comment', layout: false
  end
end
