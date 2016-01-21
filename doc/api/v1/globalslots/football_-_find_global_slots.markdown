# GlobalSlots API

## Football - Find global slots

### GET /v1/globalslots/search

Forwards a search request to the Elastic Search Service for global slots from the data team.

returns 422 if parameters invalid

### Parameters

Name : category *- required -*
Description : Basic slot category to search in. Valid categories: [cinema, football] 

Name : q *- required -*
Description : String to search global slots for

Name : moment
Description : find results after this datetime, default: Time.now

Name : limit
Description : maximum number of results, default: 20

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=football&amp;q=Dortmund&amp;moment=2015-07-05&amp;limit=5</pre>

#### Query Parameters

<pre>category: football
q: Dortmund
moment: 2015-07-05
limit: 5</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/search?category=football&amp;q=Dortmund&amp;moment=2015-07-05&amp;limit=5&quot; -X GET \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f8e22f109af36ba2d6a4e03a02efc813&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bc109bb3-c2ff-4135-a3ed-b5645befb24d
X-Runtime: 0.020841
Vary: Origin
Content-Length: 3854</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "238a69a4-271c-f5cb-e60e-48952d805859",
      "title" : "Borussia Mönchengladbach vs. Borussia Dortmund",
      "startDate" : "2016-01-23T18:30:00",
      "endDate" : "2016-01-23T20:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222606",
      "description" : "Bundesliga, 2015/2016, 18. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Borussia-Park, Mönchengladbach, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.171221,
        "longitude" : 6.385442
      }
    },
    {
      "muid" : "3ecc7d80-d953-cc62-2c6e-4f160cf9a9bc",
      "title" : "Borussia Dortmund vs. FC Ingolstadt",
      "startDate" : "2016-01-30T15:30:00",
      "endDate" : "2016-01-30T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222608",
      "description" : "Bundesliga, 2015/2016, 19. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Signal Iduna Park, Dortmund, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      }
    },
    {
      "muid" : "99048c80-0503-fa6c-2a0d-8484be4db8af",
      "title" : "Hertha BSC vs. Borussia Dortmund",
      "startDate" : "2016-02-06T15:30:00",
      "endDate" : "2016-02-06T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/896f2c263b9d3e4d852d551dab27dbe3137f6599b473d962348b90ad6edd",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222665",
      "description" : "Bundesliga, 2015/2016, 20. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Olympiastadion, Berlin, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.5149993896484,
        "longitude" : 13.2428102493286
      }
    },
    {
      "muid" : "c68031ff-e93c-fae0-6fa0-de3cc4e77a32",
      "title" : "Borussia Dortmund vs. Hannover 96",
      "startDate" : "2016-02-13T15:30:00",
      "endDate" : "2016-02-13T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222640",
      "description" : "Bundesliga, 2015/2016, 21. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Signal Iduna Park, Dortmund, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      }
    },
    {
      "muid" : "0b1083b4-6020-56f8-dc28-163ca0a0d683",
      "title" : "Borussia Dortmund vs. FC Porto",
      "startDate" : "2016-02-18T19:00:00",
      "endDate" : "2016-02-18T21:00:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2231918",
      "description" : "Europa League, 2015/2016, Sechzehntelfinale",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Signal Iduna Park, Dortmund, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      }
    }
  ]
}
```
