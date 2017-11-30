class Transaction < ApplicationRecord
  validates :result, presence: :true

  belongs_to :invoice

  scope :successful,   -> { where result: 'success' }
  scope :unsuccessful, -> { where result: 'failed' }
end
