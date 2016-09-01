# Users API

## Get slots for Friend - with &#39;between&#39; pagination

### GET /v1/users/:id/slots

### Parameters

Name : id
Description : ID of the user to get the slots for.

Name : limit
Description : Maximum number of slots returned. Default is 40. Maximum is 100.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (server time).

Name : filter
Description : Query parameter to reduce the set of valid slots which are taken into account for the db query. Must be one of:
- **between**: takes 2 additional parameters: *earliest* and *latest*. Will only return slots which overlap with the specified time interval. *Rule: startDate &lt; latest AND endDate &gt; earliest*. Default **mode** is &#39;now&#39;, default **moment** == &#39;earliest.&#39;
- **newer**: tba
Default is **none**.

Name : mode
Description : Query parameter to request slots relative to a given **moment**. Must be one of:
- **past**: *start* before *moment*
- **upcoming**: *start* after or equal *moment*
- **ongoing**: *start* before &amp; *end* after *moment*
- **finished**: *start* &amp; *end* before *moment*
- **now**: *ongoing* &amp; *upcoming* slots
- **around**: limit/2 slots with *start* before *moment* and limit/2 slots with *start* after *moment*. This might miss ongoing slots.
- **all**: no restriction
Default is **all**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : earliest
Description : A point in time. No results before this moment will be returned. Only works with &#39;between&#39; filter.

Name : latest
Description : A point in time. No results after this moment will be returned. Only works with &#39;between&#39; filter.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : mode
Description : Types of slots which were requested.

Name : moment
Description : Point-in-time which was used for the query.

Name : filter
Description : Type of filter which was applied to initial data.

Name : earliest
Description : If set, no Slots which have ended before this point-in-time will be included in the result.

Name : latest
Description : If set, no Slots which are starting after this point-in-time will be included in the result.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/136/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z</pre>

#### Query Parameters

<pre>limit: 2
filter: between
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/136/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z&quot; -X GET \
	-H &quot;Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6d4c647407d6b52a55784ca405b5d334&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1655ddcc-6732-45ba-8682-2c9c996879a9
X-Runtime: 0.047465
Content-Length: 1567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 2,
    "mode" : "now",
    "moment" : "2016-04-21T09:06:18.000Z",
    "filter" : "between",
    "earliest" : "2016-04-21T09:06:18.000Z",
    "latest" : "2016-04-21T19:06:18.000Z",
    "before" : null,
    "after" : "NTUlMjAxNi0wNC0yMSAwNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=",
    "poolSize" : 5
  },
  "data" : [
    {
      "id" : 53,
      "title" : "overlap earliest",
      "description" : "",
      "startDate" : "2016-04-21T03:06:18.000Z",
      "createdAt" : "2016-08-30T09:51:11.704Z",
      "updatedAt" : "2016-08-30T09:51:11.704Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T16:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 136,
        "username" : "User 856",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.650Z",
        "updatedAt" : "2016-08-30T09:51:11.650Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/53"
    },
    {
      "id" : 55,
      "title" : "overlap both",
      "description" : "",
      "startDate" : "2016-04-21T05:06:18.000Z",
      "createdAt" : "2016-08-30T09:51:11.739Z",
      "updatedAt" : "2016-08-30T09:51:11.739Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T22:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 136,
        "username" : "User 856",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.650Z",
        "updatedAt" : "2016-08-30T09:51:11.650Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/55"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/136/slots</pre>

#### Query Parameters

<pre>after: NTUlMjAxNi0wNC0yMSAwNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/136/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;51fa40d3dc48d6cbc679ea72a4d72061&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2b1239bc-6b55-4651-b703-c9a244f76dff
X-Runtime: 0.043077
Content-Length: 1645</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 2,
    "mode" : "now",
    "moment" : "2016-04-21T09:06:18.000Z",
    "filter" : "between",
    "earliest" : "2016-04-21T09:06:18.000Z",
    "latest" : "2016-04-21T19:06:18.000Z",
    "before" : "NTIlMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAxNjowNjoxOC4wMDAwMDAwMDA=",
    "after" : "NTQlMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMzowNjoxOC4wMDAwMDAwMDA=",
    "poolSize" : 5
  },
  "data" : [
    {
      "id" : 52,
      "title" : "in between",
      "description" : "",
      "startDate" : "2016-04-21T15:06:18.000Z",
      "createdAt" : "2016-08-30T09:51:11.669Z",
      "updatedAt" : "2016-08-30T09:51:11.669Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T16:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 136,
        "username" : "User 856",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.650Z",
        "updatedAt" : "2016-08-30T09:51:11.650Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/52"
    },
    {
      "id" : 54,
      "title" : "overlap latest",
      "description" : "",
      "startDate" : "2016-04-21T15:06:18.000Z",
      "createdAt" : "2016-08-30T09:51:11.725Z",
      "updatedAt" : "2016-08-30T09:51:11.725Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T23:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 136,
        "username" : "User 856",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.650Z",
        "updatedAt" : "2016-08-30T09:51:11.650Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/54"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/136/slots</pre>

#### Query Parameters

<pre>after: NTQlMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMzowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/136/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Njj7DCgtfbNXkBr2Qi4ZiiFxYtM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;297eda46b02791447ff25753093c7530&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e0e5598d-63f9-492f-bcd5-9f3dd1dff8b9
X-Runtime: 0.037729
Content-Length: 932</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 2,
    "mode" : "now",
    "moment" : "2016-04-21T09:06:18.000Z",
    "filter" : "between",
    "earliest" : "2016-04-21T09:06:18.000Z",
    "latest" : "2016-04-21T19:06:18.000Z",
    "before" : "NTYlMjAxNi0wNC0yMSAxOTowNjoxNy4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=",
    "after" : null,
    "poolSize" : 5
  },
  "data" : [
    {
      "id" : 56,
      "title" : "starts near end",
      "description" : "",
      "startDate" : "2016-04-21T19:06:17.000Z",
      "createdAt" : "2016-08-30T09:51:11.751Z",
      "updatedAt" : "2016-08-30T09:51:11.751Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T22:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 136,
        "username" : "User 856",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.650Z",
        "updatedAt" : "2016-08-30T09:51:11.650Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/56"
    }
  ]
}
```
