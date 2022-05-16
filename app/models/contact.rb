class Contact < ApplicationRecord
  validates :relation, inclusion: { in: %w[professional personal] }, presence: true
  validates :name, presence: true
end
