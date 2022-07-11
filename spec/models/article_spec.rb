require 'rails_helper'

RSpec.describe Article, type: :model do
  context "when creating new articles" do
    it "validates title" do
      expect(Article.new(body: "The body")).not_to be_valid
    end

    it "validates body" do
      expect(Article.new(title: "The title")).not_to be_valid
    end 
  end
end
