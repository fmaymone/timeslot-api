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

<pre>Accept: application/json
Host: example.org
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
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1dd88db73761e4859c00c02b648499b1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: eeb5c748-adb5-40ec-adec-947e6650a020
X-Runtime: 0.019738
Vary: Origin
Content-Length: 15624</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "results" : [
    {
      "title" : "Borussia Mönchengladbach vs. Bayern München",
      "startDate" : "2015-12-05T15:30:00",
      "endDate" : "2015-12-05T17:30:00",
      "location" : {
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8007949
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 15. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222540"
        },
        {
          "title" : "cuid",
          "content" : "92779606-d54c-4165-b230-12c1b47d7899"
        },
        {
          "title" : "duid",
          "content" : "c436c6f1-b344-1b73-d829-f65ffad0e878"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Mönchengladbach vs. SV Darmstadt 98",
      "startDate" : "2015-12-20T17:30:00",
      "endDate" : "2015-12-20T19:30:00",
      "location" : {
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8067009
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 17. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222568"
        },
        {
          "title" : "cuid",
          "content" : "f70e83a5-8c5e-4baf-8f9b-46841ba90d60"
        },
        {
          "title" : "duid",
          "content" : "b1852575-e8f7-b902-0e9b-1afbe8430572"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Mönchengladbach vs. Borussia Dortmund",
      "startDate" : "2016-01-23T18:30:00",
      "endDate" : "2016-01-23T20:30:00",
      "location" : {
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8066989
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 18. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222606"
        },
        {
          "title" : "cuid",
          "content" : "0f63dc6c-5f80-4954-b69f-61dc6c5a8a06"
        },
        {
          "title" : "duid",
          "content" : "238a69a4-271c-f5cb-e60e-48952d805859"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Mönchengladbach vs. SV Werder Bremen",
      "startDate" : "2016-02-05T20:30:00",
      "endDate" : "2016-02-05T22:30:00",
      "location" : {
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8066979
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 20. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222650"
        },
        {
          "title" : "cuid",
          "content" : "03369fe3-20b6-4d7e-a576-b2e1fbd4b9e1"
        },
        {
          "title" : "duid",
          "content" : "c473daa4-e888-34e2-bc74-655337b570de"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Mönchengladbach vs. Bayer 04 Leverkusen",
      "startDate" : "2016-05-07T15:30:00",
      "endDate" : "2016-05-07T17:30:00",
      "location" : {
        "name" : "Borussia-Park",
        "locality" : "Mönchengladbach",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.171221,
        "longitude" : 6.385442
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8007780
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 33. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222860"
        },
        {
          "title" : "cuid",
          "content" : "9611c25d-ecc7-45a9-9443-5082e7a8f062"
        },
        {
          "title" : "duid",
          "content" : "626dd653-54e5-b323-2f0d-20182bf593a7"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "FK Krasnodar vs. Borussia Dortmund",
      "startDate" : "2015-11-26T17:00:00",
      "endDate" : "2015-11-26T19:00:00",
      "location" : {
        "name" : "Kuban",
        "locality" : "Krasnodar",
        "thoroughfare" : null,
        "country" : "Russland",
        "latitude" : 45.3215599060059,
        "longitude" : 37.3987998962402
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8008215
        },
        {
          "title" : "description",
          "content" : "Europa League, 2015/2016, Gruppe C"
        },
        {
          "title" : "tags",
          "content" : "europa league,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230200"
        },
        {
          "title" : "cuid",
          "content" : "72a6e0cf-62c5-4d86-9531-93cb9999a36b"
        },
        {
          "title" : "duid",
          "content" : "70506edf-95d8-0f22-fda7-f836ec59f006"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "1899 Hoffenheim vs. Borussia Mönchengladbach",
      "startDate" : "2015-11-28T15:30:00",
      "endDate" : "2015-11-28T17:30:00",
      "location" : {
        "name" : "Wirsol Rhein-Neckar-Arena",
        "locality" : "Sinsheim",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 49.2389984130859,
        "longitude" : 8.886819839477541
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8007957
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 14. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222556"
        },
        {
          "title" : "cuid",
          "content" : "151ad1a3-fd48-4871-a2cc-315f38862140"
        },
        {
          "title" : "duid",
          "content" : "1dde8bd5-1ba0-29cb-efd7-5654a1be0feb"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Manchester City vs. Borussia Mönchengladbach",
      "startDate" : "2015-12-08T20:45:00",
      "endDate" : "2015-12-08T22:45:00",
      "location" : {
        "name" : "Etihad Stadium",
        "locality" : "Manchester",
        "thoroughfare" : null,
        "country" : "England",
        "latitude" : 53.4828414916992,
        "longitude" : -2.20248007774353
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8008293
        },
        {
          "title" : "description",
          "content" : "Champions League, 2015/2016, Gruppe D"
        },
        {
          "title" : "tags",
          "content" : "champions league,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/champions-league/saisonplan?spieledb_path=%2Fmatches%2F2230073"
        },
        {
          "title" : "cuid",
          "content" : "6bb46d11-556f-47c6-b50a-b55f918c9167"
        },
        {
          "title" : "duid",
          "content" : "b0b4a686-b317-4ce6-1641-912f07833f61"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Dortmund vs. PAOK Saloniki",
      "startDate" : "2015-12-10T19:00:00",
      "endDate" : "2015-12-10T21:00:00",
      "location" : {
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8008212
        },
        {
          "title" : "description",
          "content" : "Europa League, 2015/2016, Gruppe C"
        },
        {
          "title" : "tags",
          "content" : "europa league,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230223"
        },
        {
          "title" : "cuid",
          "content" : "610912da-6b41-41f8-a101-39c1c4a06c6c"
        },
        {
          "title" : "duid",
          "content" : "4b74f2a6-fd25-dac6-9b9b-76facfd025ca"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Dortmund vs. Eintracht Frankfurt",
      "startDate" : "2015-12-13T17:30:00",
      "endDate" : "2015-12-13T19:30:00",
      "location" : {
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8067002
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 16. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222570"
        },
        {
          "title" : "cuid",
          "content" : "b15282d9-5c21-4385-a605-9827496435d8"
        },
        {
          "title" : "duid",
          "content" : "0760befa-b678-ca9b-8608-0807bcca282a"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Borussia Dortmund vs. VfB Stuttgart",
      "startDate" : "2015-11-29T15:30:00",
      "endDate" : "2015-11-29T17:30:00",
      "location" : {
        "name" : "Signal Iduna Park",
        "locality" : "Dortmund",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.4940605163574,
        "longitude" : 7.45179986953735
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8007955
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 14. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222541"
        },
        {
          "title" : "cuid",
          "content" : "f4d64924-fb2c-477d-86d2-6bd295f641af"
        },
        {
          "title" : "duid",
          "content" : "f2791370-de91-456c-0409-dee934fde811"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Girondins Bordeaux vs. Rubin Kasan",
      "startDate" : "2015-12-10T19:00:00",
      "endDate" : "2015-12-10T21:00:00",
      "location" : {
        "name" : "Grand Stade de Bordeaux",
        "locality" : "Bordeaux",
        "thoroughfare" : null,
        "country" : "Frankreich",
        "latitude" : 44.8969421386719,
        "longitude" : -0.563332974910736
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8008227
        },
        {
          "title" : "description",
          "content" : "Europa League, 2015/2016, Gruppe B"
        },
        {
          "title" : "tags",
          "content" : "europa league,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/europa-league/saisonplan?spieledb_path=%2Fmatches%2F2230221"
        },
        {
          "title" : "cuid",
          "content" : "f9453da6-3dad-41f3-bb05-b4e2781d9363"
        },
        {
          "title" : "duid",
          "content" : "54bedca0-af83-0747-845a-7159b7e4ff20"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "VfL Wolfsburg vs. Borussia Dortmund",
      "startDate" : "2015-12-05T18:30:00",
      "endDate" : "2015-12-05T20:30:00",
      "location" : {
        "name" : "Volkswagen Arena",
        "locality" : "Wolfsburg",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 52.431468963623,
        "longitude" : 10.8033304214478
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8007946
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 15. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222544"
        },
        {
          "title" : "cuid",
          "content" : "d01f87d7-4256-40fa-a004-ad5fa0fa64ca"
        },
        {
          "title" : "duid",
          "content" : "67fa2323-b7b3-acfb-178a-6bf53818c225"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "Bayer 04 Leverkusen vs. Borussia Mönchengladbach",
      "startDate" : "2015-12-12T18:30:00",
      "endDate" : "2015-12-12T20:30:00",
      "location" : {
        "name" : "BayArena",
        "locality" : "Leverkusen",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 51.0388412475586,
        "longitude" : 7.00342988967896
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8067004
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 16. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222575"
        },
        {
          "title" : "cuid",
          "content" : "b412962e-257f-4b96-9c94-32c475f42f7d"
        },
        {
          "title" : "duid",
          "content" : "014eaa07-ec3f-8b78-a8a8-05c4530695cc"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    },
    {
      "title" : "1. FC Köln vs. Borussia Dortmund",
      "startDate" : "2015-12-19T15:30:00",
      "endDate" : "2015-12-19T17:30:00",
      "location" : {
        "name" : "RheinEnergieStadion",
        "locality" : "Köln",
        "thoroughfare" : null,
        "country" : "Deutschland",
        "latitude" : 50.9341316223145,
        "longitude" : 6.87580490112305
      },
      "creator" : {
        "id" : 13,
        "username" : "dfb.de",
        "createdAt" : "2015-11-30T00:23:30.431Z",
        "updatedAt" : "2015-11-30T00:23:30.431Z",
        "deletedAt" : null,
        "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
      },
      "notes" : [
        {
          "title" : "crawler ID",
          "content" : 8066999
        },
        {
          "title" : "description",
          "content" : "Bundesliga, 2015/2016, 17. Spieltag"
        },
        {
          "title" : "tags",
          "content" : "bundesliga,soccer,football,fussball,fußball"
        },
        {
          "title" : "url",
          "content" : "http://www.dfb.de/bundesliga/saisonplan?spieledb_path=%2Fmatches%2F2222578"
        },
        {
          "title" : "cuid",
          "content" : "515c3098-220d-457e-8cdc-4c465fa78ec9"
        },
        {
          "title" : "duid",
          "content" : "2f1b4a60-e2a3-4c5a-7a36-39fbc6ce1c5b"
        }
      ],
      "media" : {
        "publicId" : null,
        "mediaType" : "image"
      }
    }
  ]
}
```
