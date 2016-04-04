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

<pre>GET /v1/globalslots/search?category=football&amp;q=Borussia&amp;moment=2016-07-05&amp;limit=5</pre>

#### Query Parameters

<pre>category: football
q: Borussia
moment: 2016-07-05
limit: 5</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/search?category=football&amp;q=Borussia&amp;moment=2016-07-05&amp;limit=5&quot; -X GET </pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aaa1fc34104ce72e5f491a3e6b997186&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dfb12a86-42e3-4e2e-87db-11adb67b47e7
X-Runtime: 0.010366
Vary: Origin
Content-Length: 3895</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "820304fe-a416-db0d-807e-90cb9ebd9f1b",
      "title" : "Borussia Dortmund vs. FC Liverpool",
      "startDate" : "2016-04-07T19:05:00",
      "endDate" : "2016-04-07T21:05:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2233236",
      "description" : "Europa League, 2015/2016, Viertelfinale",
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
      "muid" : "9b5fd7df-292b-d8a2-d276-8649e61cbed9",
      "title" : "FC Ingolstadt vs. Borussia Mönchengladbach",
      "startDate" : "2016-04-09T13:30:00",
      "endDate" : "2016-04-09T15:30:00",
      "image" : "http://assets.dfb.de/public/uploads/6af548a045e8118351752e276109c4948cfa3fc38839e42e19bebd13f4e1",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222806",
      "description" : "Bundesliga, 2015/2016, 29. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Audi Sportpark, Ingolstadt, Deutschland",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.745491027832,
        "longitude" : 11.4837198257446
      }
    },
    {
      "muid" : "cbda1c93-8bbb-c25b-ec59-8d0b4168408a",
      "title" : "FC Liverpool vs. Borussia Dortmund",
      "startDate" : "2016-04-14T19:05:00",
      "endDate" : "2016-04-14T21:05:00",
      "image" : "http://assets.dfb.de/public/uploads/b41b2594911fb5ad26e7c83e2f4bacadec7a4b21825f08cb5acd6e2dad16",
      "url" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2233240",
      "description" : "Europa League, 2015/2016, Viertelfinale",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Anfield, Liverpool, England",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 53.4308013916016,
        "longitude" : -2.96110010147095
      }
    },
    {
      "muid" : "d0cff266-82f5-ca41-4325-326db9c31d8b",
      "title" : "Borussia Mönchengladbach vs. 1899 Hoffenheim",
      "startDate" : "2016-04-24T13:30:00",
      "endDate" : "2016-04-24T15:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222823",
      "description" : "Bundesliga, 2015/2016, 31. Spieltag",
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
        "latitude" : 51.1750297546387,
        "longitude" : 6.38369989395142
      }
    },
    {
      "muid" : "ba303492-8321-e87e-e81d-4318e628fe5f",
      "title" : "Borussia Mönchengladbach vs. Bayer 04 Leverkusen",
      "startDate" : "2016-05-07T13:30:00",
      "endDate" : "2016-05-07T15:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222860",
      "description" : "Bundesliga, 2015/2016, 33. Spieltag",
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
        "latitude" : 51.1750297546387,
        "longitude" : 6.38369989395142
      }
    }
  ]
}
```
