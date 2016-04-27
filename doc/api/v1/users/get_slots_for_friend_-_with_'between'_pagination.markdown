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
Default is **upcoming**.

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

Name : filter
Description : Type of filter which was applied to initial data.

Name : moment
Description : Point-in-time which was used for the query.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/49/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z</pre>

#### Query Parameters

<pre>limit: 2
filter: between
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/49/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z&quot; -X GET \
	-H &quot;Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;35a927a48d220bb5806a87ad4ddf80fa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6101bf5d-542b-4a86-971b-7c4ad780486d
X-Runtime: 0.146701
Vary: Origin
Content-Length: 1338</pre>

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
    "after" : "MjAlMjAxNi0wNC0yMSAwNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 18,
      "title" : "overlap earliest",
      "startDate" : "2016-04-21T03:06:18.000Z",
      "createdAt" : "2016-04-27T22:51:21.285Z",
      "updatedAt" : "2016-04-27T22:51:21.285Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T16:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 52,
        "username" : "User 51",
        "createdAt" : "2016-04-27T22:51:21.279Z",
        "updatedAt" : "2016-04-27T22:51:21.279Z",
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
      "url" : "http://example.org/v1/slots/18"
    },
    {
      "id" : 20,
      "title" : "overlap both",
      "startDate" : "2016-04-21T05:06:18.000Z",
      "createdAt" : "2016-04-27T22:51:21.311Z",
      "updatedAt" : "2016-04-27T22:51:21.311Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T22:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 54,
        "username" : "User 55",
        "createdAt" : "2016-04-27T22:51:21.303Z",
        "updatedAt" : "2016-04-27T22:51:21.303Z",
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
      "url" : "http://example.org/v1/slots/20"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/49/slots</pre>

#### Query Parameters

<pre>after: MjAlMjAxNi0wNC0yMSAwNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/49/slots&quot; -X GET \
	-H &quot;Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;910d539f3ea159f429816a03b1c7cb17&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 90d9e962-4f6a-4a34-a332-deefb6dbfc98
X-Runtime: 0.033832
Vary: Origin
Content-Length: 1416</pre>

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
    "before" : "MTclMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAxNjowNjoxOC4wMDAwMDAwMDA=",
    "after" : "MTklMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMzowNjoxOC4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 17,
      "title" : "in between",
      "startDate" : "2016-04-21T15:06:18.000Z",
      "createdAt" : "2016-04-27T22:51:21.274Z",
      "updatedAt" : "2016-04-27T22:51:21.274Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T16:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 51,
        "username" : "User 49",
        "createdAt" : "2016-04-27T22:51:21.262Z",
        "updatedAt" : "2016-04-27T22:51:21.262Z",
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
      "url" : "http://example.org/v1/slots/17"
    },
    {
      "id" : 19,
      "title" : "overlap latest",
      "startDate" : "2016-04-21T15:06:18.000Z",
      "createdAt" : "2016-04-27T22:51:21.298Z",
      "updatedAt" : "2016-04-27T22:51:21.298Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T23:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 53,
        "username" : "User 53",
        "createdAt" : "2016-04-27T22:51:21.290Z",
        "updatedAt" : "2016-04-27T22:51:21.290Z",
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
      "url" : "http://example.org/v1/slots/19"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/49/slots</pre>

#### Query Parameters

<pre>after: MTklMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMzowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/49/slots&quot; -X GET \
	-H &quot;Authorization: Token token=f1ukAxo-_hI6X9A34pftVcl_aLU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;03ac305eded2910b5a9bce37800433b9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8a3113bd-d7f3-46b5-b637-7027acceae50
X-Runtime: 0.024809
Vary: Origin
Content-Length: 811</pre>

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
    "before" : "MjElMjAxNi0wNC0yMSAxOTowNjoxNy4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 21,
      "title" : "starts near end",
      "startDate" : "2016-04-21T19:06:17.000Z",
      "createdAt" : "2016-04-27T22:51:21.323Z",
      "updatedAt" : "2016-04-27T22:51:21.323Z",
      "deletedAt" : null,
      "endDate" : "2016-04-21T22:06:18.000Z",
      "location" : null,
      "creator" : {
        "id" : 55,
        "username" : "User 57",
        "createdAt" : "2016-04-27T22:51:21.316Z",
        "updatedAt" : "2016-04-27T22:51:21.316Z",
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
      "url" : "http://example.org/v1/slots/21"
    }
  ]
}
```
