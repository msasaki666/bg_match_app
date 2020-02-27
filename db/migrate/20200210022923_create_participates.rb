class CreateParticipates < ActiveRecord::Migration[5.1]
  def change
    create_table :participates do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps

      t.index [:user_id, :post_id], unique: true
    end
  end
end
