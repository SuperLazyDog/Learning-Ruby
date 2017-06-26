class CreateLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :logins do |t|
      t.string :user
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
