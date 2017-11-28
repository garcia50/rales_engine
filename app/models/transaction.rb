class Transaction < ApplicationRecord
    validates :result, presence: :true
end
