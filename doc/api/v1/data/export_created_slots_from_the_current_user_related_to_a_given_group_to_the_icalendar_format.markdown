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
Authorization: Token token=CejqLAaJ058On3iOrRafpG72KoQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/export/ical</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/export/ical&quot; -d &#39;{&quot;group&quot;:&quot;d91e43ad-426c-442f-a525-41cf5f98fb9f&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: text/plain&quot; \
	-H &quot;Authorization: Token token=CejqLAaJ058On3iOrRafpG72KoQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Disposition: attachment; filename=&quot;d91e43ad-426c-442f-a525-41cf5f98fb9f.ical&quot;
Content-Transfer-Encoding: binary
Content-Type: application/octet-stream
Cache-Control: private
Vary: Accept-Encoding, Origin
ETag: W/&quot;494c49f602237ac148f2d638bc83c0ce&quot;
X-Request-Id: 1a99b3dd-0077-49cd-9c92-24eb8fe9d27b
X-Runtime: 0.013733
Content-Length: 297</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
