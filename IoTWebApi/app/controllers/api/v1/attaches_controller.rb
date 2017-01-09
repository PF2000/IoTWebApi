module Api::V1
  class AttachesController < ApiController
    before_action :set_attach, only: [:show, :update, :destroy]

    # GET /attaches
    def index
      @attaches = Attach.all

      render json: @attaches
    end

    # GET /attaches/1
    def show
      render json: @attach
    end

    # POST /attaches
    def create
      @attach = Attach.new(attach_params)

      if @attach.save
        render json: @attach, status: :created, location: @attach
      else
        render json: @attach.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /attaches/1
    def update
      if @attach.update(attach_params)
        render json: @attach
      else
        render json: @attach.errors, status: :unprocessable_entity
      end
    end

    # DELETE /attaches/1
    def destroy
      @attach.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attach
        @attach = Attach.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def attach_params
        params.require(:attach).permit(:name, :data, :type, :description, :date, :project_id)
      end
  end
end