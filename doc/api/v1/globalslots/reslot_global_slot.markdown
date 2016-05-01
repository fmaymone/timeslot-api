# GlobalSlots API

## Reslot global slot

### POST /v1/globalslots/reslot

Send the **muid** of the Global Slot to reslot it.

 Backend retrieves slot data from data team.

returns 404 if no global slot can be found for given uuid

### Parameters

Name : predecessor *- required -*
Description : &#39;muid&#39; of the global slot

Name : slotSets
Description : Array with UUIDs of the SlotGroups and SlotSets the slot should be added to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=qnBKp5zkdtCi2cMtR-nvTagpQSs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/globalslots/reslot</pre>

#### Body
```javascript
{
  "predecessor" : "c4c59de8-83ca-8500-274b-fe16e5ef7a71"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/reslot&quot; -d &#39;{&quot;predecessor&quot;:&quot;c4c59de8-83ca-8500-274b-fe16e5ef7a71&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=qnBKp5zkdtCi2cMtR-nvTagpQSs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f0c26ad73d646a4ea9073fed500a572b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14c4d6cc-d486-49aa-880e-d18c86d4f837
X-Runtime: 0.190715
Content-Length: 1506</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 104,
  "title" : "VNV Nation",
  "startDate" : "2020-02-06T05:45:00.000Z",
  "createdAt" : "2016-05-01T22:54:07.999Z",
  "updatedAt" : "2016-05-01T22:54:07.999Z",
  "deletedAt" : null,
  "endDate" : "2020-02-06T09:45:00.000Z",
  "location" : {
    "id" : "7ffd07c2-4969-8e41-5d47-cade82aac954",
    "name" : "Pier 2",
    "thoroughfare" : "Gröpelinger Fährweg 6",
    "subThoroughfare" : null,
    "locality" : "Bremen",
    "subLocality" : "Walle",
    "administrativeArea" : "HB",
    "subAdministrativeArea" : null,
    "postalCode" : "28237",
    "country" : null,
    "isoCountryCode" : "DE",
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 53.1083112,
    "longitude" : 8.7509019
  },
  "creator" : {
    "id" : 92,
    "username" : "Concert",
    "createdAt" : "2016-05-01T22:54:07.979Z",
    "updatedAt" : "2016-05-01T22:54:07.979Z",
    "deletedAt" : null,
    "image" : "https://farm8.staticflickr.com/7428/9896148136_461a7a842a_k.jpg"
  },
  "notes" : [
    {
      "id" : 1,
      "title" : "Description",
      "content" : "VNV Nation definitely knows how to put on a good show. Even in festival performances where sometimes bands hold back a little, they start off with a slow intro and some great lighting and effects. Once the music kicks …",
      "localId" : null,
      "createdAt" : "2016-05-01T22:54:08.036Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 19,
      "publicId" : "http://images.sk-static.com/images/media/img/col6/20091007-021050-312335.jpg",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:08.004Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "muid" : "c4c59de8-83ca-8500-274b-fe16e5ef7a71",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : []
}
```
