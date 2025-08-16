# name: discourse-lottery
# about: A plugin to create and manage lotteries in Discourse.
# version: 0.1
# authors: [Your Name]
# url: [Your Github URL]

enabled_site_setting :lottery_enabled

after_initialize do
  # frozen_string_literal: true

  # 这是我们新增的关键部分
  # 它告诉 Discourse 在初始化之后, 去加载我们插件内部的模型文件。
  # File.expand_path 会获取当前文件的绝对路径, 从而准确定位到模型文件。
  load File.expand_path('../app/models/lottery.rb', __FILE__)

  # 我们未来还会在这里加载 Service, Controller 等其他文件
end
