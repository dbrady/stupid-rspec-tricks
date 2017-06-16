require 'rails_helper'

RSpec.describe User, type: :model do
  # This is still ok...
  let(:user) { described_class.new valid_params }

  # This is the Act step. It triggers the side effect of generating the errors
  # we need to test for later, but by putting it in the Arrange step we paint
  # ourselves quickly into several corners
  before do
    user.valid?
  end

  # Corner #1: valid_params now must be the union of all possible errors we
  # intend to test.  This makes it literally the definition of NOT valid params.
  #
  # - If we keep this architecture, we should rename this variable
  # - If we keep this architecture, we should push this down into the validation
  # context
  # - But there's another corner coming
  let(:valid_params) {
    { }
  }

  describe "#valid?" do
    context "when first_name is missing" do
      it "is not valid" do
        expect(user).not_to be_valid
      end

      it "has error on first_name" do
        expect(user.errors.keys).to include :first_name
      end
    end

    context "when last_name is missing" do
      it "is not valid" do
        expect(user).not_to be_valid
      end

      it "has error on last_name" do
        expect(user.errors.keys).to include :last_name
      end
    end

    context "when email is missing" do
      it "is not valid" do
        expect(user).not_to be_valid
      end

      it "has error on email" do
        expect(user.errors.keys).to include :email
      end
    end

    context "when age is missing" do
      it "is not valid" do
        expect(user).not_to be_valid
      end

      it "has error on age" do
        expect(user.errors.keys).to include :age
      end
    end

    # Corner #2: We cannot spec this here because we need a different
    # Arrangement, but Arrange has already been done
    #
    # - If we keep this architecure, this must be moved to a separate
    # context. Does it make sense to document and show a whole 'nother context
    # just for missing parameters versus non-numeric validations?
    #
    # Corner #3, Beginning: What if we want to add a third class of validations?
    #
    # - Do we just mash in a third context?

    # - Or maybe have one context for the pretty loops and one context for
    # "everything else"?
    #
    # - Is the pretty loop worth its prettiness if we have to make a nasty mess
    # to support it?
    #
    # - Can you feel the pressure to just not TEST that third class of validations?
    #
    # - Can you feel the pressure to just not WRITE that third class of
    # validation in the first place?
    #
    # - Does pretty code have to hurt this bad?
    #
    # - Is it worth it if it does?
    #
    # - These questions are not rhetorical. The answer might be yes. What other
    # factors might be at play?
    #
    # - Corner #3, Conclusion: We're all familiar with code that's hard to
    # test. But can you feel the pressure here where we literally have a test
    # that makes it hard to write more code?
    context "when age is non-numeric" do
      pending "This spec cannot do its necessary Arrange step because the before block has already done the Act step"
      it "is not valid"
      it "has error on age"
    end
  end
end
