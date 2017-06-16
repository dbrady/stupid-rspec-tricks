require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_name" do
    it "capitalizes first and last names" do
      expect(User.new(first_name: "john", last_name: "doe").full_name).to eq "John Doe"
    end

    it "removes whitespace from names" do
      expect(User.new(first_name: "  john  ", last_name: "  doe  ").full_name).to eq "John Doe"
    end

    describe "returns as much of the name as possible" do
      example "when both names are blank returns empty string" do
        expect(User.new(first_name: "    ", last_name: "    ").full_name).to eq ""
      end

      example "when both names are nil returns empty string" do
        expect(User.new.full_name).to eq ""
      end

      example "when first_name is blank" do
        expect(User.new(last_name: "doe").full_name).to eq "Doe"
      end

      example "when last_name is blank" do
        expect(User.new(first_name: "john").full_name).to eq "John"
      end
    end
  end
end
