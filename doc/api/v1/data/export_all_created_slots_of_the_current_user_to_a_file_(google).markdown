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
Authorization: Token token=pjZdBUp2D8r4nmWh2LIsIbYe2lo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=pjZdBUp2D8r4nmWh2LIsIbYe2lo&quot;</pre>

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
ETag: W/&quot;7f4fcd61c7077d5c2c6fbe002dab3022&quot;
X-Request-Id: d3405bd4-8b3c-4add-8b14-d87df4f19c1c
X-Runtime: 0.013878
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
DTSTAMP:20160830T095043Z
UID:d2188d15-0aa7-4041-8e7e-fa2947717a74
DTSTART:20190908T104402
DTEND:20191008T104402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 34
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095043Z
UID:df54be83-5061-4d51-91c2-9df33a262320
DTSTART:20190909T114402
DTEND:20191009T114402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 35
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095043Z
UID:ee5733db-c95e-4788-b180-ebf9b86473ae
DTSTART:20190910T124402
DTEND:20191010T124402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 36
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095043Z
UID:6c9b7fc5-46ec-4f54-9794-433220237c63
DTSTART:20190911T134402
DTEND:20191011T134402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 37
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095043Z
UID:922c411e-e237-40f8-991b-3e4a6389053e
DTSTART:20190912T144402
DTEND:20191012T144402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 38
END:VEVENT
END:VCALENDAR

```
