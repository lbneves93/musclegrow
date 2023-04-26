p 'Creating users...'

users = [
  { email: 'admin@email.com', password: 'admin123', role: :admin },
  { email: 'athlete@email.com', password: 'athlete123', role: :athlete }
]

users.each { |user| User.create(user) }