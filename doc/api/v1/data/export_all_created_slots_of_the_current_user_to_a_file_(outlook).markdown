# Data API

## Export all created Slots of the current user to a file (Outlook)

### POST /v1/export/outlook

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
Authorization: Token token=9I4vnYrJ-Ga-qUazLmzjCRluG7k
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/outlook</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/export/outlook&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=9I4vnYrJ-Ga-qUazLmzjCRluG7k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;Timeslot-Export.csv&quot;
Content-Transfer-Encoding: binary
Content-Type: text/csv
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;645f12afb64e4d31d27956203cedd207&quot;
X-Request-Id: de1c2ead-d9ff-4199-9164-176f8b16fbcf
X-Runtime: 0.022309
Content-Length: 464</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
