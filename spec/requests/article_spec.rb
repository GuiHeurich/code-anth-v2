require 'rails_helper'

RSpec.describe "Writings", type: :request do
  describe "POST /new" do
    it "creates new articles" do
      get "/articles/new"
      assert_response :success
    
      post "/articles",
        params: { article: { title: "can create", body: "article successfully." } }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "p", "Title:\n can create"
    end
  end
end