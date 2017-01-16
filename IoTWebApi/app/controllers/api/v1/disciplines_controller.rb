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
      summary "Fetches all discipline items"
      notes "This lists all the active disciplines"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # GET /disciplines/1
    def show
      render json: @discipline
    end

    swagger_api :show do
      summary "Fetches a discipline item"
      notes "This lists an active discipline"
      param :path, :id, :integer, :required, "Discipline ID"
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
      summary "Creates a discipline item"
      notes "Creates a discipline item"
      #param :course ,:name, :string, :optional, "Name"
      param  :body ,:body, :Discipline, :required, "Create a discipline"
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
      summary "Updates a discipline item"
      notes "Updates a discipline item"
      param :path, :id, :integer, :required, "Discipline ID"
      param :body ,:body, :Discipline, :required, "Updates a discipline"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    # DELETE /disciplines/1
    def destroy
      @discipline.destroy
    end

    swagger_api :destroy do
      summary "Destroys a discipline item"
      notes "Destroys a discipline item"
      param :path, :id, :integer, :required, "Discipline ID"
      response :unauthorized
      response :not_acceptable, "Discipline ID doesn't exist"
    end

    swagger_model :Discipline do
     description "A Discipline object."
     property :id, :integer, :required, "Discipline ID"
     property :name, :string, :required, "Name"
    end

    #swagger_model :courses do
      #description "A courses object."
      #property :id, :integer, :required, "Courses ID"
    #end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_discipline
        @discipline = Discipline.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def discipline_params
        params.require(:discipline).permit(:name)#, :courses => [:id])
      end
  end
end