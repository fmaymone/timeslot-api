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
Authorization: Token token=RNwGD8JjrD65-GlV0g19ZPiMATA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/import/</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/import/&quot; -d &#39;{&quot;file&quot;:[&quot;BEGIN:VCALENDAR\r\n&quot;,&quot;VERSION:2.0\r\n&quot;,&quot;PRODID:icalendar-ruby\r\n&quot;,&quot;CALSCALE:GREGORIAN\r\n&quot;,&quot;METHOD:PUBLISH\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160421T121656Z\r\n&quot;,&quot;UID:b9b6c92c-e78b-4dc7-a48d-2e5628d804fe\r\n&quot;,&quot;DTSTART:20190920T194402\r\n&quot;,&quot;DTEND:20191020T194402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 19\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160421T121656Z\r\n&quot;,&quot;UID:d1bb7867-c1fa-4465-9bc3-ceb0050c66d9\r\n&quot;,&quot;DTSTART:20190921T204402\r\n&quot;,&quot;DTEND:20191021T204402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 20\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160421T121656Z\r\n&quot;,&quot;UID:ea33e29a-b3dd-435a-b9c8-ba9f1d7750d0\r\n&quot;,&quot;DTSTART:20190922T214402\r\n&quot;,&quot;DTEND:20191022T214402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 21\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160421T121656Z\r\n&quot;,&quot;UID:3d29ad7a-486d-4017-aa23-dd28e298bf98\r\n&quot;,&quot;DTSTART:20190923T224402\r\n&quot;,&quot;DTEND:20191023T224402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 22\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;BEGIN:VEVENT\r\n&quot;,&quot;DTSTAMP:20160421T121656Z\r\n&quot;,&quot;UID:586f117c-e21a-47fc-b96c-f91a632cad4a\r\n&quot;,&quot;DTSTART:20190924T234402\r\n&quot;,&quot;DTEND:20191024T234402\r\n&quot;,&quot;CLASS:PUBLIC\r\n&quot;,&quot;DESCRIPTION:\r\n&quot;,&quot;SUMMARY:Slot title 23\r\n&quot;,&quot;END:VEVENT\r\n&quot;,&quot;END:VCALENDAR\r\n&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=RNwGD8JjrD65-GlV0g19ZPiMATA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 70bea4a7-f97b-429f-9564-0043d4f6faa5
X-Runtime: 0.204897
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

