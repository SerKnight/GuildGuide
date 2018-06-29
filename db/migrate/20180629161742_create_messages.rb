class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id, foreign_key: true
      t.integer :receiver_id, foreign_key: true

      t.datetime :send_at
      t.boolean :sent

      t.string :from
      t.string :to
      t.string :type

      t.timestamps
    end
  end
end
