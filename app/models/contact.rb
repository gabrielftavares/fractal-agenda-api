class Contact < ApplicationRecord
  belongs_to :user

  validates :relation, inclusion: { in: %w[professional personal] }, presence: true
  validates :name, :user, presence: true
end
