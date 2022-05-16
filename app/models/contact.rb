class Contact < ApplicationRecord
  validates :relation, inclusion: { in: %w[professional personal] }
end
