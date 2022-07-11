require 'rails_helper'

RSpec.describe "Writings", type: :request do
  describe "GET /index" do
    it "renders" do
      get "/writings"
      expect(response).to render_template("articles/index")
    end

    it "displays all articles by creation date" do
        article_one = Article.create(title: "one", body: "first article")
        article_two = Article.create(title: "two", body: "second article")
        get "/writings"
        expect(response.body).to include(article_one.title)
        expect(response.body).to include(article_one.title)
    end
  end
end