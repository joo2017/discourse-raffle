# frozen_string_literal: true

class Lottery < ActiveRecord::Base
  # 定义与Discourse核心模型的关联关系
  belongs_to :topic
  belongs_to :user

  # 使用枚举(enum)来更优雅地管理状态字段
  # 这会给我们带来一些好用的方法，例如 lottery.running?, lottery.finished! 等
  enum status: {
    running: 'running',
    finished: 'finished',
    cancelled: 'cancelled'
  }
end
