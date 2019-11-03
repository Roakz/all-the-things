# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

users = User.create! ([
    {email: 'test@testing.com', password: 'topsecret', password_confirmation: 'topsecret'},
    {email: 'test1@testing.com', password: 'topsecret', password_confirmation: 'topsecret'},
    {email: 'test2@testing.com', password: 'topsecret', password_confirmation: 'topsecret'},
    {email: 'test3@testing.com', password: 'topsecret', password_confirmation: 'topsecret'},
    {email: 'admin@admin.com', password: 'admins', password_confirmation: 'admins'}
])

User.where(email: "admin@admin.com")[0].add_role :admin

User.all.each do |user|
    user.user_profile.update(name: "Test User", content: "Test content Test content Test content Test content Test content")
end

User.all.each do |user|
    user.create_shop(name:"Test Shop", hook:"Buy My Stuff", content:"We are a really cool shop and we sell so much stuff thats it just so amazing WOW! no words!")
end

# Shop items

User.all.each do |user|
    user.shop.items.create(name: "Test item", quantity: "10", price: 3.20, hook: "Test item buy me", content: "Test content Test content Test content Test content Test content Test content Test contentTest contentTest contentTest contentTest contentTest content")
end

# Item categories

User.all.each do |user|
    user.shop.items.each do |item|
        item.categories.create(name:"Test category")
    end
end

