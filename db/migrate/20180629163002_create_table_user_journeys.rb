class CreateTableUserJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :user_journeys do |t|
      t.integer :user_id
      t.integer :journey_id
    end
  end
end
