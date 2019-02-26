class Add < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.integer :comments_count, default: 0
    end
  end
end
