class Book < ApplicationRecord

	belongs_to :user
	has_many :book_comments
	has_many :favorites, dependent: :destroy
	validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 200 }

    def favorite_user(user_id ,book_id)
    	Favorite.find_by(user_id: user_id, book_id: book_id)
    end

    def self.search(search)
    	return Book.all unless search
    	Book.where(['title LIKE(?)', "%#{search}%"])
    end

end
