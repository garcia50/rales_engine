require 'rails_helper'

RSpec.describe Transaction do
  context "validations" do
    it { should validate_presence_of(:result) }
  end

  context "relationsips" do
  end
end
