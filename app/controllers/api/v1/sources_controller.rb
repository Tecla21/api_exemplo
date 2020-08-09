class Api::V1::SourcesController < Api::V1::ApiController
  before_action :set_source, only: [:show, :update, :destroy]

  # GET /api/v1/sources
  def index
    @sources = Source.all
    render json: @sources
  end

  # GET /api/v1/sources/1
  def show
    render json: @source
  end

  # PATCH/PUT /api/v1/sources/1
  def update
    if @source.update(source_params)
        render json: @source
    else
        render json: @source.errors, status: :unprocessable_entity
    end
  end

  # POST /api/v1/sources
  def create
    @source = Source.new(source_params)
    if @source.save
        render json: @source, status: :created
    else
        render json: @source.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/sources/1
  def destroy
    @source.destroy
  end
    
  private
      # Use callbacks to share common setup or constraints between actions.
      def set_source
        @source = Source.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def source_params
        params.require(:source).permit(:name, :website_url)
      end
end
