class User < ActiveRecord::Base
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email
    has_secure_password
    has_many :books
    has_many :favorite_lists
    has_many :books, through: :favorite_lists

    def slug
        self.usernam
    end

    def self.find_by_slug(slug)
        self.all.find{ |user| user.slug == slug }
    end
end
