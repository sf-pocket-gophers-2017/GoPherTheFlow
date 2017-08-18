post '/comments/question/:id' do
  @user = current_user
  @question = Question.find(params[:id])
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

post '/comments/answers/:id' do
  @user = current_user
  @answer = Answer.find(params[:id])
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
