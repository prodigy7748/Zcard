class Board < ApplicationRecord
    acts_as_paranoid
    include AASM
  
    validates :title, presence: true
    belongs_to :user, optional: true
    has_many :posts
  
    aasm(column: 'state', no_direct_assignment: true) do
      state :open, initial: true
      state :hidden, :locked
  
      event :hide do
        transitions from: :open, to: :hidden
  
        # 發簡訊
        after do
          puts "發簡訊!!"
        end
      end
  
      event :lock do
        transitions from: :open, to: :locked
      end
  
      event :open do
        transitions from: [:locked, :hidden], to: :open
      end
    end
  
  end
  