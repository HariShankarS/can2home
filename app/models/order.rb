class Order < ApplicationRecord
  include AASM

  aasm :column => 'state' do
  end
  include AASM
  validates :cans, :water_brand, :address, :presence => true

  aasm do
    state :created, :initial => true
    state :confirmed, :delivered ,:cancelled

    event :confirm do
      transitions :from => :created, :to => :confirmed
    end

    event :deliver do
      transitions :from => :confirmed, :to => :delivered
    end

    event :cancel do
      transitions :from => :created, :to => :cancelled
    end
  end	
end
