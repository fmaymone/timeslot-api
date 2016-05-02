# Data API

## Export created Slots from the current user related to a given Group to the Google format

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
Authorization: Token token=OLhqelmCp6bcLiGFKLIrHrQCmXU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/google</pre>

#### Body
```javascript
{
  "group" : "39227172-9d3d-4022-a8fd-5874ddff6752"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/google&quot; -d &#39;{&quot;group&quot;:&quot;39227172-9d3d-4022-a8fd-5874ddff6752&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=OLhqelmCp6bcLiGFKLIrHrQCmXU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;39227172-9d3d-4022-a8fd-5874ddff6752.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;8fda6e79108b678074045648b64582c5&quot;
X-Request-Id: 17ff6547-0543-4136-a40b-82b0f6a54d22
X-Runtime: 0.017895
Content-Length: 297</pre>

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
UID:a451b732-515b-494a-ba7e-780e15a37c0e
DTSTART:20190915T174402
DTEND:20191015T174402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 41
END:VEVENT
END:VCALENDAR

```
