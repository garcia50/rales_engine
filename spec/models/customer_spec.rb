require 'rails_helper'

RSpec.describe Customer do
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "relationships" do

  end
end
