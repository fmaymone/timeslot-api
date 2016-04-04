# GlobalSlots API

## Reslot global slot

### POST /v1/globalslots/reslot

Send the **muid** of the Global Slot to reslot it.

 Backend retrieves slot data from data team.

at the moment returns 503 if global slot can not be found.

### Parameters

Name : predecessor *- required -*
Description : &#39;muid&#39; of the global slot

Name : slotSets
Description : Array with UUIDs of the SlotGroups and SlotSets the slot should be added to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=LZbXd1UXBUw0k7KRSCQuHvMfpVQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/globalslots/reslot</pre>

#### Body
```javascript
{
  "predecessor" : "820304fe-a416-db0d-807e-90cb9ebd9f1b"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/reslot&quot; -d &#39;{&quot;predecessor&quot;:&quot;820304fe-a416-db0d-807e-90cb9ebd9f1b&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=LZbXd1UXBUw0k7KRSCQuHvMfpVQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c74509439e3bf36060680d102d888dcb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: acc8705d-a790-4fef-ae76-0981ecd0e033
X-Runtime: 0.191071
Vary: Origin
Content-Length: 1426</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 4,
  "title" : "Borussia Dortmund vs. FC Liverpool",
  "startDate" : "2016-04-07T19:05:00.000Z",
  "createdAt" : "2016-04-04T20:50:21.447Z",
  "updatedAt" : "2016-04-04T20:50:21.447Z",
  "deletedAt" : null,
  "endDate" : "2016-04-07T21:05:00.000Z",
  "location" : {
    "id" : "411456d2-532a-b0cb-8dc6-c0ea5e8f9488",
    "name" : "Signal Iduna Park",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : "Dortmund",
    "subLocality" : "Mitte",
    "administrativeArea" : "NW",
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : null,
    "isoCountryCode" : "DE",
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.4940605163574,
    "longitude" : 7.45179986953735
  },
  "creator" : {
    "id" : 12,
    "username" : "dfb.de",
    "createdAt" : "2016-04-04T20:50:21.330Z",
    "updatedAt" : "2016-04-04T20:50:21.330Z",
    "deletedAt" : null,
    "image" : "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png"
  },
  "notes" : [
    {
      "id" : 1,
      "title" : "Description",
      "content" : "Europa League, 2015/2016, Viertelfinale",
      "localId" : null,
      "createdAt" : "2016-04-04T20:50:21.479Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 19,
      "publicId" : "http://assets.dfb.de/public/uploads/707f77798166ee1206a408c8967a75bfaa9136b55acd155c6680f739aaac",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-04-04T20:50:21.454Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "muid" : "820304fe-a416-db0d-807e-90cb9ebd9f1b",
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : []
}
```
