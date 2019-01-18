#récupérer la liste complète des députés de France, ainsi que leurs adresses email. Cherche par toi-même le site le plus aisé à scrapper et stocke les informations extraites dans une array de hashs

require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def which_is_the_max(a , b)
	if a.length > b.length
		@sup = a.length
		@inf = b.length
	elsif a.length < b.length
		@inf = a.length
		@sup = b.length
	else
		return "#{a} = #{b}"
	end
end

def fusion(ar1 , ar2)
	which_is_the_max(ar1 , ar2)
	if @sup % @inf != 0
		puts "Ces tableaux ne sont pas assemblables!"
	else
		result = []
		n = ar1.length
		i = 0
		while i < ar2.length 
			newar2 = []
			for j in i..(i+n-1)
				newar2 << ar2[j]
			end
			result << Hash[ar1.zip(newar2)]
			i += n
		end
		result.inspect
	end
end

puts fusion(A , B)