class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :hypem,            :null => false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

  end
end