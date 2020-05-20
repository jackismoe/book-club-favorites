class User < ActiveRecord::Base
    validates_presence_of :username, :email
    validate_uniqueness_of :username, :email
    has_secure_password
    has_many :books
    has_many :favorite_lists
    has_many :books, through: :favorite_lists

    def id
        self.username.gsub("_", "-").downcase
    end

    def self.find_by_id(id)
        self.all.find{ |user| user.id == id }
    end
end
