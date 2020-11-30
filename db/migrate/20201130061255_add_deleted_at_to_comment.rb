class AddDeletedAtToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :deleted_at, :datetime, defult: nil
    add_index :comments, :deleted_at
    #透過索引值快速找到該筆資料，加速搜尋。類似原文書最後面的索引頁面
    #binary tree
    #soft delete
  end
end
