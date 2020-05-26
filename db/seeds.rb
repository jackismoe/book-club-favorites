User.destroy_all
Book.destroy_all

marc = User.create(username: "mrusso", email: "mrusso@test.com", password: "password")
sandi = User.create(username: "Sandi", email: "sandi@test.com", password: "password")
leadershift = marc.books.create(name: "Leadershift", author: "John Maxwell", genre: "self-development")
running_with_scissors = sandi.books.create(name: "Running with Scissors", author: "Augusten Burroughs", genre: "memoir")
you_are_a_badass = sandi.books.create(name: "You are a Badass", author: "Jon Sincero", genre: "self development")