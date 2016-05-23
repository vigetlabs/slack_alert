class CreateButtonPresses < ActiveRecord::Migration
  def change
    create_table :button_presses do |t|
      t.datetime :pushed_at,   null: false
      t.boolean :responded_to, null: false, default: false

      t.timestamps null: false
    end
  end
end
