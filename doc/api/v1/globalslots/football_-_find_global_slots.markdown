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
ETag: W/&quot;3764503e3a54c3a372cc897efb8dd570&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b481029-ef8d-4969-bd71-c8ded0da4300
X-Runtime: 0.009387
Vary: Origin
Content-Length: 3824</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
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
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      }
    },
    {
      "muid" : "0f2bddbb-c75c-a994-1af9-5ce7ea36c397",
      "title" : "Borussia Dortmund vs. 1. FC Köln",
      "startDate" : "2016-05-14T15:30:00",
      "endDate" : "2016-05-14T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222900",
      "description" : "Bundesliga, 2015/2016, 34. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      }
    },
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
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
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
        "name" : "Olympiastadion",
        "locality" : "Berlin",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 52.5149993896484,
        "longitude" : 13.2428102493286
      }
    },
    {
      "muid" : "7ec32216-ffee-af00-cdc2-72fe84c1f176",
      "title" : "Eintracht Frankfurt vs. Borussia Dortmund",
      "startDate" : "2016-05-07T15:30:00",
      "endDate" : "2016-05-07T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/a23b2f3d4a08965ecb1d02991a10be9ef678314e438ebb9c0ec6e7bc6abf",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222880",
      "description" : "Bundesliga, 2015/2016, 33. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Commerzbank-Arena",
        "locality" : "Frankfurt am Main",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 50.0728416442871,
        "longitude" : 8.651920318603519
      }
    }
  ]
}
```
