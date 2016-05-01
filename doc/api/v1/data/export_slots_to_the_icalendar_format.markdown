# Data API

## Export Slots to the iCalendar Format

### POST /v1/export/ical

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=rMo-OtXSBxqPhosygZbLJgAyf6Y
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript
{
  "group" : "ede62f43-8b3c-4c25-965b-322fa7ba3ddb"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;ede62f43-8b3c-4c25-965b-322fa7ba3ddb&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=rMo-OtXSBxqPhosygZbLJgAyf6Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;ede62f43-8b3c-4c25-965b-322fa7ba3ddb.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: 8f712d92-a553-4e32-8f84-87e1f3b1d74b
X-Runtime: 0.006082
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
