class PromptsController < ApplicationController

  expose(:cues) { Cue.all }
  expose(:random_cue) { Cue.random_cue(cues) }

  def index
  end

  def new_random_cue
    Cue.random_cue(cues, true)

    redirect_to "/"
  end

  def draft
    @draft = MediumAPI.create_draft_post(current_user["uid"], current_user['token'], random_cue.body)

    if @draft.nil?
      session.delete(:user_id)
      @current_user = nil

      redirect_to root_path
    else

      redirect_to @draft
    end

  end

end
