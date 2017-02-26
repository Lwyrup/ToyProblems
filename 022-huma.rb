require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'




def removeFootnotes(text)
	text.gsub!(/\[\d+\]/, "")
	return text
end

def search()
	puts "Hello, what do you want to know about?"
	desiredKnowledge = gets.chomp
	return askWikipedia(formatQuery(desiredKnowledge))
end

def formatQuery(query) # Needs a more robust regex
	query.gsub!(" ", "_")
	return query
end

def askWikipedia(query)
	begin
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/"+ query))
	rescue OpenURI::HTTPError => e
		# When query fails...
		puts e.message
	else
		# On query sucsess
		return determinePageContent(doc)
	end
end

def determinePageContent(page)
	wikiName = page.css("#firstHeading").text
	wikiText = page.css("#mw-content-text > p")
	wikiArray = {"title" => wikiName}
	if wikiText[0].text.downcase.include?("refer to:")
		# build the referal page text
		wikiArray["page"] = build_blankMayReferTo_page(page)
	else
		# build article
		wikiArray["page"] = build_article_page(page)
	end
	return wikiArray
end

def build_blankMayReferTo_page(page)
	return [page.css("#mw-content-text ul")]
end

def build_article_page(page)
	allParagraphs = page.css("#mw-content-text > p").to_a
	return allParagraphs
end



def showPage(results)
	puts "\n\n-----------------------------------#{results['title']}-----------------------------------"
	for paragraph in results["page"] do
		
		puts "\n\n\n\n\n#{paragraph.text}"
	
		if paragraph != results["page"][(results["page"].length - 1)]
			puts "\n\n'xit' to exit"
			response = gets.chomp
		end
		break if response == "xit"
		
		
	end
	#for each thing in page
		#remove footnotes 
		#display thing
		#if user wants to read more
			#go to next thing in page
		#else 
			#break
		#end
	#end








end












# either a mayReferTo page or a article page
# regardless structure is {title => "dsafak", page => [stuff,stuff,...]}

searchResults = search()
showPage(searchResults)






# puts searchResults["title"]
# puts searchResults["page"][0].text
# binding.pry
exit
















begin
doc = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/' + desiredKnowledge,"User-Agent" => "Ruby/#{RUBY_VERSION}"))

rescue OpenURI::HTTPError => e
	
	puts e.message
else
	docName = doc.xpath('//h1')[0].text
	wikiText = doc.css("#mw-content-text > p")[0].text

	#If it's a may refer to page, puts the suggestions
	if wikiText.downcase.include?("#{desiredKnowledge}" && "refer to:")
		wikiText.concat(doc.css("#mw-content-text ul").text)
	#else if not takes all (text != "") and adds to and array
	else
		#puts the first p
		#prompts to keep reading?
			#if yes
				#show next p and repeat
			#else no
				#if there's anything else
					#if so goes back to origin
				#else
					#exit
				#end
			#end
	end

	binding.pry
	removeFootnotes(wikiText)
	puts "\n#{docName}\n\n#{wikiText}"
	gets.chomp
end























