Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database => set up ActiveRecord base in config/environment. All my models are inheriting from ActiveRecord::Base
- [x] Include more than one model class (e.g. User, Post, Category) => My application has a User, Book, and FavoriteList models. 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) => User has many books they created and has access to many books through saved books.  Books belong to a user, and Book has many users through FavoriteList.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) => A book belong to a user, while a favorite list belongs to a user and to a book.
- [x] Include user accounts with unique login attribute (username or email) => The User model validates presence and uniqueness, applied flash messages to raise custom errors if user already exists or is the sign up cannot be persisted to the database. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying => Book has CRUS applied throughout controller.
- [x] Ensure that users can't modify content created by other users => use of "if statements" in show, edit, and delete buttons only to the current_user the book belongs to/or created(added) the book. 
- [x] Include user input validations => all models validate the presence of content. The use of flash messages to raise error messages in case data isn't persisted.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) => last minute addition since I wasn't too familiar with Flag::Flash, but with the basics I learned and with the help of the internet I was able to use it to raise error messages. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code => I looked up what I had on my README file from previous project and basically transferred information over to this spec.md file.

Confirm
- [x] You have a large number of small Git commits => I commited as much as I could and could remember. 
- [x] Your commit messages are meaningful => tried being as specific as I could with my commit messages
- [x] You made the changes in a commit that relate to the commit message => Yes
- [x] You don't include changes in a commit that aren't related to the commit message => tried including all the changes I have made in the commit mesasge.