# Data API

## Import Slots from a file

### POST /v1/import/

returns 403 if the file includes invalid encoded chars

returns 404 if the group uuid was not found

returns 422 if parameters are invalid or missing

returns 500 if an error occurs during the file import

### Parameters

Name : file *- required -*
Description : The file which has to be imported.

Supported File Formats:.

1. iCalendar (*.ics).

2. Google Calendar (*.ics).

3. Microsoft Outlook (*.csv).

4. Timeslot (*.json)

Name : group
Description : Holds the uuid of the slot group to where the Slots should be imported.

If the parameter group is missing, a default slot group with the name &#39;Imports&#39; will used instead.

If the group uuid was not found, no Slot will be imported.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: text/plain
Authorization: Token token=O6x7RBBqr8M2Elp7QhzmRqMqOIY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/import/</pre>

#### Body
```javascript
{
  "file" : [
    "BEGIN:VCALENDAR\r\n",
    "VERSION:2.0\r\n",
    "PRODID:icalendar-ruby\r\n",
    "CALSCALE:GREGORIAN\r\n",
    "METHOD:PUBLISH\r\n",
    "BEGIN:VEVENT\r\n",
    "DTSTAMP:20160830T095042Z\r\n",
    "UID:db439ff9-c014-4f87-8a4a-50f772270fdf\r\n",
    "DTSTART:20190920T194402\r\n",
    "DTEND:20191020T194402\r\n",
    "CLASS:PUBLIC\r\n",
    "DESCRIPTION:\r\n",
    "SUMMARY:Slot title 19\r\n",
    "END:VEVENT\r\n",
    "BEGIN:VEVENT\r\n",
    "DTSTAMP:20160830T095042Z\r\n",
    "UID:7402d020-aa65-45a6-9de4-079696b8b186\r\n",
    "DTSTART:20190921T204402\r\n",
    "DTEND:20191021T204402\r\n",
    "CLASS:PUBLIC\r\n",
    "DESCRIPTION:\r\n",
    "SUMMARY:Slot title 20\r\n",
    "END:VEVENT\r\n",
    "BEGIN:VEVENT\r\n",
    "DTSTAMP:20160830T095042Z\r\n",
    "UID:f16a0722-ddcb-427c-b841-ca25e8211a3b\r\n",
    "DTSTART:20190922T214402\r\n",
    "DTEND:20191022T214402\r\n",
    "CLASS:PUBLIC\r\n",
    "DESCRIPTION:\r\n",
    "SUMMARY:Slot title 21\r\n",
    "END:VEVENT\r\n",
    "BEGIN:VEVENT\r\n",
    "DTSTAMP:20160830T095042Z\r\n",
    "UID:f57878a6-97ae-4db2-b38c-bbf8f779fd5d\r\n",
    "DTSTART:20190923T224402\r\n",
    "DTEND:20191023T224402\r\n",
    "CLASS:PUBLIC\r\n",
    "DESCRIPTION:\r\n",
    "SUMMARY:Slot title 22\r\n",
    "END:VEVENT\r\n",
    "BEGIN:VEVENT\r\n",
    "DTSTAMP:20160830T095042Z\r\n",
    "UID:c61642c2-62de-434c-a582-6d67fb175cb6\r\n",
    "DTSTART:20190924T234402\r\n",
    "DTEND:20191024T234402\r\n",
    "CLASS:PUBLIC\r\n",
    "DESCRIPTION:\r\n",
    "SUMMARY:Slot title 23\r\n",
    "END:VEVENT\r\n",
    "END:VCALENDAR\r\n"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/import/&quot; -d &#39;{&quot;file&quot;:[&quot;BEGIN:VCALENDAR\r\n&quot;,&quot;VERSION:2.0\r\n&quot;,&quot;PRODID:icalendar-ruby\r\n&quot;,&quot;CALSCALE:GREGORIAN\r\n&quot;,&quot;METHOD:PUBLISH\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160830T095042Z\r\n&quot;,&quot;UID:db439ff9-c014-4f87-8a4a-50f772270fdf\r\n&quot;,&quot;DTSTART:20190920T194402\r\n&quot;,&quot;DTEND:20191020T194402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 19\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160830T095042Z\r\n&quot;,&quot;UID:7402d020-aa65-45a6-9de4-079696b8b186\r\n&quot;,&quot;DTSTART:20190921T204402\r\n&quot;,&quot;DTEND:20191021T204402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 20\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160830T095042Z\r\n&quot;,&quot;UID:f16a0722-ddcb-427c-b841-ca25e8211a3b\r\n&quot;,&quot;DTSTART:20190922T214402\r\n&quot;,&quot;DTEND:20191022T214402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 21\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160830T095042Z\r\n&quot;,&quot;UID:f57878a6-97ae-4db2-b38c-bbf8f779fd5d\r\n&quot;,&quot;DTSTART:20190923T224402\r\n&quot;,&quot;DTEND:20191023T224402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 22\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160830T095042Z\r\n&quot;,&quot;UID:c61642c2-62de-434c-a582-6d67fb175cb6\r\n&quot;,&quot;DTSTART:20190924T234402\r\n&quot;,&quot;DTEND:20191024T234402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 23\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;END:VCALENDAR\r\n&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=O6x7RBBqr8M2Elp7QhzmRqMqOIY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: cee6cc73-cccc-452d-addd-4db93df34a33
X-Runtime: 0.168346
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

