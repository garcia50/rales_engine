require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "validations" do
    it {should validate_presence_of(:status)}
  end

  context "relationships" do

  end
end
