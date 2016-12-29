module Api::V1
  class DisciplinesController < ApiController
    before_action :set_discipline, only: [:show, :update, :destroy]

    swagger_controller :disciplines, "Disciplines Management"

    # GET /disciplines
    def index
      @disciplines = Discipline.all

      render json: @disciplines
    end

    swagger_api :index do
      summary "Fetches all Discipline items"
      notes "This lists all the active Disciplines"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # GET /disciplines/1
    def show
      render json: @discipline
    end

    swagger_api :show do
      summary "Fetches a Discipline item"
      notes "This lists an active Discipline"
      param :path, :id, :integer, :optional, "Discipline ID"
      response :ok, "Success", :Discipline
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # POST /disciplines
    def create
      @discipline = Discipline.new(discipline_params)

      if @discipline.save
        render json: @discipline, status: :created#, location: @discipline
      else
        render json: @discipline.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a Discipline item"
      notes "Creates a Discipline item"
      #param :course ,:name, :string, :optional, "Name"
      param  :body ,:body, :Discipline, :required, "Create a Discipline"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # PATCH/PUT /disciplines/1
    def update
      if @discipline.update(discipline_params)
        render json: @discipline
      else
        render json: @discipline.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Degree a Discipline item"
      notes "Degree a Discipline item"
      param :path, :id, :integer, :optional, "Discipline ID"
      param :body ,:body, :Discipline, :required, "Updates a Discipline"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # DELETE /disciplines/1
    def destroy
      @discipline.destroy
    end

    swagger_api :destroy do
      summary "Destroys a Discipline item"
      notes "Destroys a Discipline item"
      param :path, :id, :integer, :optional, "Discipline ID"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    swagger_model :Discipline do
     description "A Discipline object."
     property :id, :integer, :required, "Discipline ID"
     property :name, :string, :optional, "Name"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_discipline
        @discipline = Discipline.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def discipline_params
        params.require(:discipline).permit(:name, :courses => [:id])
      end
  end
end