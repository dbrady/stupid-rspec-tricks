require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#valid?" do
    context "when first_name is missing" do
      it "returns false" do
        user = User.new(
          last_name: "Dobson",
          age: 27,
          email: "bob.dobson@example.com"
        )
        expect(user).not_to be_valid
      end
    end

    context "when last_name is missing" do
      it "returns false" do
        user = User.new(
          first_name: "Bob",
          age: 27,
          email: "bob.dobson@example.com"
        )
        expect(user).not_to be_valid
      end
    end

    context "when email is missing" do
      it "returns false" do
        user = User.new(
          first_name: "Bob",
          last_name: "Dobson",
          age: 27,
        )
        expect(user).not_to be_valid
      end
    end

    context "when age is missing" do
      it "returns false" do
        user = User.new(
          first_name: "Bob",
          last_name: "Dobson",
          email: "bob.dobson@example.com"
        )
        expect(user).not_to be_valid
      end
    end

    context "when age is not numeric" do
      it "returns false" do
        user = User.new(
          first_name: "Bob",
          last_name: "Dobson",
          age: "creepy",
          email: "bob.dobson@example.com"
        )
        expect(user).not_to be_valid
      end
    end
  end
end
