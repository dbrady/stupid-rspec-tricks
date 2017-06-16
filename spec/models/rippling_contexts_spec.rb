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

  describe "#valid?" do
    context "when first_name is missing" do
      before do
        valid_params.delete :first_name
      end

      it "is not valid" do
        expect(user).not_to be_valid
      end
    end

    context "when last_name is missing" do
      before do
        valid_params.delete :last_name
      end

      it "is not valid" do
        expect(user).not_to be_valid
      end
    end

    context "when email is missing" do
      before do
        valid_params.delete :email
      end

      it "is not valid" do
        expect(user).not_to be_valid
      end
    end

    context "when age is missing" do
      before do
        valid_params.delete :age
      end

      it "is not valid" do
        expect(user).not_to be_valid
      end
    end

    context "when age is not numeric" do
      before do
        valid_params[:age] = "old"
      end

      it "is not valid" do
        expect(user).not_to be_valid
      end
    end
  end
end
