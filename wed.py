# coding: utf-8
import lxml.html


f = open('allrabea2.html')

ff = f.read()

doc = lxml.html.document_fromstring(ff)

region = ''
city = ''
district = ''
scheme = ''
land = ''
deal = ''

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
    print region, city, district, scheme, land, deal

