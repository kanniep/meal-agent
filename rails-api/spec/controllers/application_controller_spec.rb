require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  describe "Define new_session_path" do
    it "get new_session_path" do
      controller.new_session_path nil
      expect(response).to have_http_status(:success)
    end
  end

end
