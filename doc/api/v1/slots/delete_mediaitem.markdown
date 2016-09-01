# Slots API

## Delete MediaItem

### DELETE /v1/slots/:id/media

returns 404 if ID is invalid

returns 422 if parameter was missing or is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot where the media belongs to

Name : media *- required -*
Description : Array of the Media Items to delete

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=XOzpdWsplchFBCDqvvSSMM6WSLc
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/20/media</pre>

#### Body
```javascript
{
  "media" : [
    {
      "id" : 16
    },
    {
      "id" : 15
    },
    {
      "id" : 14
    },
    {
      "id" : 13
    },
    {
      "id" : 12
    },
    {
      "id" : 11
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/20/media&quot; -d &#39;{&quot;media&quot;:[{&quot;id&quot;:16},{&quot;id&quot;:15},{&quot;id&quot;:14},{&quot;id&quot;:13},{&quot;id&quot;:12},{&quot;id&quot;:11}]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=XOzpdWsplchFBCDqvvSSMM6WSLc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: f41b1099-0e2b-4108-9811-5149e356d890
X-Runtime: 0.441970
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

