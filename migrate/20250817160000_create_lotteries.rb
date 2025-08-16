# 文件名: discourse-lottery/db/migrate/20250816200000_create_lotteries.rb

class CreateLotteries < ActiveRecord::Migration[6.0]
  def change
    # 魔法就在这里：这行代码是“驱魔令”。
    # 它告诉数据库：“在做任何事情之前，先找到并彻底摧毁任何名为 lotteries 的旧表。”
    drop_table :lotteries, if_exists: true

    # “驱魔”完成后，我们再用我们全新的、正确的设计来建造新家。
    create_table :lotteries do |t|
      t.integer :topic_id, null: false
      t.integer :user_id, null: false # 使用 user_id
      t.string :draw_method, null: false # 使用 draw_method
      t.integer :winner_count, default: 1
      t.text :specified_floors
      t.datetime :draw_time, null: false
      t.integer :min_participants, default: 0
      t.string :on_insufficient_participants, null: false
      t.string :status, null: false, default: 'running'
      t.jsonb :winner_data
      t.timestamps
    end

    add_index :lotteries, :topic_id, unique: true
    add_index :lotteries, :user_id
  end
end
