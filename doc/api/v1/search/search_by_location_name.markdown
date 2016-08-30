# Search API

## Search by location name

### GET /v1/search/location

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the location

Name : name
Description : name of the location

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=RBLQ_-wnMq8pHgjb4398WBY57dw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=RBLQ_-wnMq8pHgjb4398WBY57dw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;071e03ea66dc648163840b519794e216&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b966256a-b4c4-4c98-8d03-57425f24252f
X-Runtime: 0.010359
Content-Length: 391</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "4b1b69a5-c890-4356-a5ea-52e0209a3ad2",
    "name" : "Timeslot Friedrichstraße 110 (Berlin)",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : null,
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993,
    "placeId" : null
  }
]
```
