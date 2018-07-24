require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def searchAndShow()
	searchResults = search()
	showPage(searchResults)
end

def search()
	puts "\nWhat do you want to know about?"
	query = formatQuery(gets.chomp)
	if query != ""
		return askWikipedia(query)
	else
		puts red("Invalid query entered")
		search()
	end
end

def formatQuery(query)
	query.gsub!(" ", "_")
	query.gsub!(/[^ \w!@\$&*()+-=~']|[<>]/, "")
	return query
end

def askWikipedia(query)
	begin
		doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/"+ query))
	rescue OpenURI::HTTPError => e
		# When query fails...
		puts red(e.message)
	else
		# On query sucsess
		return determinePageContent(doc)
	end
end

def determinePageContent(page)
	wikiArray = {"title" => page.css("#firstHeading").text}
	if page.css("#mw-content-text p")[0].text.downcase.include?("refer to:")
		wikiArray["page"] = build_blankMayReferTo_page(page)
	else
		wikiArray["page"] = build_article_page(page)
	end
	return wikiArray
end

def build_blankMayReferTo_page(page)
	return [page.css("#mw-content-text ul, p")]
end

def build_article_page(page)
	allParagraphs = page.css("#mw-content-text p").to_a
	allParagraphs = filterEmpties(allParagraphs)
	return allParagraphs
end

def filterEmpties(paraArray)
	i = 0
	paraArray.delete_if { |p| p.text.match(/[a-z]/i) == nil}
	for para in paraArray
		paraArray[i].content = removeFootnotes(paraArray[i].text)
		i += 1
	end
	return paraArray
end

def removeFootnotes(text)
	text.gsub!(/\[\d+\]/, "")
	return text
end

def showPage(results)
	if results != nil
		puts "\n"*2 + yellow("#{results['title']}".center(75,"–"))
		puts listControl(1) if results["page"].length > 1
		puts "#{results["page"].length} paragraphs found"
		showParagraph(results)
	end
	searchAgain()
end

def listControl(num)
	if num == 0 
		return "Search again? " + blue("(enter ") + red("'yes' ") + blue("to continue or ") + red("'enter' ") + blue("to exit)")
	else
		return blue("--(enter ") + red("'xit' ") + blue("to exit the article or ") + red("'enter' ") + blue("to continue reading)")
	end	
end

def showParagraph(results)
	i = 0
	#clean out blanks
	for paragraph in results["page"] do
		i += 1
		puts "paragraph #{i}/#{results["page"].length}" + "\n"*2 + white("#{paragraph.text}")
		if paragraph != results["page"][(results["page"].length - 1)]
			response = gets.chomp
		end
		break if response == "xit"
	end
end

def searchAgain()
	puts "\n"*2 + listControl(0)
	response = gets.chomp
	if response.downcase == "yes"
		searchAndShow()
	end
end

def colorize(text, color_code)
	return "\e[#{color_code}m#{text}\e[0m"
end

def yellow(text)
	return colorize(text, "1;31")
end

def white(text)
	return colorize(text, "1;37")
end

def red(text)
	return colorize(text, "31")
end

def blue(text)
	return colorize(text, "34")
end

searchAndShow()
