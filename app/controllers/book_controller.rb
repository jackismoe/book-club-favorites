class UsersController < ApplicationController

    before do
        require_login
    end
end