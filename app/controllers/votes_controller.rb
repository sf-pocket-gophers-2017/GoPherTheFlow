# Votes on Questions
get '/questions/:question_id/votes/new' do
  @question = Question.find(params[:question_id])
  @vote = Vote.new
  erb :'votes/new'
end

post '/questions/:question_id/votes' do
  @user = current_user
  @question = Question.find(params[:question_id])
  vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Question, voteable_id: @question.id)
  if vote_exists
    @errors = [
      "#{@user.username} has already voted on this question.",
      "You cannot vote for the same question more than once."
    ]
    erb :"/questions/show"
  else
    @vote = @question.votes.new(user_id: @user.id)

    if @vote.save?
      redirect "/questions/#{@question.id}"
    else
      @errors = @vote.errors.full_messages
      erb :"/questions/show"
    end
  end
end

delete '/questions/:question_id/votes' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @vote = Vote.find_by(user_id: @user.id, voteable_type: Question, voteable_id: @question.id)
  @vote.destroy
  redirect "/questions/#{@question.id}"
end


# Votes on Answers
get '/answers/:answer_id/votes/new' do
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.new
  erb :'votes/_new'
end

post '/answers/:answer_id/votes' do
  @user = current_user
  @answer = Answer.find(params[:answer_id])
  vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Answer, voteable_id: @answer.id)
  if vote_exists
    @errors = [
      "#{@user.username} has already voted on this answer.",
      "You cannot vote for the same answer more than once."
    ]
    erb :"/questions/show"
  else
    @vote = @answer.votes.new(user_id: @user.id)

    if @vote.save?
      redirect "/questions/#{@answer.question_id}"
    else
      @errors = @vote.errors.full_messages
      erb :"/questions/show"
    end
  end
end

delete '/answers/:answer_id/votes' do
  @user = current_user
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.find_by(user_id: @user.id, voteable_type: Answer, voteable_id: @answer.id)
  @vote.destroy
  redirect "/questions/#{@answer.question_id}"
end


# Votes on Comments
get '/comments/:comment_id/votes/new' do
  @comment = Comment.find(params[:comment_id])
  @vote = Vote.new
  erb :"/questions/show"
end

post '/comments/:comment_id/votes' do
  @user = current_user
  @comment = Comment.find(params[:comment_id])
  vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
  if vote_exists
    @errors = [
      "#{@user.username} has already voted on this comment.",
      "You cannot vote for the same comment more than once."
    ]
    erb :"/questions/show"
  else
    @vote = @comment.votes.new(user_id: @user.id)

    if @vote.save?
      if @comment.commentable_type == "Question"
        redirect "/questions/#{@comment.commentable_id}"
      elsif @comment.commentable_type == "Answer"
        redirect "/questions/#{@comment.commentable_id.question_id}"
      else
        @errors = ["Undefined comment type."]
        erb :"/questions/show"
      end
    else
      @errors = @vote.errors.full_messages
      erb :"/questions/show"
    end
  end
end

delete '/comments/:comment_id/votes' do
  @user = current_user
  @comment = Comment.find(params[:comment_id])
  @vote = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
  @vote.destroy
  if @comment.commentable_type == "Question"
    redirect "/questions/#{@comment.commentable_id}"
  elsif @comment.commentable_type == "Answer"
    redirect "/questions/#{@comment.commentable_id.question_id}"
  else
    @errors = ["Undefined comment type."]
    erb :"/questions/show"
  end
end
