class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false
      t.string :hypem,            :null => false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

  end
end