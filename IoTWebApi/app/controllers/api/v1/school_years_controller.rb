module Api::V1
  class SchoolYearsController < ApiController
    before_action :set_school_year, only: [:show, :update, :destroy]

    swagger_controller :school_years, "School Year Management"

    # GET /school_years
    def index
      @school_years = SchoolYear.all

      render json: @school_years
    end

    swagger_api :index do
      summary "Fetches all school year items"
      notes "This lists all the active school year"
      response :unauthorized
      response :not_acceptable, "School year ID doesn't exist"
    end

    # GET /school_years/1
    def show
      render json: @school_year
    end

    swagger_api :show do
      summary "Fetches a school year item"
      notes "This lists an active school year"
      param :path, :id, :integer, :required, "School year ID"
      response :ok, "Success", :School_year
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "School year ID doesn't exist"
    end

    # POST /school_years
    def create
      @school_year = SchoolYear.new(school_year_params)

      if @school_year.save
        render json: @school_year, status: :created#, location: @school_year
      else
        render json: @school_year.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a school year item"
      notes "Creates a school year item"
      param  :body ,:body, :School_year, :required, "Create a school year"
      response :unauthorized
      response :not_acceptable, "School year ID doesn't exist"
    end

    # PATCH/PUT /school_years/1
    def update
      if @school_year.update(school_year_params)
        render json: @school_year
      else
        render json: @school_year.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Updates a school year item"
      notes "Updates a school year item"
      param :path, :id, :integer, :required, "School year ID"
      param :body ,:body, :School_year, :required, "Updates a school year"
      response :unauthorized
      response :not_acceptable, "School year ID doesn't exist"
    end

    # DELETE /school_years/1
    def destroy
      @school_year.destroy
    end

    swagger_api :destroy do
      summary "Destroys a school year item"
      notes "Destroys a school year item"
      param :path, :id, :integer, :required, "School year ID"
      response :unauthorized
      response :not_acceptable, "School year ID doesn't exist"
    end

    swagger_model :School_year do
     description "A School Year object."
     property :id, :integer, :required, "School Year ID"
     property :description, :string, :required, "Description"
     property :start_time, :date, :required, "Start Time"
     property :end_time, :date, :required, "End Time"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_school_year
        @school_year = SchoolYear.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def school_year_params
        params.require(:school_year).permit(:description, :start_time, :end_time)
      end
  end
end