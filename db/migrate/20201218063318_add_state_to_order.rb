class AddStateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :state, :string
    add_index :orders, :state
  end
end
# rails g migration add_state_to_order state:string:index
