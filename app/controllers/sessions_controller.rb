class SessionsController < ApplicationController

    #Renders form for user sign up
    get '/signup' do
        if !logged_in?
            erb :"sessions/signup"
        else
            redirect "/books"
        end
    end

    #Submits form for user sign up. If successful takes user to welcome page. If not, displays error and back to sign up page. 
    post '/signup'do
        user = User.create(params)
        if user.save
            session[:user_id] = user.id
            redirect "/books"
        else
            user.errors.full_messages.each {|e| flash[:message] = e}
            redirect "/signup"
        end
    end

    #Renders user log in page. If user is not logged in, resirects user ot log in page.
    get '/login' do
        if !logged_in?
            erb :"sessions/login"
        else
            redirect "/books"
        end
    end

    #Submits log in form and takes user to welcome page. If  not successful, displays error massage.
    post '/login' do
        user = User.find_by(:username => params[:username])
	   
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/books"
        else
          flash[:message] = "Unable to log in, please try again or click \"Sign Up\" below if you need to create an account."
          redirect "/login"    
        end
    end

    #logs user out
    get '/logout' do
        session.destroy
        redirect '/'
    end
end
