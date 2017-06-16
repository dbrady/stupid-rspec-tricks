require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { described_class.new valid_params }
  let(:valid_params) {
    {
      first_name: "Bob",
      last_name: "Dobson",
      age: 27,
      email: "bob.dobson@example.com"
    }
  }

  context "first_name" do
    before do
      valid_params.delete :first_name
    end

    it "works" do
      expect(user).not_to be_valid
    end
  end

  context "last_name" do
    before do
      valid_params.delete :last_name
    end

    it "works" do
      expect(user).not_to be_valid
    end
  end

  context "email" do
    before do
      valid_params.delete :email
    end

    it "works" do
      expect(user).not_to be_valid
    end
  end

  context "age" do
    before do
      valid_params.delete :age
    end

    it "works" do
      expect(user).not_to be_valid
    end
  end

  context "age" do
    before do
      valid_params[:age] = "old"
    end

    it "works" do
      expect(user).not_to be_valid
    end
  end
end
