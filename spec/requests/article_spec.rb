require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "POST /new" do
    it "creates an article and redirects to the article's page" do
      expect {
        post articles_url, params: { article: { title: "can create", body: "article successfully." } }
      }.to change{ Article.count }.by(1)
    end
  end
  
  describe "PATCH" do
    it "updates existing articles" do
      get "/articles/new"
      post "/articles", params: { article: { title: "can create", body: "article successfully." } }
      patch "/articles/#{Article.last.id}", params: { article: { body: "new me!" } }
      follow_redirect!
      expect(response.body).to include {"new me!"}
    end
  end

  describe "DESTROY" do
    it "deletes existing articles" do
      get "/articles/new"
      post "/articles", params: { article: { title: "can create", body: "article successfully." } }
      expect {
        delete article_url(Article.last), headers: {"Authorization" => "Bearer #{@token}"}
      }.to change{ Article.count }.by(-1)
    end
  end
end