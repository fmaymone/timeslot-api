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

<pre>GET /v1/globalslots/search?category=football&amp;q=Borussia&amp;moment=2015-07-05&amp;limit=15</pre>

#### Query Parameters

<pre>category: football
q: Borussia
moment: 2015-07-05
limit: 15</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/search?category=football&amp;q=Borussia&amp;moment=2015-07-05&amp;limit=15&quot; -X GET \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aa4d54c04362a76f3bc13b7cf1c9a1d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c55a3c88-da59-4217-93e4-30a50e97ff6d
X-Runtime: 0.011348
Vary: Origin
Content-Length: 11457</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "c436c6f1-b344-1b73-d829-f65ffad0e878",
      "title" : "Borussia Mönchengladbach vs. Bayern München",
      "startDate" : "2015-12-05T15:30:00",
      "endDate" : "2015-12-05T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222540",
      "description" : "Bundesliga, 2015/2016, 15. Spieltag",
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
      "muid" : "b1852575-e8f7-b902-0e9b-1afbe8430572",
      "title" : "Borussia Mönchengladbach vs. SV Darmstadt 98",
      "startDate" : "2015-12-20T17:30:00",
      "endDate" : "2015-12-20T19:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222568",
      "description" : "Bundesliga, 2015/2016, 17. Spieltag",
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
      "muid" : "c473daa4-e888-34e2-bc74-655337b570de",
      "title" : "Borussia Mönchengladbach vs. SV Werder Bremen",
      "startDate" : "2016-02-05T20:30:00",
      "endDate" : "2016-02-05T22:30:00",
      "image" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222650",
      "description" : "Bundesliga, 2015/2016, 20. Spieltag",
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
      "muid" : "626dd653-54e5-b323-2f0d-20182bf593a7",
      "title" : "Borussia Mönchengladbach vs. Bayer 04 Leverkusen",
      "startDate" : "2016-05-07T15:30:00",
      "endDate" : "2016-05-07T17:30:00",
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
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      }
    },
    {
      "muid" : "67fa2323-b7b3-acfb-178a-6bf53818c225",
      "title" : "VfL Wolfsburg vs. Borussia Dortmund",
      "startDate" : "2015-12-05T18:30:00",
      "endDate" : "2015-12-05T20:30:00",
      "image" : "http://assets.dfb.de/public/uploads/53e73a0d83c7b26b45278146e157f6782256a709c04cd4fd91097a52ad74",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222544",
      "description" : "Bundesliga, 2015/2016, 15. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Volkswagen Arena",
        "locality" : "Wolfsburg",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 52.431468963623,
        "longitude" : 10.8033304214478
      }
    },
    {
      "muid" : "b0b4a686-b317-4ce6-1641-912f07833f61",
      "title" : "Manchester City vs. Borussia Mönchengladbach",
      "startDate" : "2015-12-08T20:45:00",
      "endDate" : "2015-12-08T22:45:00",
      "image" : "http://assets.dfb.de/public/uploads/4a7fe97a09619b871fd2890cb3dc74a649b37ca1106330d9f43851979dfb",
      "url" : "http://www.dfb.de/champions-league/saisonplan?spieledb_path=%2Fmatches%2F2230073",
      "description" : "Champions League, 2015/2016, Gruppe D",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Etihad Stadium",
        "locality" : "Manchester",
        "thoroughfare" : null,
        "country" : "England",
        "latitude" : 53.4828414916992,
        "longitude" : -2.20248007774353
      }
    },
    {
      "muid" : "4b74f2a6-fd25-dac6-9b9b-76facfd025ca",
      "title" : "Borussia Dortmund vs. PAOK Saloniki",
      "startDate" : "2015-12-10T19:00:00",
      "endDate" : "2015-12-10T21:00:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230223",
      "description" : "Europa League, 2015/2016, Gruppe C",
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
      "muid" : "0760befa-b678-ca9b-8608-0807bcca282a",
      "title" : "Borussia Dortmund vs. Eintracht Frankfurt",
      "startDate" : "2015-12-13T17:30:00",
      "endDate" : "2015-12-13T19:30:00",
      "image" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222570",
      "description" : "Bundesliga, 2015/2016, 16. Spieltag",
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
      "muid" : "54bedca0-af83-0747-845a-7159b7e4ff20",
      "title" : "Girondins Bordeaux vs. Rubin Kasan",
      "startDate" : "2015-12-10T19:00:00",
      "endDate" : "2015-12-10T21:00:00",
      "image" : "http://assets.dfb.de/public/uploads/47fcb6f7e80e225f305e3e3dc2fc1958478a565a15ad575a2ccfdaff3421",
      "url" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230221",
      "description" : "Europa League, 2015/2016, Gruppe B",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Grand Stade de Bordeaux",
        "locality" : "Bordeaux",
        "thoroughfare" : null,
        "country" : "Frankreich",
        "latitude" : 44.8969421386719,
        "longitude" : -0.563332974910736
      }
    },
    {
      "muid" : "014eaa07-ec3f-8b78-a8a8-05c4530695cc",
      "title" : "Bayer 04 Leverkusen vs. Borussia Mönchengladbach",
      "startDate" : "2015-12-12T18:30:00",
      "endDate" : "2015-12-12T20:30:00",
      "image" : "http://assets.dfb.de/public/uploads/136a93a522d57ff0eea59ea115da15877c6d1d31526e99817ee988d90e8d",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222575",
      "description" : "Bundesliga, 2015/2016, 16. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "BayArena",
        "locality" : "Leverkusen",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.0388412475586,
        "longitude" : 7.00342988967896
      }
    },
    {
      "muid" : "2f1b4a60-e2a3-4c5a-7a36-39fbc6ce1c5b",
      "title" : "1. FC Köln vs. Borussia Dortmund",
      "startDate" : "2015-12-19T15:30:00",
      "endDate" : "2015-12-19T17:30:00",
      "image" : "http://assets.dfb.de/public/uploads/3285f6f90681f5ff752689d04adf695711eedc354fd58695bc85a6ec48e3",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222578",
      "description" : "Bundesliga, 2015/2016, 17. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "RheinEnergieStadion",
        "locality" : "Köln",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 50.9341316223145,
        "longitude" : 6.87580490112305
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
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
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
        "name" : "Olympiastadion",
        "locality" : "Berlin",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 52.5149993896484,
        "longitude" : 13.2428102493286
      }
    },
    {
      "muid" : "9155334a-9448-8857-216c-6985def83186",
      "title" : "1. FSV Mainz 05 vs. Borussia Mönchengladbach",
      "startDate" : "2016-01-29T20:30:00",
      "endDate" : "2016-01-29T22:30:00",
      "image" : "http://assets.dfb.de/public/uploads/386af116b734c1e02fe3c24fb321cf3713cd3c612c199cb58835618681f5",
      "url" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222627",
      "description" : "Bundesliga, 2015/2016, 19. Spieltag",
      "sources" : [
        {
          "name" : "DFB",
          "url" : "http://dfb.de",
          "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
        }
      ],
      "location" : {
        "name" : "Coface Arena",
        "locality" : "Mainz",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 49.9848518371582,
        "longitude" : 8.223690032958981
      }
    }
  ]
}
```
