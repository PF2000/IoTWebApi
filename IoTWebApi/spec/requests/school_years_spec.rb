require 'rails_helper'

RSpec.describe "SchoolYears", type: :request do
  describe "GET /school_years" do
    it "works! (now write some real specs)" do
      get school_years_path
      expect(response).to have_http_status(200)
    end
  end
end
