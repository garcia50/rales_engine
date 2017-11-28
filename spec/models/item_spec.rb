require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  context "relationsips" do
  end
end
