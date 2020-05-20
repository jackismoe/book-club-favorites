class BooksController < ApplicationController

    before do
        require_login
    end
end