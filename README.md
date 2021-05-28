Raku DOM
---

Synopsis
----

```raku
use DOM;
sub make-dom-sandwhich(DOM::Implementation $impl) {
    my DOM::Document:D $doc = $impl.createDocument(Str, 'sandwhich', DOM::DocumentType);
    given $doc.documentElement {
        for <bread butter pickles butter bread> -> $ingredient {
            .appendChild: $doc.createElement($ingredient);
        }
    }
    return $doc;
}

# feeling peckish .. have LibXML handy
use LibXML;
my DOM::Document $snack = make-dom-sandwhich(LibXML);
```

This module contains informal interface roles for [W3C Level 2 Core DOM](https://www.w3.org/TR/2000/REC-DOM-Level-2-Core-20001113/core.html).

A module may compose classes against the roles in the DOM module to assert basic coverage of DOM objects and methods.

```raku


