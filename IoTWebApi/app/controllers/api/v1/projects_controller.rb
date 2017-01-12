module Api::V1
  class ProjectsController < ApiController
    before_action :set_project, only: [:show, :update, :destroy]

    swagger_controller :projects, "Projects Management"

    # GET /projects
    def index
      @projects = Project.all

      render json: @projects
    end

    swagger_api :index do
      summary "Fetches all Project items"
      notes "This lists all the active Projects"
      response :unauthorized
      response :not_acceptable, "Project ID doesn't exist"
    end

    # GET /projects/1
    def show
      render json: @project
    end

    swagger_api :show do
      summary "Fetches a Project item"
      notes "This lists an active Project"
      param :path, :id, :integer, :optional, "Project ID"
      response :ok, "Success", :project
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "Project ID doesn't exist"
    end

    # POST /projects
    def create
      @project = Project.new(project_params)

      if @project.save
        render json: @project, status: :created#, location: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a Project item"
      notes "Creates a Project item"
      #param :course ,:name, :string, :optional, "Name"
      param  :body ,:body, :project, :required, "Create a Project"
      response :unauthorized
      response :not_acceptable, "Project ID doesn't exist"
    end

    # PATCH/PUT /projects/1
    def update
      if @project.update(project_params)
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Degree a Project item"
      notes "Degree a Project item"
      param :path, :id, :integer, :optional, "Project ID"
      param :body ,:body, :project, :required, "Updates a Project"
      response :unauthorized
      response :not_acceptable, "Project ID doesn't exist"
    end

    # DELETE /projects/1
    def destroy
      @project.destroy
    end

    swagger_api :destroy do
      summary "Destroys a Project item"
      notes "Destroys a Project item"
      param :path, :id, :integer, :optional, "Project ID"
      response :unauthorized
      response :not_acceptable, "Project ID doesn't exist"
    end

    swagger_model :project do
      description "A Project object."
      property :project, :pos, :required, "Project ID"
    end

    swagger_model :pos do
     description "A Aux Project object."
     property :id, :integer, :required, "Project ID"
     property :name, :string, :optional, "Name"
     property :description, :string, :optional, "Description"
     property :grade, :integer, :optional, "Grade"
     property_list :disciplines, :disciplines, :required, "Disciplines", [:disciplines,:disciplines]
    end

    swagger_model :disciplines do
      description "A Disciplines object."
      property :id, :integer, :required, "Disciplines ID"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_params
        params.require(:project).permit(:name, :description, :grade, :discipline => [:id], :school_year => [:id])
      end
  end
end