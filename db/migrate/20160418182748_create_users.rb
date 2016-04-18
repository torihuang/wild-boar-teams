class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password_digest
      t.string  :first_name
      t.string  :last_name
      t.string  :image_path

      t.timestamps(null: false)
    end
  end
end
