require 'net/http'
require 'open-uri'
require 'nokogiri'

class HTMLSchema
  module Microdata
    # This is temporary hack to create a YAML file from the schema.org site.
    class Feed
      def download
        links  = download_links
        result = links.map { |link| download_schema(link) }
        File.open(HTMLSchema::Microdata.schema_file, "w+") { |file| file.puts result.to_yaml }
      end
      
      def download_links
        table_of_contents = Nokogiri::HTML(open("http://schema.org/docs/full.html"))
        
        result = []
        table_of_contents.css("#mainContent a").each do |node|
          if node["href"] =~ /\.\.\/(\w+)/
            result << "http://schema.org/#{$1}"
          end
        end
        
        result
      end
      
      def download_schema(url)
        doc    = Nokogiri::HTML(open(url))
        
        parent = doc.css("#main .page-title a")[-2]
        parent = parent.text if parent
        
        type   = doc.css("#main .page-title a")[-1].text
        
        result = {:parent => parent, :type => type, :attributes => []}
        
        rows   = doc.css("#main .definition-table tbody.supertype")[-1]
        
        rows.css("tr").each do |row|
          name = row.css(".prop-nam code").text
          type = row.css(".prop-ect").text
          desc = row.css(".prop-desc").text
          
          result[:attributes] << {:name => name, :type => type, :description => desc}
        end if rows
        
        result
      end
    end
  end
end
