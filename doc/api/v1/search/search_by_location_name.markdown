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
Authorization: Token token=Qu7EZw5PrzWPjH3EyE4VJAmSFt0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Qu7EZw5PrzWPjH3EyE4VJAmSFt0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;acdc8b946e447c7bc333a19c4e812843&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 902278f9-62ab-4345-8acf-9ba75d47e8ec
X-Runtime: 0.009692
Vary: Origin
Content-Length: 376</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : "3c25fe8d-3baf-4f99-9da4-265cd0a32662",
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
    "longitude" : -11.993
  }
]
```
