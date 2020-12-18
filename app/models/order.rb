class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  include AASM

  aasm(column: 'state', no_direct_assignment: true) do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :cancel do
      transitions from: [:pending, :paid, :delivered], to: :cancelled
    end
  end
end
