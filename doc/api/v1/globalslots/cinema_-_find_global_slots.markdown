# GlobalSlots API

## Cinema - Find global slots

### GET /v1/globalslots/search

Forwards a search request to the Elastic Search Service for global slots from the data team.

returns 422 if parameters invalid

### Parameters

Name : category *- required -*
Description : Basic slot category to search in. Valid categories: [cinema, football] 

Name : q *- required -*
Description : String to search global slots for

Name : moment
Description : find results after this datetime, default: Time.now

Name : limit
Description : maximum number of results, default: 20

### Request

#### Headers

<pre>Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10</pre>

#### Query Parameters

<pre>category: cinema
q: James
moment: 2015-11-29T12:43:28.907Z
limit: 10</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/globalslots/search?category=cinema&amp;q=James&amp;moment=2015-11-29T12%3A43%3A28.907Z&amp;limit=10&quot; -X GET \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e491869f1de6a83ca8a187269219dcf6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e3741672-490c-47ef-b7fb-4d7e6dc1aad8
X-Runtime: 0.031362
Vary: Origin
Content-Length: 35758</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "result" : [
    {
      "muid" : "58b02df9-9e46-f9db-3750-b1f42d3a3cf9",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:40:00",
      "endDate" : "2016-01-29T21:10:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/sulzbach-taunus/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kinopolis Main-Taunus,Main-Taunus-Zentrum,65843,Sulzbach (Taunus)",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 50.120525,
        "longitude" : 8.524652
      }
    },
    {
      "muid" : "ed428488-0688-0450-160d-c6c808437281",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:45:00",
      "endDate" : "2016-01-29T21:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/boeblingen/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Filmzentrum Bären & Metropol am Postplatz,Poststraße 36,71032,Böblingen",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.683896,
        "longitude" : 9.013488
      }
    },
    {
      "muid" : "5ef85bbb-ae88-cbdd-a289-0fd72d6fd7c9",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:45:00",
      "endDate" : "2016-01-29T21:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/bochum/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "UCI KINOWELT Ruhr Park,Am Einkaufszentrum 22,44791,Bochum",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 51.495639,
        "longitude" : 7.277807
      }
    },
    {
      "muid" : "9022b4e5-18b9-c999-ddbc-12f4cf3edd99",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:45:00",
      "endDate" : "2016-01-29T21:15:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/koeln/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Cinedom,Im Mediapark 1,50670,Köln",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 50.947787,
        "longitude" : 6.94567
      }
    },
    {
      "muid" : "7149d6a5-cbe9-b213-67e1-70d7b762858f",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:47:00",
      "endDate" : "2016-01-29T21:17:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/aschaffenburg/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Kinopolis Aschaffenburg,Goldbacherstraße 25-27,63739,Aschaffenburg",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 49.979143,
        "longitude" : 9.15024
      }
    },
    {
      "muid" : "d75f9edf-3aba-9c2e-64b6-431ae7790d69",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:50:00",
      "endDate" : "2016-01-29T21:20:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/stuttgart/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX Stuttgart An der Liederhalle,Breitscheidstraße 4a,70174,Stuttgart",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 48.779941,
        "longitude" : 9.167858
      }
    },
    {
      "muid" : "cbf6d32b-7ac6-1d8f-02be-4c82b14d01da",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:50:00",
      "endDate" : "2016-01-29T21:20:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/berlin/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX,Potsdamer Straße 5,10785,Berlin",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.508971,
        "longitude" : 13.373409
      }
    },
    {
      "muid" : "014b1a4e-ecef-6366-82a9-c4083cbf9261",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:50:00",
      "endDate" : "2016-01-29T21:20:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/garbsen/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CineStar,Rathausplatz 2,30823,Garbsen",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.426114,
        "longitude" : 9.593648
      }
    },
    {
      "muid" : "b013e7e6-982a-5f36-693a-0fd2fb342890",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T19:50:00",
      "endDate" : "2016-01-29T21:20:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/freiburg-im-breisgau/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "CinemaxX,Bertoldstraße 50,79098,Freiburg im Breisgau",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 47.995727,
        "longitude" : 7.843989
      }
    },
    {
      "muid" : "5bfc811f-c033-9366-d0a2-0abf1169f14a",
      "title" : "James Bond 007 - Spectre",
      "startDate" : "2016-01-29T20:00:00",
      "endDate" : "2016-01-29T21:30:00",
      "image" : "http://assets.cdn.moviepilot.de/assets/store/fill/168/240/56889ce361e97c25f1e8d428af2c222c95df8d37698f97616cde95bf9974/spectre-teaser-poster.jpg",
      "url" : "http://www.moviepilot.de/kino/kinoprogramm/brandenburg-an-der-havel/2016/1/29",
      "description" : "Sein Name ist Bond, James Bond: Daniel Craig kehrt nach Casino Royale, Ein Quantum Trost und Skyfall mit Spectre ein viertes Mal als Agent im Geheimdienst ihrer Majestät in die Kinos zurück. Handlung von James Bond 007 – Spectre James Bond ( Daniel Craig ) wird mit einer kryptischen Nachricht aus seiner eigenen Vergangenheit konfrontiert. Bei der Suche nach der Quelle der Nachricht stößt Bond auf eine düstere Organisation namens Spectre. In der Zwischenzeit muss M ( Ralph Fiennes ) den Secret Service gegenüber der britischen Regierung verteidigen, die überlegt, den MI6-Betrieb einzustellen. Im weiteren Verlauf stößt Bond auf eine Verschwörung verheerenden Ausmaßes. Hintergrund & Infos zu James Bond 007 – Spectre Bereits drei Mal war Daniel Craig ( Verblendung ) für den MI6 im Geheimdienst ihrer Majestät in tödlicher Mission unterwegs: James Bond 007 – Casino Royale , James Bond 007 – Ein Quantum Trost und James Bond 007 – Skyfall . Nun kehrt er als britischer Geheimagent James Bond wieder auf die große Leinwand zurück. Skyfall-Regisseur Sam Mendes ( American Beauty ) hält erneut die inszenatorischen Zügel in der Hand. Für die Kameraführung zeichnet dieses Mal Hoyte Van Hoytema ( Dame König As Spion ) verantwortlich. Der Soundtrack stammt aus der Feder von Thomas Newman ( Road to Perdition ), der schon den musikalischen Unterbau von Skyfall komponierte. Zum Cast gehören neben Daniel Craig als James Bond erneut Ralph Fiennes ( Grand Budapest Hotel ) als M, Naomie Harris ( Pirates of the Caribbean – Fluch der Karibik 2 ) als Eve Moneypenny, Rory Kinnear ( The Imitation Game – Ein streng geheimes Leben ) als Tanner und Ben Whishaw ( Cloud Atlas – Alles ist verbunden ) als Q. Neu dazugestoßen sind Christoph Waltz ( Inglourious Basterds ) als Oberhauser, Andrew Scott ( Sherlock ) als Denbigh und Dave Bautista ( Guardians of the Galaxy ) als Mr. Hinx. Als Bond-Girls fungieren in James Bond 007 – Spectre Léa Seydoux ( Blau ist eine warme Farbe ) als Madeleine Swann und Monica Bellucci ( Shoot ’Em Up ) als Lucia Sciarra. Gerüchten zufolge sollte auch Penélope Cruz ( Vicky Cristina Barcelona ) einem Part im 24. James Bond-Film einnehmen. Als Sony jedoch am 4. Dezember 2014 den offiziellen Titel enthüllte und die Angaben zum Main Cast bekannt gab, tauchte der Name der spanischen Schauspielerin nicht mehr auf. Ende März 2014 erschien ein Teaser Trailer zu Bond 24, der für den angeblichen Titel James Bond 007 – Come and Dive warb. Das Video stellte sich jedoch schnell als Fake Trailer heraus und Sony gab bekannt, dass es sich dabei nicht um offizielles Material handelte. Die Veröffentlichung des Fake Trailers zu Bond 24 war als Marketing-Gag der Sängerin Benedict gedacht, die durch eine Weiterleitung auf ihre Facebook-Seite auf sich aufmerksam machen wollte. (MH)",
      "sources" : [
        {
          "name" : "Moviepilot",
          "url" : "http://moviepilot.de",
          "image" : "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg"
        }
      ],
      "location" : {
        "name" : "Movietown Wust,An der Bundesstraße 1,14776,Brandenburg an der Havel",
        "locality" : null,
        "thoroughfare" : null,
        "country" : null,
        "latitude" : 52.409183,
        "longitude" : 12.608176
      }
    }
  ]
}
```
