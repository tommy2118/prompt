class CreateCues < ActiveRecord::Migration[5.0]
  def change
    create_table :cues do |t|
      t.text :body
      t.string :category

      t.timestamps
    end
  end
end
