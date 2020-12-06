class User < ApplicationRecord
    validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
    validates :password, presence: true, confirmation: true
    validates :nickname, presence: true
    
    before_create :encrypt_password
    #只有在create的時候才有'before_create'這個階段

    has_many :posts
    has_many :comments
    has_many :favorite_posts
    has_many :my_favorites, through: :favorite_posts, source: 'post'

    
    def self.login(u)
    #密碼在註冊時有加密，所以在找user的時候，也要帶入加密過的密碼才找得到user
        pw = Digest::SHA1.hexdigest("a#{u[:password]}z")
        User.find_by(email: u[:email], password: pw)
    end

    def favorite?(post)
        my_favorites.include?(post)
    end

    private
    def encrypt_password
        self.password = Digest::SHA1.hexdigest("a#{self.password}z")
    end
end
