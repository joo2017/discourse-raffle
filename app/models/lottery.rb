# frozen_string_literal: true

class Lottery < ActiveRecord::Base
  # 定义与Discourse核心模型的关联关系
  belongs_to :topic
  belongs_to :user

  # CORRECTED SYNTAX: 将属性名 :status 和 值的哈希 {} 作为两个独立的参数传递
  # 这是更现代、更健壮的写法，可以兼容所有新版本的Rails。
  enum :status, {
    running: 'running',
    finished: 'finished',
    cancelled: 'cancelled'
  }
end
