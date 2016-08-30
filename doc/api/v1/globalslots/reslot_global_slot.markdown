# GlobalSlots API

## Reslot global slot

### POST /v1/globalslots/reslot

Send the **muid** of the Global Slot and at least one  valid SlotGroup/Calendar UUID where the slot should be  added to.

 Backend retrieves slot data from data team.

Returns data of new slot and array with unauthorized slotGroup UUIDs (User has no write access or slotgroup deleted).

Returns 404 if no global slot can be found for given uuid.

### Parameters

Name : predecessor *- required -*
Description : &#39;muid&#39; of the global slot

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups the slot should be added to

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=kERkBCCXDiL4TEAYxjitvheg1LQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/globalslots/reslot</pre>

#### Body
```javascript
{
  "predecessor" : "c4c59de8-83ca-8500-274b-fe16e5ef7a71",
  "slotGroups" : [
    "9fb7b049-ce82-45b7-9ae1-be554ddbf259",
    "042736b9-fc8f-4e91-8a8a-06333b9e4ec3",
    "933d4f29-17ec-4591-a032-c9b9ce489499",
    "d2e9132d-88b0-4e6c-a841-eb7b82c8a516",
    "8f620b93-3b9c-4280-b679-8c07a2760209"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/reslot&quot; -d &#39;{&quot;predecessor&quot;:&quot;c4c59de8-83ca-8500-274b-fe16e5ef7a71&quot;,&quot;slotGroups&quot;:[&quot;9fb7b049-ce82-45b7-9ae1-be554ddbf259&quot;,&quot;042736b9-fc8f-4e91-8a8a-06333b9e4ec3&quot;,&quot;933d4f29-17ec-4591-a032-c9b9ce489499&quot;,&quot;d2e9132d-88b0-4e6c-a841-eb7b82c8a516&quot;,&quot;8f620b93-3b9c-4280-b679-8c07a2760209&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=kERkBCCXDiL4TEAYxjitvheg1LQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b60e4578dacbd984b9211620b169ce01&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5f2d6b8b-999a-43dd-bf75-4e2c0e34fd6d
X-Runtime: 0.276881
Content-Length: 2307</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 112,
  "title" : "VNV Nation",
  "description" : "",
  "startDate" : "2020-02-06T05:45:00.000Z",
  "createdAt" : "2016-08-30T09:50:49.635Z",
  "updatedAt" : "2016-08-30T09:50:49.635Z",
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
    "longitude" : 8.7509019,
    "placeId" : null
  },
  "creator" : {
    "id" : 288,
    "username" : "Concert",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:49.617Z",
    "updatedAt" : "2016-08-30T09:50:49.617Z",
    "deletedAt" : null,
    "image" : "https://farm8.staticflickr.com/7428/9896148136_461a7a842a_k.jpg"
  },
  "notes" : [
    {
      "id" : 226,
      "title" : "Description",
      "content" : "VNV Nation definitely knows how to put on a good show. Even in festival performances where sometimes bands hold back a little, they start off with a slow intro and some great lighting and effects. Once the music kicks …",
      "localId" : null,
      "createdAt" : "2016-08-30T09:50:49.646Z"
    }
  ],
  "media" : [
    {
      "mediaId" : 469,
      "publicId" : "http://images.sk-static.com/images/media/img/col6/20091007-021050-312335.jpg",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-08-30T09:50:49.640Z"
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
  "firstGroup" : {
    "id" : "042736b9-fc8f-4e91-8a8a-06333b9e4ec3",
    "name" : "Testgroup 124",
    "image" : "",
    "description" : null,
    "defaultColor" : "000000",
    "membersCanPost" : false,
    "membersCanInvite" : false,
    "public" : false,
    "createdAt" : "2016-08-30T09:50:49.537Z",
    "updatedAt" : "2016-08-30T09:50:49.537Z",
    "deletedAt" : null,
    "owner" : {
      "id" : 285,
      "username" : "User 396",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:49.531Z",
      "updatedAt" : "2016-08-30T09:50:49.531Z",
      "deletedAt" : null,
      "image" : ""
    },
    "memberIds" : [
      285
    ],
    "memberCount" : 1,
    "slotCount" : 1
  },
  "slotGroupUuids" : [
    "042736b9-fc8f-4e91-8a8a-06333b9e4ec3",
    "933d4f29-17ec-4591-a032-c9b9ce489499"
  ],
  "unauthorizedSlotgroups" : [
    "d2e9132d-88b0-4e6c-a841-eb7b82c8a516",
    "8f620b93-3b9c-4280-b679-8c07a2760209"
  ]
}
```
