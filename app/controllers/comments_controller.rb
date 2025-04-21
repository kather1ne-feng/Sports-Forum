class CommentsController < ApplicationController
  before_action :require_login

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user = Current.user

    if @comment.save
      redirect_to @event, notice: "comment added"
    else
      redirect_to @event, notice: "comment can't be blank"
    end
  end

  private

  def comment_params
    params.expect(comment: [ :content ])
  end

  def require_login
    redirect_to new_session_path, alert: "log in to post comments" unless Current.user
  end
end
