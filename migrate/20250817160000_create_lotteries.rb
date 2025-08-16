class CreateLotteries < ActiveRecord::Migration[6.0]
  def change
    create_table :lotteries do |t|
      # 关联信息
      t.integer :topic_id, null: false
      t.integer :user_id, null: false # 发起抽奖的用户 ID

      # 核心抽奖规则
      t.string :draw_method, null: false # "random" 或 "specified_floor"
      t.integer :winner_count, default: 1
      t.text :specified_floors # 存储指定楼层，例如 "10,20,30"
      t.datetime :draw_time, null: false

      # 参与和开奖策略
      t.integer :min_participants, default: 0
      t.string :on_insufficient_participants, null: false # "proceed" 或 "cancel"

      # 状态与结果
      t.string :status, null: false, default: 'running' # running, finished, cancelled
      t.jsonb :winner_data # 存储中奖者信息 [{user_id: 123, username: 'sam', post_number: 10}, ...]

      t.timestamps
    end

    # 为常用查询字段添加索引，以提高性能
    add_index :lotteries, :topic_id, unique: true
    add_index :lotteries, :status
    add_index :lotteries, :draw_time
  end
end
