Nokogiri un est outil incontournable quand on veut scrapper en Ruby. Il permet de lire des pages HTML et en récupérer les informations que tu souhaites.

Pour utiliser Nokogiri, les lignes de code de base sont :

    Rajouter Nokogiri à ton Gemfile avec gem 'nokogiri et y faire appel dans ton app avec require 'nokogiri
    Faire de même avec Open-URI, indispensable pour ouvrir une URL, avec require 'open-uri'
    Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page avec page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))'
    Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array (par exemple all_emails_links) 
    	avec all_emails_links = page.xpath('/mettre_ici_le_XPath'). Dans ce cas all_emails_links est un array d'éléments HTML.
    Des exemples de XPath? Chrome peut te les donner facilement mais ça n'est pas toujours très ciblé. Le mieux c'est d'analyser le code source toi-même et d'écrire tes XPath.
     Exemples :
        Si tu veux récupérer tous les liens d'une page, 
        	tape page.xpath('//a'). 
        Pour tous les titres h1, 
        	utilise page.xpath('//h1')
        Si tu veux récupérer les liens situés sous un titre h1 (même s'ils sont inclus dans un paragraphe, lui-même imbriqué dans une div),
        	tape page.xpath('//h1//a').
        Si tu veux récupérer les liens situés DIRECTEMENT sous un titre h1 (sans élément intermédiaire), 
        	tape page.xpath('//h1/a').
        Si tu veux récupérer TOUS les éléments HTML situés DIRECTEMENT sous un titre h1, 
        	tape page.xpath('//h1/*').
        Si tu veux récupérer le lien ayant l'id email situé sous un titre h1 de classe primary, 
        	tape page.xpath('//h1[@class="primary"]/a[@id="email"]').
        Si tu veux récupérer le lien ayant l'id email situé sous un titre h1 de classe primary, 
        	tape page.xpath('//h1[@class="primary"]/a[@id="email"]').
        Si tu veux récupérer tous les liens dont le href contient le mot "mailto", 
        	tape page.xpath('//a[@href*="mailto"]').
    Ensuite, tu veux récupérer le texte de chaque lien ? Il faut parcourir l'array et extraire le .text de chaque élément HTML

    all_emails_links.each do |email_link|
          puts email_link.text #ou n'importe quelle autre opération de ton choix ;)
          end

    Tu peux aussi récupérer le texte du href d'un élément HTML avec email_link['href']
