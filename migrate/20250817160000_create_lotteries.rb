# 文件名: discourse-lottery/db/migrate/20250816200000_create_lotteries.rb

class CreateLotteries < ActiveRecord::Migration[6.0]
  def change
    # 在创建之前，先确保旧的同名表被彻底删除，以防万一
    drop_table :lotteries, if_exists: true

    create_table :lotteries do |t|
      # 关联信息
      t.integer :topic_id, null: false
      t.integer :user_id, null: false # 发起抽奖的用户 ID

      # 核心抽奖规则
      t.string :draw_method, null: false # "random" 或 "specified_floor"
      t.integer :winner_count, default: 1
      t.text :specified_floors

      # 触发与策略
      t.datetime :draw_time, null: false
      t.integer :min_participants, default: 0
      t.string :on_insufficient_participants, null: false # "proceed" 或 "cancel"

      # 状态与结果
      t.string :status, null: false, default: 'running'
      t.jsonb :winner_data

      t.timestamps
    end

    add_index :lotteries, :topic_id, unique: true
    add_index :lotteries, :user_id
    add_index :lotteries, :status
  end
end
