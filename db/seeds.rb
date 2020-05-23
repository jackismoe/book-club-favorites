Book.destroy
marc = User.create(username: "mrusso", email: "mrusso@test.com", password: "password")
sandi = User.create(username: "Sandi", email: "sandi@test.com", password: "password")
leadershift = Book.create(name: "Leadershift", author: "John Maxwell", genre: "self-development")
running_with_scissors = Book.create(name: "Running with Scissors", author: "Augusten Burroughs", genre: "memoir")
you_are_a_badass = Book.create(name: "You are a Badass",author: "Jon Sincero", genre: "self development")