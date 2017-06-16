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
    %i[
      first_name
      last_name
      age
      email
    ].each do |attribute|
      context "when #{attribute} is missing" do
        before do
          valid_params.delete attribute
        end

        it "is not valid" do
          expect(user).not_to be_valid
        end
      end
    end
  end
end
