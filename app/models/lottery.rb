# frozen_string_literal: true
class Lottery < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  enum :status, { running: 'running', finished: 'finished', cancelled: 'cancelled' }
end
