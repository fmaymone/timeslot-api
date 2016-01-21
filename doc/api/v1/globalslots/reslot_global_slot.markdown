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
Authorization: Token token=lXtyMc8eGCuBf_aVCdPDwfvCD_4
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
	-H &quot;Authorization: Token token=lXtyMc8eGCuBf_aVCdPDwfvCD_4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e53da2ae1d9262592061723eda0aa574&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 681f1f2b-1a01-47b4-a7fb-214643fdcb07
X-Runtime: 0.174039
Vary: Origin
Content-Length: 1637</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 5,
  "title" : "Borussia Mönchengladbach vs. Borussia Dortmund",
  "startDate" : "2016-01-23T18:30:00.000Z",
  "createdAt" : "2016-01-21T23:11:35.991Z",
  "updatedAt" : "2016-01-21T23:11:35.991Z",
  "deletedAt" : null,
  "endDate" : "2016-01-23T20:30:00.000Z",
  "location" : {
    "name" : "Borussia-Park",
    "thoroughfare" : "Am Borussiapark",
    "subThoroughfare" : null,
    "locality" : "Mönchengladbach",
    "subLocality" : null,
    "administrativeArea" : "NW",
    "subAdministrativeArea" : null,
    "postalCode" : "41179",
    "country" : null,
    "isoCountryCode" : "Deutschland",
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.171221,
    "longitude" : 6.385442
  },
  "creator" : {
    "id" : 13,
    "username" : "dfb.de",
    "createdAt" : "2016-01-21T23:11:35.854Z",
    "updatedAt" : "2016-01-21T23:11:35.854Z",
    "deletedAt" : null,
    "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
  },
  "notes" : [
    {
      "id" : 1,
      "title" : "Description",
      "content" : "Bundesliga, 2015/2016, 18. Spieltag",
      "localId" : null,
      "createdAt" : "2016-01-21T23:11:35.951Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 19,
      "publicId" : "http://assets.dfb.de/public/uploads/960fc3c7c442e24cc34b237dfb62780c3393af69685dd506e97184247fe4",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:35.917Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 15,
    "username" : "User 78",
    "createdAt" : "2016-01-21T23:11:35.865Z",
    "updatedAt" : "2016-01-21T23:11:35.865Z",
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
  "muid" : "238a69a4-271c-f5cb-e60e-48952d805859",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
