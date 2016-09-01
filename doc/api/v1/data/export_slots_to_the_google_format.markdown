# Data API

## Export Slots to the Google Format

### POST /v1/export/google

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.

If the parameter group is missing, all Slot will be exported.

If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=NA6beKWlv_z8ML_jRQfGt4p06FQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript
{
  "group" : "0025ae6d-0dc0-465d-a38e-94efed1bca43"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;0025ae6d-0dc0-465d-a38e-94efed1bca43&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=NA6beKWlv_z8ML_jRQfGt4p06FQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;0025ae6d-0dc0-465d-a38e-94efed1bca43.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: da017d2a-e753-4784-a84d-bf5d4ca27748
X-Runtime: 0.005836
Content-Length: 104</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
BEGIN:VCALENDAR
VERSION:2.0
PRODID:icalendar-ruby
CALSCALE:GREGORIAN
METHOD:PUBLISH
END:VCALENDAR

```
