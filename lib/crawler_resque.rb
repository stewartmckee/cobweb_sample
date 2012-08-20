class CrawlerResque
  
  def self.start_demo
    process_job_file = File.expand_path(File.join([File.dirname("__FILE__"), "lib", "samples", "crawler_resque_job"]))
    finished_job_file = File.expand_path(File.join([File.dirname("__FILE__"), "lib", "samples", "crawler_finished_job"]))

    cobweb_hash = {
      :processing_queue => "CrawlerResqueJob",
      :crawl_finished_queue => "CrawlerFinishedJob",
      :internal_urls => ["https://github.com/stewartmckee/cobweb/blob/master/*"]
    }

    cobweb = Cobweb.new(cobweb_hash)
    cobweb.start("https://github.com/stewartmckee/cobweb/blob/master/")
    
    puts "If resque is running workers, you should see the processing start."
  end
  
end