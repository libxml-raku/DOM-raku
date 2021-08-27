unit module W3C::DOM:ver<0.0.2>;

enum domNodeType is export(:NodeType) (
   ELEMENT_NODE => 1,
   ATTRIBUTE_NODE => 2,
   TEXT_NODE => 3,
   CDATA_SECTION_NODE => 4,
   ENTITY_REFERENCE_NODE => 5,
   ENTITY_NODE => 6,
   PROCESSING_INSTRUCTION_NODE => 7,
   COMMENT_NODE => 8,
   DOCUMENT_NODE => 9,
   DOCUMENT_TYPE_NODE => 10,
   DOCUMENT_FRAGMENT_NODE => 11,
   NOTATION_NODE => 12,
);

role Node {
    method nodeType {...}
    method nodeName {...}
    method nodeValue {...}
    method parentNode {...}
    method childNodes {...}
    method firstChild {...}
    method lastChild {...}
    method previousSibling {...}
    method nextSibling {...}
    method attributes {...}
    method ownerDocument {...}
    method insertBefore {...}
    method replaceChild {...}
    method removeChild {...}
    method appendChild {...}
    method hasChildNodes {...}
    method cloneNode {...}
    # -- Introduced in DOM Level 2 --
    method normalize {...}
    method isSupported {...}
    method namespaceURI {...}
    method prefix {...}
    method localName {...}
    method hasAttributes {...}
}

role Attr does Node {
    method nodeType { +ATTRIBUTE_NODE }
    method name {...}
    method specified {...}
    method value {...}
    # -- Introduced in DOM Level 2 --
    method ownerElement {...}
}

role CharacterData does Node {
    method data {...}
    method length {...}
    method substringData {...}
    method appendData {...}
    method insertData {...}
    method deleteData {...}
    method replaceData {...}
}

role Comment does CharacterData {
    method nodeType { +COMMENT_NODE }
    method nodeName { '#comment' }
}

role Document does Node {
    method doctype {...}
    method implementation {...}
    method documentElement {...}
    method createElement {...}
    method createDocumentFragment {...}
    method createTextNode {...}
    method createComment {...}
    method createCDATASection {...}
    method createProcessingInstruction {...}
    method createAttribute {...}
    method createEntityReference {...}
    method getElementsByTagName {...}
    # -- Introduced in DOM Level 2 --
    method importNode {...}
    method createElementNS {...}
    method createAttributeNS {...}
    method getElementsByTagNameNS {...}
    method getElementById {...}
}

role DocumentFragment does Node {
    method nodeType { +DOCUMENT_FRAGMENT_NODE }
}

role DocumentType does Node {
    method nodeType { +DOCUMENT_TYPE_NODE }
    method name {...}
    method entities {...}
    method notations {...}
    method publicId {...}
    method systemId {...}
    method internalSubset {...}
}

role Element does Node {
    method nodeType { +ELEMENT_NODE }
    method tagName {...}
    method getAttribute {...}
    method setAttribute {...}
    method removeAttribute {...}
    method getAttributeNode {...}
    method setAttributeNode {...}
    method removeAttributeNode {...}
    method getElementsByTagName {...}
    # -- Introduced in DOM Level 2 --
    method getAttributeNS {...}
    method setAttributeNS {...}
    method removeAttributeNS {...}
    method getAttributeNodeNS {...}
    method setAttributeNodeNS {...}
    method getElementsByTagNameNS {...}
    method hasAttribute {...}
    method hasAttributeNS {...}
}

role Entity does Node {
    method nodeType { +ENTITY_NODE }
    method publicId {...}
    method systemId {...}
    method notationName {...}
}

role EntityReference does Node {
    method nodeType { +ENTITY_REFERENCE_NODE }
}

role Implementation {
    method createDocument($, $?, $?) {...}
    method createDocumentType($, $?, $?) {...}
    method hasFeature {...}
}

role NamedNodeMap {
    method getNamedItem {...}
    method setNamedItem {...}
    method removeNamedItem {...}
    method item {...}
    method length {...}
    # -- Introduced in DOM Level 2 --
    method getNamedItemNS {...}
    method setNamedItemNS {...}
    method removeNamedItemNS {...}
}

role Notation does Node {
    method nodeType { +NOTATION_NODE }
    method publicId {...}
    method systemId {...}
}

role ProcessingInstruction does Node {
    method nodeType { +PROCESSING_INSTRUCTION_NODE }
    method target {...}
    method data {...}
}

role Text does CharacterData {
    method nodeType { +TEXT_NODE }
    method nodeName { '#text' }
    method splitText {...}
}

role CDATASection does Text {
    method nodeType { +CDATA_SECTION_NODE }
    method nodeName { '#cdata-section' }
}
