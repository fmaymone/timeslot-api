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
Authorization: Token token=wdi17HJ4JNX8RB_fycbAxW8mFMU
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/22/notes</pre>

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

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/22/notes&quot; -d &#39;{&quot;notes&quot;:[{&quot;id&quot;:15},{&quot;id&quot;:14},{&quot;id&quot;:13}]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=wdi17HJ4JNX8RB_fycbAxW8mFMU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 44ccc9aa-38d0-472a-87c9-57b9c19f0062
X-Runtime: 0.069835
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

