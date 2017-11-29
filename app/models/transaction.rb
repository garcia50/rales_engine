class Transaction < ApplicationRecord
    validates :result, presence: :true

    belongs_to :invoice
end
