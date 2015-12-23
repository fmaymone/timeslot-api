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
Authorization: Token token=9qte6tZXn50LJEIQ7uJoHETJSuc
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
	-H &quot;Authorization: Token token=9qte6tZXn50LJEIQ7uJoHETJSuc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c97fd8cbada6a3dbdf103f15ca02a950&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bfd6b22c-1fdc-4185-ac93-0600e9af8e70
X-Runtime: 0.165157
Vary: Origin
Content-Length: 1621</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 5,
  "title" : "Borussia Mönchengladbach vs. Borussia Dortmund",
  "startDate" : "2016-01-23T18:30:00.000Z",
  "createdAt" : "2015-12-23T11:18:29.960Z",
  "updatedAt" : "2015-12-23T11:18:29.960Z",
  "deletedAt" : null,
  "endDate" : "2016-01-23T20:30:00.000Z",
  "location" : {
    "name" : "Borussia-Park",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : "Mönchengladbach",
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : "Deutschland",
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.171221,
    "longitude" : 6.385442
  },
  "creator" : {
    "id" : 13,
    "username" : "dfb.de",
    "createdAt" : "2015-12-23T11:18:29.828Z",
    "updatedAt" : "2015-12-23T11:18:29.828Z",
    "deletedAt" : null,
    "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
  },
  "notes" : [
    {
      "id" : 1,
      "title" : "Description",
      "content" : "Bundesliga, 2015/2016, 18. Spieltag",
      "localId" : null,
      "createdAt" : "2015-12-23T11:18:29.928Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 19,
      "publicId" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:29.894Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 15,
    "username" : "User 66",
    "createdAt" : "2015-12-23T11:18:29.840Z",
    "updatedAt" : "2015-12-23T11:18:29.840Z",
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
  "visibility" : "public",
  "muid" : "238a69a4-271c-f5cb-e60e-48952d805859",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
