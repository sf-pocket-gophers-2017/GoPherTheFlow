post '/:voteable_type/:voteable_id/votes' do
  voteable_class = params[:voteable_type].capitalize[0...-1].constantize
  voteable_string = params[:voteable_type].downcase[0...-1]
  @voteable = voteable_class.find(params[:voteable_id])
  @user = current_user
  @vote = @voteable.votes.create!(up_down: params[:up_down], user_id: @user.id)
  redirect "/questions/#{params[:question_id]}"
end

# -------------------------------------------------------- #

# Below is creating a unique route for each option of votes.
# With a separate partial to include all various routes.

# DO NOT DO THIS EVER!!!

# -------------------------------------------------------- #

# # Up Votes on Questions
# get '/questions/:question_id/votes_up' do
#   @question = Question.find(params[:question_id])
#   @vote_up = Vote.new
#   erb :'votes/for_questions/_up_vote'
# end

# post '/questions/:question_id/votes_up' do
#   @user = current_user
#   @question = Question.find(params[:question_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Question, voteable_id: @question.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this question.",
#       "You cannot vote for the same question more than once."
#     ]
#     erb :"/questions/show"
#   else
#     @vote = @question.votes.new(user_id: @user.id)
#     @vote.up_down = 'up-vote'

#     if @vote.save
#       redirect "/questions/#{@question.id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # Down Votes on Questions
# get '/questions/:question_id/votes_down' do
#   @question = Question.find(params[:question_id])
#   @vote_up = Vote.new
#   erb :'votes/for_questions/_down_vote'
# end

# post '/questions/:question_id/votes_down' do
#   @user = current_user
#   @question = Question.find(params[:question_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Question, voteable_id: @question.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this question.",
#       "You cannot vote for the same question more than once."
#     ]
#     erb :"/questions/show"
#   else
#     @vote = @question.votes.new(user_id: @user.id)
#     @vote.up_down = 'down-vote'

#     if @vote.save
#       redirect "/questions/#{@question.id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # -------------------------------------------------------- #

# # Up Votes on Answers
# get '/answers/:answer_id/votes/votes_up' do
#   @answer = Answer.find(params[:answer_id])
#   @vote = Vote.new
#   erb :'votes/for_answers/_up_vote'
# end

# post '/answers/:answer_id/votes_up' do
#   @user = current_user
#   @answer = Answer.find(params[:answer_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Answer, voteable_id: @answer.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this answer.",
#       "You cannot vote for the same answer more than once."
#     ]
#     erb :"/questions/show"
#   else
#     @vote = @answer.votes.new(user_id: @user.id)
#     @vote.up_down = 'up-vote'

#     if @vote.save
#       redirect "/questions/#{@answer.question_id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # Down Votes on Answers
# get '/answers/:answer_id/votes_down' do
#   @answer = Answer.find(params[:answer_id])
#   @vote = Vote.new
#   erb :'votes/for_answers/_down_vote'
# end

# post '/answers/:answer_id/votes_down' do
#   @user = current_user
#   @answer = Answer.find(params[:answer_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Answer, voteable_id: @answer.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this answer.",
#       "You cannot vote for the same answer more than once."
#     ]
#     erb :"/questions/show"
#   else
#     @vote = @answer.votes.new(user_id: @user.id)
#     @vote.up_down = 'down-vote'

#     if @vote.save
#       redirect "/questions/#{@answer.question_id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # -------------------------------------------------------- #

# # Up Votes on Comments on Questions
# get 'questions/:question_id/comments/:comment_id/votes_up' do
#   @question = Question.find(params[:question_id])
#   @comment = Comment.find(params[:comment_id])
#   @vote = Vote.new
#   erb :'votes/for_comments/on_questions/_up_vote'
# end

# post 'questions/:question_id/comments/:comment_id/votes_up' do
#   @user = current_user
#   @question = Question.find(params[:question_id])
#   @comment = Comment.find(params[:comment_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this comment.",
#       "You cannot vote for the same comment more than once."
#     ]
#     erb :"/questions/show"
#   else
#     if @vote.save
#       @vote = @comment.votes.new(user_id: @user.id)
#       @vote.up_down = 'up-vote'

#       redirect "/questions/#{@question.id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # Down Votes on Comments on Questions
# get 'questions/:question_id/comments/:comment_id/votes_down' do
#   @question = Question.find(params[:question_id])
#   @comment = Comment.find(params[:comment_id])
#   @vote = Vote.new
#   erb :'votes/for_comments/on_questions/_down_vote'
# end

# post 'questions/:question_id/comments/:comment_id/votes_down' do
#   @user = current_user
#   @question = Question.find(params[:question_id])
#   @comment = Comment.find(params[:comment_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this comment.",
#       "You cannot vote for the same comment more than once."
#     ]
#     erb :"/questions/show"
#   else
#     if @vote.save
#       @vote = @comment.votes.new(user_id: @user.id)
#       @vote.up_down = 'down-vote'

#       redirect "/questions/#{@question.id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # -------------------------------------------------------- #

# # Up Votes on Comments on Answers
# get 'answers/:answer_id/comments/:comment_id/votes_up' do
#   @answer = Answer.find(params[:answer_id])
#   @comment = Comment.find(params[:comment_id])
#   @vote = Vote.new
#   erb :'votes/for_comments/on_answers/_up_vote'
# end

# post 'answers/:answer_id/comments/:comment_id/votes_up' do
#   @user = current_user
#   @answer = Answer.find(params[:answer_id])
#   @comment = Comment.find(params[:comment_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this comment.",
#       "You cannot vote for the same comment more than once."
#     ]
#     erb :"/questions/show"
#   else
#     if @vote.save
#       @vote = @comment.votes.new(user_id: @user.id)
#       @vote.up_down = 'up-vote'

#       redirect "/questions/#{@answer.question_id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end

# # Down Votes on Comments on Answers
# get 'answers/:answer_id/comments/:comment_id/votes_down' do
#   @answer = Answer.find(params[:answer_id])
#   @comment = Comment.find(params[:comment_id])
#   @vote = Vote.new
#   erb :'votes/for_comments/on_answers/_down_vote'
# end

# post 'answers/:answer_id/comments/:comment_id/votes_down' do
#   @user = current_user
#   @answer = Answer.find(params[:answer_id])
#   @comment = Comment.find(params[:comment_id])
#   vote_exists = Vote.find_by(user_id: @user.id, voteable_type: Comment, voteable_id: @comment.id)
#   if vote_exists
#     @errors = [
#       "#{@user.username} has already voted on this comment.",
#       "You cannot vote for the same comment more than once."
#     ]
#     erb :"/questions/show"
#   else
#     if @vote.save
#       @vote = @comment.votes.new(user_id: @user.id)
#       @vote.up_down = 'down-vote'

#       redirect "/questions/#{@answer.question_id}"
#     else
#       @errors = @vote.errors.full_messages
#       erb :"/questions/show"
#     end
#   end
# end
