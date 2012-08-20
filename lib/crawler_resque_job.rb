class CrawlerResqueJob
  
  # resque queue name
  @queue = :crawler_resque_job

  def self.perform(content)

    # put any tasks to process the content here
    
    puts "Processing #{content["url"]}..."
    
  end
end
