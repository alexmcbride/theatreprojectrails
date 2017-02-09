# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin in Devise
admin = User.create! :username => 'Admin', :email => 'admin@admin.com', :password => 'admin', :password_confirmation => 'admin'

# Confirm email
admin.confirmed_at = DateTime.now
admin.save

# Add role using Rolify
admin.add_role :admin
admin.add_role :staff

# Add default categories
Category.create name: 'News'
Category.create name: 'Announcements'
Category.create name: 'Movie Reviews'
Category.create name: 'Theatre Reviews'
