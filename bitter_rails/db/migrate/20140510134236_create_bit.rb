class CreateBit < ActiveRecord::Migration
  def change
    create_table :bits do |t|
      t.string :message
      t.integer :author_id
    end
  end
end
