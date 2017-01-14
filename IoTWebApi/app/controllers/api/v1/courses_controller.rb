module Api::V1
  class CoursesController < ApiController
  before_action :set_course, only: [:show, :update, :destroy]

  swagger_controller :courses, "Courses Management"

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  swagger_api :index do
    summary "Fetches all Course items"
    notes "This lists all the active Course"
    response :unauthorized
    response :not_acceptable, "Course ID doesn't exist"
  end

  # GET /courses/1
  def show
    render json: @course
  end

  swagger_api :show do
    summary "Fetches a Course items"
    notes "This lists an active Course"
    param :path, :id, :integer, :required, "Course ID"
    response :ok, "Success", :course
    response :unauthorized
    response :not_acceptable
    response :not_found
    response :not_acceptable, "Course ID doesn't exist"
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    #saves the course
   if @course.save
      render json: @course, status: :created #, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  swagger_api :create do
    summary "Creates a Course item"
    notes "Creates a Course item"
    param  :body ,:body, :course, :required, "Create a Course"
    response :unauthorized
    response :not_acceptable, "Course ID doesn't exist"
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  swagger_api :update do
    summary "Updates a Course item"
    notes "Updates a Course item"
    param :path, :id, :integer, :required, "Course ID"
    param :body ,:body, :course, :required, "Updates a Course"
    response :unauthorized
    response :not_acceptable, "Course ID doesn't exist"
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  swagger_api :destroy do
    summary "Destroys a Courses item"
    notes "Destroys a Courses item"
    param :path, :id, :integer, :required, "Course ID"
    response :unauthorized
    response :not_acceptable, "Course ID doesn't exist"
  end

 swagger_model :course do
    description "A Course object."
    property :Course, :cos, :required, "Course ID"
  end
  
  swagger_model :cos do
     description "A Course aux object."
     property :id, :integer, :required, "Course ID"
     property :name, :string, :required, "Name"
     property :school, :school, :required, "School"
     property :degree, :degree, :required, "Degree"
     property_list :disciplines, :disciplines, :required, "Disciplines", [:disciplines,:disciplines]
     #property :disciplines, :disciplines, :required, "Disciplines"
  end

  swagger_model :school do
    description "A School object."
    property :id, :integer, :required, "School ID"
  end

  swagger_model :degree do
    description "A Degree object."
    property :id, :integer, :required, "Degree ID"
  end
  swagger_model :disciplines do
    description "A Disciplines object."
    property :id, :integer, :required, "Disciplines ID"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name, :school => [:id], :degree => [:id], :disciplines => [:id] );
    end
  end
end