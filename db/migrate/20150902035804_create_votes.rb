class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :group, index: true, foreign_key: true
      t.references :vote, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
