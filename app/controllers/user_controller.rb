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

    get '/favorites/:id' do
        if params[:do_this] == "Add to my Favorites"
            @book = Book.find(params[:id])
            current_user.books << @book
        elsif params[:do_this] == "Remove from my Favorites"
            @favorite_list = FavoriteList.find_by(book_id: params[:id], user_id: current_user.id)
            @favorite_list.delete
        end
        redirect "/#{current_user.slug}/favorites"
    end

end
