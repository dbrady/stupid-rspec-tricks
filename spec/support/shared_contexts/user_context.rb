RSpec.shared_context "user context" do
  let(:first_name) { "Bob" }
  let(:last_name) { "Dobson" }
  let(:age) { 27 }
  let(:email) { "#{first_name.downcase}.#{last_name.downcase}@example.com" }
  let(:valid_params) {
    {
      first_name: first_name,
      last_name: last_name,
      age: age,
      email: email
    }
  }
  let(:user) { User.new valid_params }
end
