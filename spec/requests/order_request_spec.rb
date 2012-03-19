require 'spec_helper'

describe "order" do
  describe "GET index" do
    describe "for a logged in user" do
      before do
        user = User.new
      end
      
      it "display user's rent history" do
        get "/rent-history"
      end
    end
  end
end
