class CrawlerStandalone
  
  def self.without_block
    
    # create a new cobweb crawler with the settings required
    crawler = CobwebCrawler.new({:internal_urls => ["https://github.com/stewartmckee/cobweb/blob/master/*"]})
    
    # a blocking call that crawls the site
    statistics = crawler.crawl("https://github.com/stewartmckee/cobweb/blob/master/")
    print_statistics(statistics)
  end

  def self.with_block
    
    # create a new cobweb crawler with the settings required
    crawler = CobwebCrawler.new({:internal_urls => ["https://github.com/stewartmckee/cobweb/blob/master/*"]})
    
    # a blocking call that crawls the site
    statistics = crawler.crawl("https://github.com/stewartmckee/cobweb/blob/master/") do |content|
      puts "Processing #{content[:url]}..."
    end
    print_statistics(statistics)
    
  end
  
  private
  def self.print_statistics(statistics)
    puts ""
    puts "Crawl Statistcs"
    puts "==============="
    statistics.keys.each do |key|
      puts "#{key.to_s.ljust(25)}: #{statistics[key]}"
    end
    
    puts ""
    puts "Crawl Finished"
    puts "=============="
  end
end