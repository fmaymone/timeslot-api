# Users API

## Get slots for current user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots &amp; ReSlots

If a user is authenticated the slot settings (alerts) will be included.

The returned slots are ordered by startdate, enddate, id.

### Parameters

Name : limit
Description : Query parameter to limit the amount of slots returned. Default is 50. We need a maximum for this.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (on the server).

Name : status
Description : Query parameter to filter slots relative to a point-in-time. Must be one of [past, ongoing, upcoming, now, around, all].
Default is &#39;all&#39;. Now = ongoing + upcoming. TODO: around = ongoing + [upcoming + past] (equally filled until limit).


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : creatorId
Description : ID of the User who created the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : notes
Description : A list of all notes on the slot

Name : likes
Description : Number of likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : visibility
Description : Visibility if it&#39;s a StandardSlot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=Gl_dfpRU8t6isz69oJ3o_tuQImc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/416/slots?limit=20&amp;moment=2015-10-03T22%3A30%3A47.143Z&amp;status=all</pre>

#### Query Parameters

<pre>limit: 20
moment: 2015-10-03T22:30:47.143Z
status: all</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/416/slots?limit=20&amp;moment=2015-10-03T22%3A30%3A47.143Z&amp;status=all&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Gl_dfpRU8t6isz69oJ3o_tuQImc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e8258aa47ae8e29f7ca0e53eb19e7543&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f0cd3b2-8c04-41b1-a17a-236dad3818b4
X-Runtime: 0.088450
Vary: Origin
Content-Length: 2462</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 20,
    "status" : "all",
    "moment" : "2015-10-03T22:30:47.143Z",
    "before" : null,
    "after" : null
  },
  "data" : [
    {
      "id" : 124,
      "title" : "Slot title 109",
      "startDate" : "2019-09-02T13:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:47.103Z",
      "updatedAt" : "2015-10-03T22:30:47.141Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 426,
        "username" : "User 388",
        "createdAt" : "2015-10-03T22:30:47.106Z",
        "updatedAt" : "2015-10-03T22:30:47.106Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "slotter" : {
        "id" : 416
      },
      "parent" : {
        "id" : 125
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/124"
    },
    {
      "id" : 118,
      "title" : "Slot title 103",
      "startDate" : "2019-09-23T07:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:47.046Z",
      "updatedAt" : "2015-10-03T22:30:47.046Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 417,
        "username" : "User 379",
        "createdAt" : "2015-10-03T22:30:47.041Z",
        "updatedAt" : "2015-10-03T22:30:47.041Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "visibility" : "private",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/118"
    },
    {
      "id" : 119,
      "title" : "Slot title 104",
      "startDate" : "2019-09-24T08:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:47.053Z",
      "updatedAt" : "2015-10-03T22:30:47.053Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 418,
        "username" : "User 380",
        "createdAt" : "2015-10-03T22:30:47.049Z",
        "updatedAt" : "2015-10-03T22:30:47.049Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "visibility" : "friends",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/119"
    },
    {
      "id" : 121,
      "title" : "Slot title 106",
      "startDate" : "2019-09-26T10:44:02.000Z",
      "createdAt" : "2015-10-03T22:30:47.066Z",
      "updatedAt" : "2015-10-03T22:30:47.084Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 421,
        "username" : "User 383",
        "createdAt" : "2015-10-03T22:30:47.069Z",
        "updatedAt" : "2015-10-03T22:30:47.069Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "slotter" : {
        "id" : 416
      },
      "parent" : {
        "id" : 122
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/121"
    }
  ]
}
```
