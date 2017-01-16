module Api::V1
  class SummariesController < ApiController
    before_action :set_summary, only: [:show, :update, :destroy]

    swagger_controller :summaries, "Summaries Management"

    # GET /summaries
    def index
      @summaries = Summary.all
      debugger
      render json: @summaries
    end

    # GET /summaries/1
    def shows
      render json: @summary
    end

    swagger_api :show do
      summary "Fetches a Summaries item"
      notes "This lists an active Summaries"
      param :path, :id, :integer, :required, "Summaries ID"
      response :ok, "Success", :Summaries
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "Summaries ID doesn't exist"
    end

    # POST /summaries
    def create
      @summary = Summary.new(summary_params)

      if @summary.save
        render json: @summary, status: :created#, location: @summary
      else
        render json: @summary.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a Summaries item"
      notes "Creates a Summaries item"
      param  :body ,:body, :Summaries, :required, "Create a Summaries"
      response :unauthorized
      response :not_acceptable, "Summaries ID doesn't exist"
    end

    # PATCH/PUT /summaries/1
    def update
      if @summary.update(summary_params)
        render json: @summary
      else
        render json: @summary.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Updates a Summaries item"
      notes "Updates a Summaries item"
      param :path, :id, :integer, :required, "Summaries ID"
      param :body ,:body, :Summaries, :required, "Updates a Summaries"
      response :unauthorized
      response :not_acceptable, "Summaries ID doesn't exist"
    end

    # DELETE /summaries/1
    def destroy
      @summary.destroy
    end

    swagger_api :destroy do
      summary "Destroys a Summaries item"
      notes "Destroys a Summaries item"
      param :path, :id, :integer, :required, "Summaries ID"
      response :unauthorized
      response :not_acceptable, "Summaries ID doesn't exist"
    end

    swagger_model :ss do
     description "An Aux Summaries object."
     property :id, :integer, :required, "Summaries ID"
     property :number_students, :integer, :required, "Number of Students"
     property :description, :string, :required, "Description"
     property :date, :date, :required, "Date"
     property :school_class, :integer, :required, "School Class ID"
    end

     swagger_model :school_class do
      description "A School Class object."
      property :id, :integer, :required, "School Class ID"
    end

    swagger_model :Summaries do
     description "A Summaries object."
     property :Summaries, :ss, :required, "Summaries"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_summary
        @summary = Summary.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def summary_params
        params.require(:summary).permit(:number_students, :description, :date, :school_class  => [:id])
      end
  end
end