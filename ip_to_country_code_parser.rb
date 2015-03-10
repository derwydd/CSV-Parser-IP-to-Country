# IP to Country (#139) http://rubyquiz.com/quiz139.html
# Jason Brock
# https://github.com/derwydd
# # #

class CountryLookup

	def search(ipaddr)
		ip = ipaddr.split(/\./)
			# convert ip
		ip = ip[0].to_i * 16777216 + ip[1].to_i * 65536 + ip[2].to_i * 256 + ip[3].to_i
		file = 'IpToCountry.csv'
		
		IO.foreach(file) do |line|
					# pass over top commented areas without processing
			if (line =~ /^"/ )
					# appropriately split the line using Regexp 					
				splitLine = line.split(/^"(\d*)","(\d*)","(?:\w*)","(?:\d*)","(\w*)"/)
					# set variables to array values
				start, finish, code = splitLine[1].to_i, splitLine[2].to_i, splitLine[3].to_s
		  		if (start <= ip && finish >= ip)
  					puts 'Country Code: ' + code.to_s
		    		break
  				end
			end
		end
	end
	
end

# takes multiple ip arguments
ARGV.each{|arg| CountryLookup.new.search(arg)}