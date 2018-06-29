class CreateSentiments < ActiveRecord::Migration[5.1]
  def change
    create_table :sentiments do |t|
      t.float :quantitative
      t.text :qualatative
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
      t.references :journey, foreign_key: true

      t.timestamps
    end
  end
end
