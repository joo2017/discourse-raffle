class CreateRaffles < ActiveRecord::Migration[6.0]
  def change
    # 以防万一，先删除任何可能存在的旧表
    drop_table :raffles, if_exists: true

    create_table :raffles do |t|
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
      t.string :on_insufficient_participants, null: false

      # 状态与结果
      t.string :status, null: false, default: 'running'
      t.jsonb :winner_data

      t.timestamps
    end

    add_index :raffles, :topic_id, unique: true
    add_index :raffles, :user_id
    add_index :raffles, :status
  end
end
