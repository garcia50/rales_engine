require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "validations" do
    it {should validate_presence_of(:name)}
  end

  context "relationsips" do
    it { should have_many(:invoices) }
    it { should have_many(:items) }
  end

end
