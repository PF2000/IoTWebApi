module Api::V1
  class SchoolClassesController < ApiController
    before_action :set_school_class, only: [:show, :update, :destroy]

    # GET /school_classes
    def index
      @school_classes = SchoolClass.all

      render json: @school_classes
    end

    # GET /school_classes/1
    def show
      render json: @school_class
    end

    swagger_api :show do
      summary "Fetches a School Classes item"
      notes "This lists an active School Classes"
      param :path, :id, :integer, :required, "School Class ID"
      response :ok, "Success", :School_year
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "School Class ID doesn't exist"
    end

    # POST /school_classes
    def create
      #debugger
      @school_class = SchoolClass.new(school_class_params)

      #debugger

    swagger_api :create do
      summary "Creates a School Class item"
      notes "Creates a School Class item"
      param  :body ,:body, :School_class, :required, "Create a School Class"
      response :unauthorized
      response :not_acceptable, "School Classes ID doesn't exist"
    end

      if @school_class.save
        render json: @school_class, status: :created#, location: @school_class
      else
        render json: @school_class.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /school_classes/1
    def update
      if @school_class.update(school_class_params)
        render json: @school_class
      else
        render json: @school_class.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Updates a School Class item"
      notes "Updates a School Class item"
      param :path, :id, :integer, :required, "School Classes ID"
      param :body ,:body, :School_class, :required, "Updates a School Class"
      response :unauthorized
      response :not_acceptable, "School Classes ID doesn't exist"
    end

    # DELETE /school_classes/1
    def destroy
      @school_class.destroy
    end

    swagger_api :destroy do
      summary "Destroys a School Class item"
      notes "Destroys a School Class item"
      param :path, :id, :integer, :required, "School Class ID"
      response :unauthorized
      response :not_acceptable, "School Classes ID doesn't exist"
    end

    swagger_model :discipline do
     description "A Discipline object."
     property :id, :integer, :required, "Discipline ID"
    end

    swagger_model :room do
     description "A Room object."
     property :id, :integer, :required, "Room ID"
    end

    swagger_model :school_year do
     description "A Room object."
     property :id, :integer, :required, "School Year ID"
    end

    swagger_model :sc do
     description "An Aux school_class object."
     property :id, :integer, :required, "School Class ID"
     property :description, :string, :required, "Description"
     property :start_time, :date, :required, "Start Time"
     property :end_time, :date, :required, "End Time"
     property :class_letter, :string, :required, "Class Letter"
     property :professor, :string, :required, "Professor"
     property :discipline, :integer, :required, "Discipline ID"
     property :room, :integer, :required, "Room ID"
     property :school_year, :integer, :required, "School Year ID"
    end

    swagger_model :School_class do
     description "A School Class object."
     property :room, :sc, :required, "School Class"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_school_class
        @school_class = SchoolClass.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def school_class_params
        params.require(:school_class).permit(:description, :start_time, :end_time, :class_letter, :class_type, :professor, :discipline => [:id], :room => [:id], :school_year => [:id])
      end
  end
end