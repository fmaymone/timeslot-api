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
Authorization: Token token=YJbw67LGo32gOsotvxSkMo5HHUc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=YJbw67LGo32gOsotvxSkMo5HHUc&quot;</pre>

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
ETag: W/&quot;8db33deaaece3885535d8a5eaa145868&quot;
X-Request-Id: 0905684e-b599-4a20-9bcf-e5cc979eb6f8
X-Runtime: 0.037244
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
DTSTAMP:20160830T095042Z
UID:db439ff9-c014-4f87-8a4a-50f772270fdf
DTSTART:20190920T194402
DTEND:20191020T194402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 19
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095042Z
UID:7402d020-aa65-45a6-9de4-079696b8b186
DTSTART:20190921T204402
DTEND:20191021T204402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 20
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095042Z
UID:f16a0722-ddcb-427c-b841-ca25e8211a3b
DTSTART:20190922T214402
DTEND:20191022T214402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 21
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095042Z
UID:f57878a6-97ae-4db2-b38c-bbf8f779fd5d
DTSTART:20190923T224402
DTEND:20191023T224402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 22
END:VEVENT
BEGIN:VEVENT
DTSTAMP:20160830T095042Z
UID:c61642c2-62de-434c-a582-6d67fb175cb6
DTSTART:20190924T234402
DTEND:20191024T234402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 23
END:VEVENT
END:VCALENDAR

```
