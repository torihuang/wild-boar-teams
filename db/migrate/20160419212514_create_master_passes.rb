class CreateMasterPasses < ActiveRecord::Migration
  def change
    create_table :master_passes do |t|
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
