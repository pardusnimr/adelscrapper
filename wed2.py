# coding: utf-8
import lxml.html
import pymongo

client = pymongo.MongoClient("mongodb://nimr:d7hero@ds041871.mongolab.com:41871/adel")

db = client['adel']

f = open('allrabea2.html')

ff = f.read()

doc = lxml.html.document_fromstring(ff)

region = ''
city = ''
district = ''
scheme = ''
land = ''
deal = ''
deal_price = ''
land_area = ''
price_per_sqr_meter = ''

records = db.records

for row in doc.xpath("//tr"):
    chiled = row.getchildren()
    if chiled[0].attrib['style'] == 'padding-left: 5px':
        region = chiled[0].text
    elif chiled[0].attrib['style'] == 'padding-left: 17px':
        city = chiled[0].text
    elif chiled[0].attrib['style'] == 'padding-left: 29px':
        district = chiled[0].text
    elif chiled[0].attrib['style'] == 'padding-left: 41px':
        scheme = chiled[0].text
    elif chiled[0].attrib['style'] == 'padding-left: 53px':
        land = chiled[0].text
    elif chiled[0].attrib['style'] == 'padding-left: 65px':
        deal = chiled[0].text
        deal_price = chiled[1].text
        land_area = chiled[2].text
        price_per_sqr_meter = chiled[3].text

        
        record = {"region" : region,
                  "city" : city,
                  "distric" : district,
                  "scheme" : scheme,
                  "land" : land,
                  "deal" : deal,
                  "deal_price" : deal_price,
                  "land_area" : land_area,
                  "price_per_sqr_meter" : price_per_sqr_meter}

        records.insert(record)
        
