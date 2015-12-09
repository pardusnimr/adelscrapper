
# coding: utf-8

# In[4]:

import lxml.html, cssselect

import pymongo


# In[3]:

f = open('allrabea2.html')


# In[5]:

ff = f.read()


# In[7]:

doc = lxml.html.document_fromstring(ff)


# In[8]:

for col in doc.xpath("//td[@style='padding-left: 65px']"):
    print col.text
    for sib in col.itersiblings():
        print sib.text


# mongodb connection


client = pymongo.MongoClient("mongodb://nimr:d7hero@ds041871.mongolab.com:41871/adel")


for row in doc.xpath("//tr"):
    child = row.getchildren()
    if child[0].attrib['style'] == 'padding-left: 5px':
        print child[0].text



for row in rows:
    x = row.xpath(".//td")
    if x[0].attrib['style'] == 'padding-left: 5px':
        print x[0].text
