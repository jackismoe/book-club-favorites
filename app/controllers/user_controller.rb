class UsersController < ApplicationController
    before do
        require_login
    end

    get '/:slug' do
        @user = User.find_by_slug(params[:slug])
        @books = Book.all.select { |b| b.user_id == @user.id}
        @books = @books.sort_by{ |b| b.name}
        erb :"users/show"
    end

    get '/:slug/favorites' do
        @user = User.find_by_slug(params[:slug])
        @books = @user.books
        if @books.empty?
            flash[:message] = "It looks like you haven't added any books yet!"
            redirect :"books/new"
        else
            @books = @books.sort_by{|book| book.name}
             erb :"users/favorites"
        end
    end

    get '/favorites/:id' do
        @user = User.find_by(id: params[:id])
        if params[:action] == "Add to my Favorites"
            @book = Book.find(params[:id])
            current_user.books << @book
        elsif params[:action] == "Remove from my Favorites"
            @favorite_list = FavoriteList.find_by(book_id: params[:id], user_id: current_user.id)
            @favorite_list.delete
            redirect "/"
        end
        redirect "/#{current_user.slug}/favorites"
    end

end
