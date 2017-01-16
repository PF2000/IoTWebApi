module Api::V1
  class RoomsController < ApiController
    before_action :set_room, only: [:show, :update, :destroy]

    swagger_controller :rooms, "Rooms Management"

    # GET /rooms
    def index
      @rooms = Room.all

      render json: @rooms
    end

    swagger_api :index do
      summary "Fetches all room items"
      notes "This lists all the active rooms"
      response :unauthorized
      response :not_acceptable, "Room ID doesn't exist"
    end

    # GET /rooms/1
    def show
      render json: @room
    end

    swagger_api :show do
      summary "Fetches a room item"
      notes "This lists an active room"
      param :path, :id, :integer, :required, "Room ID"
      response :ok, "Success", :Room
      response :unauthorized
      response :not_acceptable
      response :not_found
      response :not_acceptable, "Room ID doesn't exist"
    end

    # POST /rooms
    def create
      @room = Room.new(room_params)

      if @room.save
        render json: @room, status: :created#, location: @room
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end

    swagger_api :create do
      summary "Creates a room item"
      notes "Creates a room item"
      #param :course ,:name, :string, :optional, "Name"
      param  :body ,:body, :Room, :required, "Create a room"
      response :unauthorized
      response :not_acceptable, "Room ID doesn't exist"
    end

    # PATCH/PUT /rooms/1
    def update
      if @room.update(room_params)
        render json: @room
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end

    swagger_api :update do
      summary "Updates a room item"
      notes "Updates a room item"
      param :path, :id, :integer, :required, "Room ID"
      param :body ,:body, :Room, :required, "Updates a room"
      response :unauthorized
      response :not_acceptable, "Room ID doesn't exist"
    end

    # DELETE /rooms/1
    def destroy
      @room.destroy
    end

    swagger_api :destroy do
      summary "Destroys a room item"
      notes "Destroys a room item"
      param :path, :id, :integer, :required, "Room ID"
      response :unauthorized
      response :not_acceptable, "Room ID doesn't exist"
    end

    swagger_model :Rm do
     description "A Aux Room object."
     property :id, :integer, :required, "Room ID"
     property :school, :school, :required, "School"
     property :description, :string, :required, "Description"
     property :projector, :boolean, :required, "Has Projector?"
     property :seats, :integer, :required, "Number of Seats"
    end

    swagger_model :school do
      description "A School object."
      property :id, :integer, :required, "School ID"
    end

    swagger_model :Room do
     description "A Room object."
     property :room, :Rm, :required, "Room"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_room
        @room = Room.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def room_params
        params.require(:room).permit(:description, :projector, :seats, :school => [:id])
      end
  end
end