module Api::V1
  class DegreesController < ApiController
    before_action :set_degree, only: [:show, :update, :destroy]

    swagger_controller :degrees, "Degrees Management"

    # GET /degrees
    def index
      @degrees = Degree.all

      render json: @degrees
    end

    swagger_api :index do
      summary "Fetches all Degree items"
      notes "This lists all the active Degrees"
      response :unauthorized
      response :not_acceptable, "Degree ID doesn't exist"
    end

    # GET /degrees/1
    def show
      render json: @degree
    end

    swagger_api :show do
      summary "Fetches a Degree item"
      notes "This lists an active Course"
      param :path, :id, :integer, :required, "Degree ID"
      response :ok, "Success", :Degree
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "Degree ID doesn't exist"
    end

    # POST /degrees
    def create
      @degree = Degree.new(degree_params)

      if @degree.save
        render json: @degree, status: :created#, location: @degree
      else
        render json: @degree.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a Degree item"
      notes "Creates a Degree item"
      param  :body ,:body, :Degree, :required, "Create a Degree"
      response :unauthorized
      response :not_acceptable, "Degree ID doesn't exist"
    end

    # PATCH/PUT /degrees/1
    def update
      if @degree.update(degree_params)
        render json: @degree
      else
        render json: @degree.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Updates a Degree item"
      notes "Updates a Degree item"
      param :path, :id, :integer, :required, "Degree ID"
      param :body ,:body, :Degree, :required, "Updates a Degree"
      response :unauthorized
      response :not_acceptable, "Degree ID doesn't exist"
    end

    # DELETE /degrees/1
    def destroy
      @degree.destroy
    end

    swagger_api :destroy do
      summary "Destroys a Degree item"
      notes "Destroys a Degree item"
      param :path, :id, :integer, :required, "Degree ID"
      response :unauthorized
      response :not_acceptable, "Degree ID doesn't exist"
    end

    swagger_model :Degree do
     description "A Degree object."
     property :id, :integer, :required, "Degree ID"
     property :description, :string, :required, "Description"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_degree
        @degree = Degree.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def degree_params
        params.require(:degree).permit(:description)
      end
  end
end