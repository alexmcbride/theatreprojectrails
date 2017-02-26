class AddSuspendedToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :suspended, :boolean
    User.all.each do |user|
      user.suspended=false
      user.save
    end
  end

  def down
    remove_column :users
  end
end
