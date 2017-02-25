crumb :root do
  link 'Home', root_path
end

crumb :contact do
  link 'Contact', home_contact_path
end

crumb :register do
  link 'Sign Up', new_user_registration_path
end

crumb :login do
  link 'Login', new_user_session_path
end

crumb :edit_profile do
  link 'Edit Profile', edit_user_registration_path
end

crumb :posts do
  link 'Blog', posts_path
end

crumb :category do |category|
  link category.name, posts_category_path(category)
  parent :posts
end

crumb :show do |post|
  link post.title, post_path(post)
  parent :category, post.category
end

crumb :new_post do |post|
  link 'New Blog Post', new_post_path
  parent :posts
end

crumb :edit_post do |post|
  link 'Edit Blog Post', edit_post_path(post)
  parent :posts
end

crumb :edit_comment do |comment|
  link 'Edit Comment', post_path(comment.post)
  parent :show, comment.post
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).