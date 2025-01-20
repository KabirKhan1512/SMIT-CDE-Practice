

# selecting element using class
# soup.select(a.class_name)

# selecting element using ID
# soup.select(a#ID_name)

#variable.attrs(['href']
 
from bs4 import BeautifulSoup
import requests

url = 'https://quotes.toscrape.com/'

response =  requests.get(url=url)

markup = response.text

soup = BeautifulSoup(markup, 'html.parser')

quotes_obj = soup.select('div.quote')

for obj in quotes_obj:
    quote = obj.select_one('span.text').text.strip()
    author = obj.select_one('span small.author').text.strip()
    print(f'{author}    {quote}')

single_tag = quotes_obj[0].select('div.tags a')[0].text