class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :file
      t.integer :user_id
      t.boolean :success, default: false

      t.timestamps
    end
  end
end
