# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin in Devise
admin = User.create! :username => 'Admin', :email => 'admin@admin.com', :password => 'admin',
                     :password_confirmation => 'admin', :confirmed_at => DateTime.now
admin.add_role :admin
admin.add_role :staff
admin.add_role :member

# Create staff in Devise
staff = User.create! :username => 'Staff', :email => 'staff@staff.com', :password => 'staff',
                     :password_confirmation => 'staff', :confirmed_at => DateTime.now
staff.add_role :staff
staff.add_role :member

# Create member in Devise
member = User.create! :username => 'Member', :email => 'member@member.com', :password => 'member',
                     :password_confirmation => 'member', :confirmed_at => DateTime.now
member.add_role :member

# Add default categories
news = Category.create name: 'News'
announcements = Category.create name: 'Announcements'
movies = Category.create name: 'Movie Reviews'
theatre = Category.create name: 'Theatre Reviews'

post = Post.create! :category => news, :user => staff, :title => 'Lorem ipsum dolor sit amet', :published => DateTime.now, :approved => 1, :content => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris posuere quis erat ac varius. Suspendisse nec rutrum massa, sed blandit augue. Donec efficitur purus sit amet orci gravida, id vulputate lorem elementum. Integer sit amet nulla id metus iaculis mattis in a neque. Vivamus accumsan, nunc eget condimentum lacinia, quam nibh cursus erat, sit amet maximus diam orci et turpis. Nulla consequat interdum gravida. Nulla imperdiet, tortor at ullamcorper sagittis, tellus ante commodo nibh, ac placerat tellus tellus quis nulla. Suspendisse porttitor molestie malesuada. Quisque vestibulum vitae leo a finibus. Nunc laoreet felis quam. Cras a congue dolor, eu semper quam.'
staff.add_role :can_edit, post
post = Post.create! :category => news, :user => staff, :title => 'Morbi sed urna sit amet leo facilisis ultrices', :published => DateTime.now, :approved => 1, :content => 'Morbi sed urna sit amet leo facilisis ultrices. Donec varius, nulla sit amet gravida iaculis, felis dui gravida nunc, ac interdum nisl erat sed urna. Integer ac condimentum neque, vitae malesuada lacus. Aenean sit amet dui sit amet enim imperdiet mollis in quis felis. Quisque bibendum, risus ac lacinia bibendum, erat quam porttitor quam, id tincidunt nulla est ac odio. Etiam luctus nisi nec mollis fermentum. Vestibulum non justo nisl. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla magna lorem, tempus eget turpis eu, venenatis pulvinar lacus. Quisque maximus ipsum nisi, aliquam condimentum lacus rutrum sit amet. Donec ac placerat augue. Fusce eget dolor et lacus tempus lacinia.'
staff.add_role :can_edit, post
post = Post.create! :category => news, :user => staff, :title => 'Nam vulputate sollicitudin purus', :published => DateTime.now, :approved => 1, :content => 'Nam vulputate sollicitudin purus. Cras purus ligula, condimentum ut feugiat at, imperdiet id lorem. Maecenas mollis tincidunt ipsum. Praesent feugiat diam in mi tempor, a lacinia dui consectetur. Maecenas felis ex, cursus vitae efficitur eu, dignissim fringilla mauris. Donec ligula est, auctor at facilisis at, mollis gravida ipsum. Ut non ex pellentesque, auctor arcu quis, pharetra purus. Sed non leo leo. Cras iaculis euismod mi, eu fermentum magna accumsan nec. Phasellus dictum rutrum lacus. Proin euismod eu turpis non bibendum. Quisque bibendum risus et imperdiet vulputate. Praesent cursus nibh id volutpat ullamcorper.'
staff.add_role :can_edit, post

# comment = Comment.create! :user => member, :post => post, :content => 'this is a seed comment', :posted => DateTime.now
# member.add_role :can_edit, comment