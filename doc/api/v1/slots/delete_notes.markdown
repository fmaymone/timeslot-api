# Slots API

## Delete Notes

### DELETE /v1/slots/:id/notes

returns 404 if ID is invalid

returns 422 if parameter was missing or is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot where the notes belongs to

Name : notes *- required -*
Description : Array of the Notes to delete

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=6NfJc89GEd4GY1fRMcG6uLGMNq8
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/23/notes</pre>

#### Body
```javascript
{
  "notes" : [
    {
      "id" : 15
    },
    {
      "id" : 14
    },
    {
      "id" : 13
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/23/notes&quot; -d &#39;{&quot;notes&quot;:[{&quot;id&quot;:15},{&quot;id&quot;:14},{&quot;id&quot;:13}]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=6NfJc89GEd4GY1fRMcG6uLGMNq8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: f10167a3-1104-48b5-a239-17e0d5f33cd7
X-Runtime: 0.047657
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

