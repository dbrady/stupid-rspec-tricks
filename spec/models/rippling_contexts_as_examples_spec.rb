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

  describe "validates params" do
    example "when first_name is missing" do
      valid_params.delete :first_name
      expect(User.new(valid_params)).not_to be_valid
    end

    example "when last_name is missing" do
      valid_params.delete :last_name
      expect(User.new(valid_params)).not_to be_valid
    end

    example "when email is missing" do
      valid_params.delete :email
      expect(User.new(valid_params)).not_to be_valid
    end

    example "when age is missing" do
      valid_params.delete :age
      expect(User.new(valid_params)).not_to be_valid
    end

    example "when age isn't a number" do
      valid_params[:age] = "baby"
      expect(User.new(valid_params)).not_to be_valid
    end
  end
end
