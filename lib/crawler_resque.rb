class CrawlerResque
  
  # a sample method to get things kicked off, this can be any part of your apps code
  def self.start_demo
    
    # setup a hash with the variables for this crawl
    cobweb_hash = {
      :processing_queue => "CrawlerResqueJob",  # the name of the class being used for the processing queue
      :crawl_finished_queue => "CrawlerFinishedJob", # the name of the class to be sent statistics when the crawl completes
      :internal_urls => ["https://github.com/stewartmckee/cobweb/blob/master/*"], # an array of the urls regarded as internal (defaults to anything in the host and domain)
      :redis_options => {:host => "localhost", :port => "6379"} # these are the default values, as this option is not required, but is here if you wish to alter it to a remote redis box
    }

    cobweb = Cobweb.new(cobweb_hash) # creates a new cobweb object with the settings required
    cobweb.start("https://github.com/stewartmckee/cobweb/blob/master/") # starts a resque crawl starting at the passed in url
    
    puts "If resque is running workers, you should see the processing start."
  end
  
end