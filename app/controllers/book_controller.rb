class BooksController < ApplicationController

    before do
        require_login
    end

    get '/books' do
        @books = Book.all
        @books = @books.sort_by{|b| b.name}
        erb :"books/index"
    end


end