module Api::V1
  class SchoolYearsController < ApiController
    before_action :set_school_year, only: [:show, :update, :destroy]

    # GET /school_years
    def index
      @school_years = SchoolYear.all

      render json: @school_years
    end

    # GET /school_years/1
    def show
      render json: @school_year
    end

    # POST /school_years
    def create
      @school_year = SchoolYear.new(school_year_params)

      if @school_year.save
        render json: @school_year, status: :created, location: @school_year
      else
        render json: @school_year.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /school_years/1
    def update
      if @school_year.update(school_year_params)
        render json: @school_year
      else
        render json: @school_year.errors, status: :unprocessable_entity
      end
    end

    # DELETE /school_years/1
    def destroy
      @school_year.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_school_year
        @school_year = SchoolYear.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def school_year_params
        params.require(:school_year).permit(:description, :startTime, :endTime)
      end
  end
end