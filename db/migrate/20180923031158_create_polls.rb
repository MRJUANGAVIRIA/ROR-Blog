class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title
      t.integer :vote_yes
      t.integer :votes_no

      t.timestamps
    end
  end
end
