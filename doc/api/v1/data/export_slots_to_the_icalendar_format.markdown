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
Authorization: Token token=a1Q7zM9KS2H2lwuXpgJw4gTyUBs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript
{
  "group" : "1c725d58-526c-4777-a168-30a73b951912"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;1c725d58-526c-4777-a168-30a73b951912&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=a1Q7zM9KS2H2lwuXpgJw4gTyUBs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;1c725d58-526c-4777-a168-30a73b951912.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;efcef2533c1297d2d77b3ce0018964c0&quot;
X-Request-Id: 59a5709e-7d58-4f0e-9e9b-ee7feee5f25d
X-Runtime: 0.005870
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
