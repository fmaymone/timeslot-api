# Data API

## Export created Slots from the current user related to a given Group to the Timeslot format

### POST /v1/export/timeslot

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=mR2QzfO79i1bTZJPa8_i9dOtNkc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/timeslot</pre>

#### Body
```javascript
{
  "group" : "0d736671-0e94-43eb-8ba3-69f77692d066"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/timeslot&quot; -d &#39;{&quot;group&quot;:&quot;0d736671-0e94-43eb-8ba3-69f77692d066&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mR2QzfO79i1bTZJPa8_i9dOtNkc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;0d736671-0e94-43eb-8ba3-69f77692d066.json&quot;
Content-Transfer-Encoding: binary
Content-Type: application/json
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;c43f95a2d3f045080bae90c178bbf103&quot;
X-Request-Id: 47def81a-5cf2-4c21-967e-f357da1f88a6
X-Runtime: 0.013483
Content-Length: 178</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "uid" : "06ead22d-062c-4a41-afc7-f7666a750405",
    "title" : "Slot title 71",
    "visibility" : "public",
    "start" : "2019-09-18T23:44:02.000Z",
    "end" : "2019-10-18T23:44:02.000Z",
    "location" : null
  }
]
```
