# Data API

## Export all created Slots of the current user to a file (Timeslot)

### POST /v1/export/timeslot

returns 404 if the group uuid was not found

returns 422 if parameters are invalid or missing

returns 500 if an error occurs during the export

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=k4elOdTRStXVASv8Bd1TtIDqn3E
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=k4elOdTRStXVASv8Bd1TtIDqn3E&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;3dd4f7d50e041d824319c347be2d7881&quot;
X-Request-Id: bd23fcb3-fa61-47e1-9944-b4c135f6b829
X-Runtime: 0.037202
Content-Length: 6069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "uid" : "d6ae7b20-e379-4df7-bd9d-d9298d2f270d",
    "title" : "Slot title 68",
    "visibility" : "public",
    "start" : "2019-09-15T20:44:02.000Z",
    "end" : "2019-10-15T20:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy303",
        "media_type" : "audio",
        "position" : 29,
        "duration" : null,
        "title" : "Title 303"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy302",
        "media_type" : "video",
        "position" : 28,
        "duration" : null,
        "title" : "Title 302"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy301",
        "media_type" : "video",
        "position" : 27,
        "duration" : null,
        "title" : "Title 301"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy300",
        "media_type" : "image",
        "position" : 26,
        "duration" : null,
        "title" : "Title 300"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy299",
        "media_type" : "image",
        "position" : 25,
        "duration" : null,
        "title" : "Title 299"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy298",
        "media_type" : "image",
        "position" : 24,
        "duration" : null,
        "title" : "Title 298"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 151",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 150",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 149",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [],
    "groups" : [],
    "location" : null
  },
  {
    "uid" : "4f62f348-386b-4069-940d-e0d300d000d6",
    "title" : "Slot title 67",
    "visibility" : "public",
    "start" : "2019-09-14T19:44:02.000Z",
    "end" : "2019-10-14T19:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy297",
        "media_type" : "audio",
        "position" : 23,
        "duration" : null,
        "title" : "Title 297"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy296",
        "media_type" : "video",
        "position" : 22,
        "duration" : null,
        "title" : "Title 296"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy295",
        "media_type" : "video",
        "position" : 21,
        "duration" : null,
        "title" : "Title 295"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy294",
        "media_type" : "image",
        "position" : 20,
        "duration" : null,
        "title" : "Title 294"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy293",
        "media_type" : "image",
        "position" : 19,
        "duration" : null,
        "title" : "Title 293"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy292",
        "media_type" : "image",
        "position" : 18,
        "duration" : null,
        "title" : "Title 292"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 148",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 147",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 146",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [],
    "groups" : [
      {
        "uuid" : "8aef8d5c-900c-439d-b8da-7bbb05a3fc58",
        "name" : "Testgroup 93",
        "image" : "",
        "public" : false,
        "description" : null
      }
    ],
    "location" : null
  },
  {
    "uid" : "bca88270-c2a0-499c-bbcd-36c35f596c3a",
    "title" : "Slot title 66",
    "visibility" : "public",
    "start" : "2019-09-13T18:44:02.000Z",
    "end" : "2019-10-13T18:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy291",
        "media_type" : "audio",
        "position" : 17,
        "duration" : null,
        "title" : "Title 291"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy290",
        "media_type" : "video",
        "position" : 16,
        "duration" : null,
        "title" : "Title 290"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy289",
        "media_type" : "video",
        "position" : 15,
        "duration" : null,
        "title" : "Title 289"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy288",
        "media_type" : "image",
        "position" : 14,
        "duration" : null,
        "title" : "Title 288"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy287",
        "media_type" : "image",
        "position" : 13,
        "duration" : null,
        "title" : "Title 287"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy286",
        "media_type" : "image",
        "position" : 12,
        "duration" : null,
        "title" : "Title 286"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 145",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 144",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 143",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [],
    "groups" : [
      {
        "uuid" : "1dc78d7f-4a26-4cf6-bd02-e661be860b9a",
        "name" : "Testgroup 92",
        "image" : "",
        "public" : false,
        "description" : null
      }
    ],
    "location" : null
  },
  {
    "uid" : "f6caade2-93d3-4fa6-9058-02db64664593",
    "title" : "Slot title 65",
    "visibility" : "public",
    "start" : "2019-09-12T17:44:02.000Z",
    "end" : "2019-10-12T17:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy285",
        "media_type" : "audio",
        "position" : 11,
        "duration" : null,
        "title" : "Title 285"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy284",
        "media_type" : "video",
        "position" : 10,
        "duration" : null,
        "title" : "Title 284"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy283",
        "media_type" : "video",
        "position" : 9,
        "duration" : null,
        "title" : "Title 283"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy282",
        "media_type" : "image",
        "position" : 8,
        "duration" : null,
        "title" : "Title 282"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy281",
        "media_type" : "image",
        "position" : 7,
        "duration" : null,
        "title" : "Title 281"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy280",
        "media_type" : "image",
        "position" : 6,
        "duration" : null,
        "title" : "Title 280"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 142",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 141",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 140",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [
      {
        "alerts" : "1010101010"
      }
    ],
    "groups" : [
      {
        "uuid" : "c6da0270-2a13-4821-a97b-5dbcdfa9e1d0",
        "name" : "Testgroup 91",
        "image" : "",
        "public" : false,
        "description" : null
      }
    ],
    "location" : null
  },
  {
    "uid" : "b336f454-de46-4dd4-9ac2-03e6683c7fe7",
    "title" : "Slot title 64",
    "visibility" : "public",
    "start" : "2019-09-11T16:44:02.000Z",
    "end" : "2019-10-11T16:44:02.000Z",
    "media" : [
      {
        "public_id" : "dfhjghjkdisudgfds7iy279",
        "media_type" : "audio",
        "position" : 5,
        "duration" : null,
        "title" : "Title 279"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy278",
        "media_type" : "video",
        "position" : 4,
        "duration" : null,
        "title" : "Title 278"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy277",
        "media_type" : "video",
        "position" : 3,
        "duration" : null,
        "title" : "Title 277"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy276",
        "media_type" : "image",
        "position" : 2,
        "duration" : null,
        "title" : "Title 276"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy275",
        "media_type" : "image",
        "position" : 1,
        "duration" : null,
        "title" : "Title 275"
      },
      {
        "public_id" : "dfhjghjkdisudgfds7iy274",
        "media_type" : "image",
        "position" : 0,
        "duration" : null,
        "title" : "Title 274"
      }
    ],
    "notes" : [
      {
        "title" : "Title for Note 139",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 138",
        "content" : "Liebe ist ein Kind der Freiheit!"
      },
      {
        "title" : "Title for Note 137",
        "content" : "Liebe ist ein Kind der Freiheit!"
      }
    ],
    "settings" : [
      {
        "alerts" : "1010101010"
      }
    ],
    "groups" : [],
    "location" : {
      "name" : "Acapulco",
      "country" : "",
      "postalcode" : "",
      "city" : "",
      "address" : "",
      "latitude" : 51.234,
      "longitude" : -11.993
    }
  }
]
```
