class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :winner_faction
      t.string :loser_faction
      t.integer :duration
      t.datetime  :date

      t.timestamps null: false
    end

    add_reference :matches, :winner, references: :players
    add_reference :matches, :loser, references: :players
  end
end
