# Data API

## Export all created Slots of the current user to a file (Google)

### POST /v1/export/google

returns 404 if the group uuid was not found
returns 422 if parameters are invalid or missing
returns 500 if an error occurs during the export

### Parameters

Name : group
Description : Holds the uuid of the slot group which should be exported.
If the parameter group is missing, all Slot will be exported.
If the group uuid was not found, no Slot will be exported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=rs9XkeL1vjlRzL0oTA7exw82ZTI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=rs9XkeL1vjlRzL0oTA7exw82ZTI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;d18a5e4ec98bbad35479880119fadcc6&quot;
X-Request-Id: 9e364b1e-9897-421d-8abb-5a0bb59e136b
X-Runtime: 0.021002
Content-Length: 1069</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
BEGIN:VCALENDAR
VERSION:2.0
PRODID:icalendar-ruby
CALSCALE:GREGORIAN
METHOD:PUBLISH
BEGIN:VEVENT
DTSTAMP:20160501T225405Z
UID:90923e1f-6a0f-4f3d-aa82-a0d3b6c74462
DTSTART:20190912T144402
DTEND:20191012T144402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 38
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225405Z
UID:35c87dac-c296-4d2d-9090-bf2fb681fd81
DTSTART:20190911T134402
DTEND:20191011T134402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 37
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225405Z
UID:cc0b3ce8-99b6-4741-a08d-4e2138d56131
DTSTART:20190910T124402
DTEND:20191010T124402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 36
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225405Z
UID:8aa69ae7-b3b7-4b44-abe0-9e5ade731564
DTSTART:20190909T114402
DTEND:20191009T114402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 35
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225405Z
UID:6f625143-ab85-494e-87b0-047e32c77c19
DTSTART:20190908T104402
DTEND:20191008T104402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 34
END:VEVENT
END:VCALENDAR

```
