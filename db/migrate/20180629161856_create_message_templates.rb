class CreateMessageTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :message_templates do |t|
      t.string :title
      t.text :body
      t.integer :journey_id, foreign_key: true

      t.timestamps
    end
  end
end
