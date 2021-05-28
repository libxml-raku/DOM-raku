unit module DOM;

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
}

role DocumentType does Node {
    method name {...}
    method entities {...}
    method notations {...}
    method publicId {...}
    method systemId {...}
    method internalSubset {...}
}

role Element does Node {
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
    method removeAttributeNodeNS {...}
    method getElementsByTagNameNS {...}
    method hasAttribute {...}
    method hasAttributeNS {...}
}

role Entity does Node {
    method publicId {...}
    method systemId {...}
    method notationName {...}
}

role EntityReference does Node {
}

role Implementation {
    method createDocument {...}
    method createDocumentType {...}
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
    method publicId {...}
    method systemID {...}
}

role ProcessingInstruction does Node {
    method target {...}
    method data {...}
}

role Text does CharacterData {
    method splitText {...}
}

role CDATASection does Text {
}
