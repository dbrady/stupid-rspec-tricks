require 'rails_helper'

RSpec.describe User, type: :model do
  specify { expect(subject).to validate_presence_of :first_name }
  specify { expect(subject).to validate_presence_of :last_name }
  specify { expect(subject).to validate_presence_of :email }
  specify { expect(subject).to validate_presence_of :age }
  specify { expect(subject).to validate_numericality_of :age }
end
