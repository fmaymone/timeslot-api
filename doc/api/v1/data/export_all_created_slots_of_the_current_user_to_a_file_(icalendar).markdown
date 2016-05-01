# Data API

## Export all created Slots of the current user to a file (iCalendar)

### POST /v1/export/ical

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
Authorization: Token token=kxNdSnrn7tIvKIghCEsMsnMo_9Q
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=kxNdSnrn7tIvKIghCEsMsnMo_9Q&quot;</pre>

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
ETag: W/&quot;a044a87877aaf93561858816f7daa314&quot;
X-Request-Id: 87a8e23c-3a80-4f13-84a1-34e6142a7cef
X-Runtime: 0.039096
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
DTSTAMP:20160501T225404Z
UID:12dc3fec-e492-4394-8f88-b7830778bad6
DTSTART:20190924T234402
DTEND:20191024T234402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 23
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225404Z
UID:2fe14b18-f2cb-42e1-9c6c-deaae8da7c17
DTSTART:20190923T224402
DTEND:20191023T224402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 22
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225404Z
UID:6cbdf125-1a53-4360-84c4-4f86ec920ae9
DTSTART:20190922T214402
DTEND:20191022T214402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 21
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225404Z
UID:2520d02e-d8fd-4f40-92ea-b087e42d49ea
DTSTART:20190921T204402
DTEND:20191021T204402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 20
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160501T225404Z
UID:7f44c54f-fb8c-4e96-8449-b30d38ba54dd
DTSTART:20190920T194402
DTEND:20191020T194402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 19
END:VEVENT
END:VCALENDAR

```
