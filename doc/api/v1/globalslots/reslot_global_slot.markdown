# GlobalSlots API

## Reslot global slot

### POST /v1/globalslots/reslot

Send the **muid** of the Global Slot to reslot it.

 Backend retrieves slot data from data team.

at the moment returns 503 if global slot can not be found.

### Parameters

Name : predecessor *- required -*
Description : &#39;muid&#39; of the global slot

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=TdSOgLWaAkrir6skqROorZbeskQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/globalslots/reslot</pre>

#### Body
```javascript
{
  "predecessor" : "238a69a4-271c-f5cb-e60e-48952d805859"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/reslot&quot; -d &#39;{&quot;predecessor&quot;:&quot;238a69a4-271c-f5cb-e60e-48952d805859&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=TdSOgLWaAkrir6skqROorZbeskQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d0701c6ebb73f095d4ef7b0c72d7fed9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bd432820-a5ed-4093-8298-ea38a0c3bd23
X-Runtime: 0.148087
Vary: Origin
Content-Length: 1289</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 5,
  "title" : "Borussia Mönchengladbach vs. Borussia Dortmund",
  "startDate" : "2016-01-23T18:30:00.000Z",
  "createdAt" : "2015-12-14T01:30:32.083Z",
  "updatedAt" : "2015-12-14T01:30:32.083Z",
  "deletedAt" : null,
  "endDate" : "2016-01-23T20:30:00.000Z",
  "location" : null,
  "creator" : {
    "id" : 13,
    "username" : "dfb.de",
    "createdAt" : "2015-12-14T01:30:31.961Z",
    "updatedAt" : "2015-12-14T01:30:31.961Z",
    "deletedAt" : null,
    "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
  },
  "notes" : [
    {
      "id" : 1,
      "title" : "description",
      "content" : "Bundesliga, 2015/2016, 18. Spieltag",
      "localId" : null,
      "createdAt" : "2015-12-14T01:30:32.056Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 19,
      "publicId" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-14T01:30:32.025Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 15,
    "username" : "User 66",
    "createdAt" : "2015-12-14T01:30:31.972Z",
    "updatedAt" : "2015-12-14T01:30:31.972Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 1,
    "friendsCount" : 0
  },
  "parent" : {
    "id" : 4
  },
  "visibility" : null,
  "muid" : "238a69a4-271c-f5cb-e60e-48952d805859",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
