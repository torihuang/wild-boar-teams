class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.string  :image_path
      t.string  :grade
      t.integer :gpa
      t.integer :number_of_detentions
      t.string  :shirt_size
      t.string  :food_allergies

      t.timestamps(null: false)
    end
  end
end
