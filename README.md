Raku DOM
---

Synopsis
----
```raku
use DOM;
module MyDOM {
    class Document does DOM::Document {
        method createDocument($URI, $qname, $doctype) {
           ...
        }
    }
    class Element does DOM::Element {
        method getAttribute($name) {
           ...
        }
    }
    # ...
}
```

Abstract interface roles for the [W3C Level 2 Core DOM](https://www.w3.org/TR/2000/REC-DOM-Level-2-Core-20001113/core.html)
