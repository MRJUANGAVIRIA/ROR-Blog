class PollsController < ApplicationController

  def index
    @polls = Poll.all
  end

def new
  @poll = Poll.new

end

def create
  @poll = Poll.new(poll_params)
  if @poll.save
        redirect_to polls_path
  end
end

def edit
  @poll = Poll.find(params[:id])
end

def update
@poll = Poll.find(params[:id])
@poll.vote_yes += 1
    if @poll.update_attributes(poll_params)
        redirect_to polls_path
    end
end

private
  def poll_params
      params.require(:poll).permit(:title, :vote_yes, :votes_no)
  end

end