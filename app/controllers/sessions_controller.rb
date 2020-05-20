class SessionsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"sessions/signup"
        else
            redirect "/books"
        end
    end
end
