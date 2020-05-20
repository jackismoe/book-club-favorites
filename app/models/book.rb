class Book <ActiveRecord::Base
    validates_presence_of :name, :author
    belongs_to :user
    has_many :favorite_lists
    has_many :users, through: :favorite_lists
end
