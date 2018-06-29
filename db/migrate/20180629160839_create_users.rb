class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :guild_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :opted_out

      t.timestamps
    end
  end
end
