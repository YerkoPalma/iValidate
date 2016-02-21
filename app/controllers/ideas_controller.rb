class IdeasController < ApplicationController
  before_action :set_idea, only: [:show]
  
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end
  
  # GET /ideas/1.json
  def show
    respond_to do |format|
      format.json { render json: @idea }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :tags)
    end
end