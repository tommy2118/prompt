class PromptsController < ApplicationController

  expose(:cue) { Cue.first }

  def index
  end

  def draft
    @draft = MediumAPI.create_draft_post(current_user["uid"], current_user['token'], cue.body)
    redirect_to @draft
  end
end
