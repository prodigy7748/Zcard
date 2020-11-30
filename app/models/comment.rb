class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  def owned_by?(user)
    self.user == user
  end

  default_scope { where(deleted_at: nil).order(id: :desc) }
  #對model做的所有查詢都會加上這個scope的條件，以這個例子來說，所有查詢都會找deleted_at欄位是nil的資料，除非在搜尋時加上unscope把它拔掉。
  #Comment.unscope(:where).where().order[]
  # scope :cheap, -> { unscope(:where).where("price < 100")}  

  def destroy
    comment.update(deleted_at: Time.now)
  end
end

# model
# scope(:cheap, -> { where("price < 50") })
# scope :forb, -> { where("age >= 18") }
# scope :x, -> { cheap.forb }

# controller
# Product.forb.cheap
# Product.x