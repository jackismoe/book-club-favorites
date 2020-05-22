class BooksController < ApplicationController

    before do
        require_login
    end

    get '/books' do
        @books = Book.all
        @books = @books.sort_by{|b| b.name}
        erb :"books/index"
    end

    get '/books/new' do
        erb :"books/new"
    end

    post '/books' do
        @book = Book.new(params)
        @book.user_id = current_user.id
        if @book.save
            current_user.books << @book
            redirect "/books/#{@book.id}" 
        else
            flash[:message] = "All fields are required. Please input name, author, and genre."
            redirect "/books/new"
        end
    end
    
    get '/books/:id' do
        @book = Book.find_by(id: params[:id])
        if @book 
            @user = User.find(@book.user_id)
           erb :"/books/show"
        else 
            redirect "/books"
        end
    end

    delete '/books/:id' do
        @book = Book.find(params[:id])
        if @book.user_id == current_user.id
            @book.delete
            redirect "/books"
        end
    end

    get '/books/:id/edit' do
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
        if @book.user_id == current_user.id
            erb :"books/edit"
        else
            redirect "/books/#{@book.id}"
        end
    end

    patch '/books/:id' do
        @book = Book.find(params[:id])
        if @book.user_id == current_user.id
            @book.name = params[:name]
            @book.author = params[:author]
            @book.genre = params[:genre]
            @book.save
        else
            flash[:message] = "All fields are required. Please input name, author, and genre."
            redirect "/books/#{@book.id}/edit"
        end
        redirect "books/show"
    end
end
