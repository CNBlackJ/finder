class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    # Do something
    puts "Hard Worker it is test for Sidekiqkiq"
  end
end
