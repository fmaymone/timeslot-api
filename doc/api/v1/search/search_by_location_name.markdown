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
Authorization: Token token=jLkZpEVPw7oLOMGWdB5nwOasKrA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=jLkZpEVPw7oLOMGWdB5nwOasKrA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9ea17055d0317fd915f10949c831a05c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fc8b3dfb-74b5-4fd0-8d5f-9f427e6bf84e
X-Runtime: 0.013368
Vary: Origin
Content-Length: 363</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 2,
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
    "privateLocation" : false
  }
]
```
