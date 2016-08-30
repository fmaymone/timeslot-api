# Data API

## Export created Slots from the current user related to a given Group to the iCalendar format

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
Authorization: Token token=WMDviVKOqqqWullQExerxRhsZeY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript
{
  "group" : "22dab74b-96e0-4d42-98d0-4e7dee7b1096"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;22dab74b-96e0-4d42-98d0-4e7dee7b1096&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=WMDviVKOqqqWullQExerxRhsZeY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;22dab74b-96e0-4d42-98d0-4e7dee7b1096.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;e95e77a5eb4d774fc4018cb9871acffd&quot;
X-Request-Id: 2bae720a-3660-4fc9-a25f-4fd4b3968201
X-Runtime: 0.008713
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
DTSTAMP:20160830T095042Z
UID:bb713b20-c744-41bd-a0f1-91362c707de5
DTSTART:20190927T024402
DTEND:20191027T024402
CLASS:PUBLIC
DESCRIPTION:
SUMMARY:Slot title 26
END:VEVENT
END:VCALENDAR

```
