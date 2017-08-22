class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :profile_picture

      t.timestamps
    end
  end
end
