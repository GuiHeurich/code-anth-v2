require 'rails_helper'

RSpec.describe User, type: :model do
  context "when creating new users" do
    it "validates username" do
      expect(User.new(username: "Hello")).not_to be_valid
    end

    it "validates password" do
      expect(User.new(password: "my precious")).not_to be_valid
    end 
  end
end