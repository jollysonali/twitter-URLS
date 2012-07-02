# encoding: UTF-8

# list of files
# Dir - will get you lists of files
# Dir.glob(string) -> array[strings]
# Dir[] (they're the same)
# open all the files- parse them as JSON and turn into hash
# File - open each file
# File.read(string) -> string
# json library (require 'json')
# JSON class - parse jason, return a hash
# JSON.parse(string) -> hash
# itterate over each hash and pull the information

require 'json'

files = Dir.glob("tweets/users/jollysonali/*.json")

files.each do |tweet|
  content = File.read(tweet)
  tweet_text = JSON.parse(content)['text']
  
  if /http:\/\//.match(tweet_text)
    urls = tweet_text.scan(/http:\/\/\S*/) # This results in an array
    
    urls.each do |url|
      tailend = /["'.(){}]$/ # Take out extraneous chars at the end of the url
      if tailend.match(url)
        url = url.partition(tailend)[0]
      end
      
      puts url
    end
  end
end