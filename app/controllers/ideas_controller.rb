class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :model]
  
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
  
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.json { render json: @idea, status: :created }
      else
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /ideas/:id/model.json
  def model
    
    @canvas = Canvas.new(canvas_params)
    @idea.canvas = @canvas

    respond_to do |format|
      if @idea.canvas.save
        format.json { render json: @canvas, status: :created }
      else
        format.json { render json: @canvas.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :tags, :avatar, :contact, :tags => [])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def canvas_params
      params.require(:canvas).permit( :key_partners, :key_activities, :key_resources, :value_propositions, :customer_relationships, :channels, :customer_segments, :cost_structures, :revenue_streams ).permit!
    end
  end
