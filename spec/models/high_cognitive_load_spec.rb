require 'rails_helper'

RSpec.describe User, type: :model do
  include_context "user context"
  include_examples "user examples"
end
