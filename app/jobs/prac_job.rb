class PracJob < ApplicationJob
  queue_as :default

  def perform(name, count)
    # Do something later
    puts "it is test for sidekiq!"
  end
end
