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

# LibXML implements 
use LibXML;
my DOM::Document $snack = make-dom-sandwhich(LibXML);
```

This module contains informal interface roles for [W3C Level 2 Core DOM](https://www.w3.org/TR/2000/REC-DOM-Level-2-Core-20001113/core.html).
It is [used by LibXML](https://libxml-raku.github.io/LibXML-raku/DOM) to assert basic coverage of the required DOM objects and methods.

Roles/methods in this module

DOM Role | DOM Parent | L1 Methods | L2 Methods 
-----------|--------|---------------|------------
DOM::Node |  | nodeName nodeValue parentNode childNodes firstChild lastChild previousSibling nextSibling ownerDocument insertBefore replaceChild removeChild appendChild hasChildNodes cloneNode | normalize isSupported namespaceURI prefix localName hasAttributes |
DOM::CharacterData | DOM::Node | data length substringData appendData insertData deleteData replaceData
DOM::Attr | DOM::Node | name value specified| ownerElement
DOM::CDATASection | DOM::Text |
DOM::Comment | DOM::CharacterData |
DOM::Document | DOM::Node |  doctype implementation documentElement createElement createDocumentFragment createTextNode createComment createCDATASection createProcessingInstruction createAttribute createEntityReference getElementsByTagName | importNode createElementNS createAttributeNS getElementsByTagNameNS getElementById
DOM::DocumentFragment | DOM::Node |
DOM::DocumentType | DOM::Node | name publicId systemId entities notations
DOM::Element | DOM::Node | attributes getAttribute setAttribute removeAttribute getAttributeNode setAttributeNode removeAttributeNode getElementsByTagName | getAttributeNS setAttributeNS removeAttributeNS getAttributeNodeNS setAttributeNodeNS removeAttributeNodeNS getElementsByTagNameNS hasAttribute hasAttributeNS
DOM::Entity | DOM::Node | publicId systemId notationName
DOM::EntityReference | DOM::Node
DOM::Implementation |  | createDocument createDocumentType hasFeature
DOM::NamedNodeMap |  | getNamedItem setNamedItem removeNamedItem item length | getNamedItemNS setNamedItemNS removeNamedItemNS
DOM::Notation | DOM::Node | publicId systemId
DOM::ProcessingInstruction | DOM::Node | target data
DOM::Text | DOM::CharacterData |  splitText

See Also
-----

[LibXML](https://libxml-raku.github.io/LibXML-raku/) which [consumes these roles](https://libxml-raku.github.io/LibXML-raku/DOM) 

