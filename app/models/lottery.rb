# frozen_string_literal: true

class Lottery < ActiveRecord::Base
  # 修正关联关系
  # 我们明确告诉 Rails, user 的关联是通过 'created_by_id' 这个外键
  # 并且这个关联的名字叫做 'created_by'
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  
  # 我们保留这个，因为它依然很有用
  belongs_to :topic

  enum :status, {
    running: 'running',
    finished: 'finished',
    cancelled: 'cancelled'
  }
end
