class CreateRatings < ActiveRecord::Migration
    def change
        create_table :ratings do |t|
            t.integer :score
            t.integer :game_id

            t.timestamps
        end
    end
end