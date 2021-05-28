W3C::DOM
---

Synopsis
----

```raku
use W3C::DOM;
sub make-dom-sandwhich(W3C::DOM::Implementation $impl) {
    my W3C::DOM::Document:D $doc = $impl.createDocument(Str, 'sandwhich', W3C::DOM::DocumentType);
    given $doc.documentElement {
        for <bread butter pickles butter bread> -> $ingredient {
            .appendChild: $doc.createElement($ingredient);
        }
    }
    return $doc;
}

# LibXML implements 
use LibXML;
my W3C::DOM::Document $snack = make-dom-sandwhich(LibXML);
```

This module contains informal interface roles for [W3C Level 2 Core DOM](https://www.w3.org/TR/2000/REC-DOM-Level-2-Core-20001113/core.html).
It is [used by LibXML](https://libxml-raku.github.io/LibXML-raku/DOM) to assert basic coverage of the required DOM objects and methods.

Roles/methods in this module

DOM Role | DOM Parent | L1 Methods | L2 Methods 
-----------|--------|---------------|------------
W3C::DOM::Node |  | nodeName nodeValue parentNode childNodes firstChild lastChild previousSibling nextSibling ownerDocument insertBefore replaceChild removeChild appendChild hasChildNodes cloneNode | normalize isSupported namespaceURI prefix localName hasAttributes |
W3C::DOM::CharacterData | W3C::DOM::Node | data length substringData appendData insertData deleteData replaceData
W3C::DOM::Attr | W3C::DOM::Node | name value specified| ownerElement
W3C::DOM::CDATASection | W3C::DOM::Text |
W3C::DOM::Comment | W3C::DOM::CharacterData |
W3C::DOM::Document | W3C::DOM::Node |  doctype implementation documentElement createElement createDocumentFragment createTextNode createComment createCDATASection createProcessingInstruction createAttribute createEntityReference getElementsByTagName | importNode createElementNS createAttributeNS getElementsByTagNameNS getElementById
W3C::DOM::DocumentFragment | W3C::DOM::Node |
W3C::DOM::DocumentType | W3C::DOM::Node | name publicId systemId entities notations
W3C::DOM::Element | W3C::DOM::Node | attributes getAttribute setAttribute removeAttribute getAttributeNode setAttributeNode removeAttributeNode getElementsByTagName | getAttributeNS setAttributeNS removeAttributeNS getAttributeNodeNS setAttributeNodeNS getElementsByTagNameNS hasAttribute hasAttributeNS
W3C::DOM::Entity | W3C::DOM::Node | publicId systemId notationName
W3C::DOM::EntityReference | W3C::DOM::Node
W3C::DOM::Implementation |  | createDocument createDocumentType hasFeature
W3C::DOM::NamedNodeMap |  | getNamedItem setNamedItem removeNamedItem item length | getNamedItemNS setNamedItemNS removeNamedItemNS
W3C::DOM::Notation | W3C::DOM::Node | publicId systemId
W3C::DOM::ProcessingInstruction | W3C::DOM::Node | target data
W3C::DOM::Text | W3C::DOM::CharacterData |  splitText

See Also
-----

[LibXML](https://libxml-raku.github.io/LibXML-raku/) which [consumes these roles](https://libxml-raku.github.io/LibXML-raku/DOM) 

