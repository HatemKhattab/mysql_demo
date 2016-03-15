# Ascript to scrape the orgnr of a company from allabolag.se

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def getCompanyOrgnr(company_name)
  page = Nokogiri::HTML(open('http://www.allabolag.se/?what='+company_name+'&where=&s.x=0&s.y=0'))

  # To get the number of search results
  result = page.css('div#printContent.hitlistBox div.hitlistTop table tr td.hitlistResultNr')
  message = result.text
  message.each_char{ |c| message.delete!(c) if c.ord<48 or c.ord>57 }
  numberOfResult = message.to_i
  puts 'Total results : ' + numberOfResult.to_s

  if numberOfResult > 0
    # To get The orgnr
    tables = page.css('div#printContent.hitlistBox div.hitlistRow table')
    table=tables[0].css('tr td.text11grey6')
    cell = table[0]
    items = cell.children
    # To get the orgnr
    item = items[2]
    puts 'OrgNr :' + item.text
  else
    puts 'No result please try again'
  end
end
getCompanyOrgnr("tokresurs")