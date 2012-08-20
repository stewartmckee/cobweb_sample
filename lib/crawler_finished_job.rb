class CrawlerFinishedJob
  
  @queue = :crawler_finished_job

  # perform method for resque to execute.  passes in statistics for the crawl
  def self.perform(statistics)
    
    # put in here any post crawl tasks

    puts ""
    puts "Crawl Statistcs"
    puts "==============="
    statistics.keys.each do |key|
      puts "#{key.ljust(25)}: #{statistics[key]}"
    end
    
    puts ""
    puts "Crawl Finished"
    puts "=============="
    
  end
end
