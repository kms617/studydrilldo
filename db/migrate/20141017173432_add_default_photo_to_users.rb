class AddDefaultPhotoToUsers < ActiveRecord::Migration
  def up
    change_column :users, :profile_photo, :string, default: "public/images/corgi.jpg"
  end

  def down
    change_column :users, :profile_photo, :string,
  end
end
