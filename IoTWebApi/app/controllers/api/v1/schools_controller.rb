module Api::V1
  class SchoolsController < ApiController
  before_action :set_school, only: [:show, :update, :destroy]

  swagger_controller :schools, "Schools Management"

  # GET /schools
  def index
    @schools = School.all

    render json: @schools
  end

  swagger_api :index do
    summary "Fetches all School items"
    notes "This lists all the active Schools"
    response :unauthorized
    response :not_acceptable, "School ID doesn't exist"
  end

  # GET /schools/1
  def show
    render json: @school
  end

  swagger_api :show do
    summary "Fetches a School item"
    notes "This lists an active School"
    param :path, :id, :integer, :optional, "School ID"
    response :ok, "Success", :School
    response :unauthorized
    response :not_acceptable
    response :not_found
    response :not_acceptable, "School ID doesn't exist"
  end

  # POST /schools
  def create
    @school = School.new(school_params)

    if @school.save
      render json: @school, status: :created#, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  swagger_api :create do
    summary "Creates a School item"
    notes "Creates a School item"
    param  :body ,:body, :School, :required, "Create a School"
    response :unauthorized
    response :not_acceptable, "School ID doesn't exist"
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  swagger_api :update do
    summary "Updates a School item"
    notes "Updates a School item"
    param :path, :id, :integer, :optional, "School ID"
    param :body ,:body, :School, :required, "Updates a School"
    response :unauthorized
    response :not_acceptable, "School ID doesn't exist"
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
  end

  swagger_api :destroy do
    summary "Destroys a School item"
    notes "Destroys a School item"
    param :path, :id, :integer, :optional, "School ID"
    response :unauthorized
    response :not_acceptable, "School ID doesn't exist"
  end


  swagger_model :School do
     description "A School object."
     property :id, :integer, :required, "School ID"
     property :name, :string, :optional, "Name"
     property :country, :string, :required, "Country"
     property :distric, :string, :optional, "District"
     property :city, :string, :required, "City"
     property :county, :string, :optional, "County"
     property :postCode, :string, :required, "Post Code"
     property :addressDetails, :string, :optional, "Address Details"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:name, :country, :distric, :city, :county, :postCode, :addressDetails)
    end
  end 
end