class PromptsController < ApplicationController

  def index
  end

  def draft
    @draft = MediumAPI.create_draft_post(current_user["uid"], current_user['token'], "test")
    redirect_to @draft
  end
end
