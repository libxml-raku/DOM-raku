use DOM;
use Test;

plan 3;

class Node {
    method nodeName {...}
    method nodeValue {...}
    method parentNode {...}
    method childNodes {...}
    method firstChild {...}
    method lastChild {...}
    method previousSibling {...}
    method nextSibling {...}
    method hasAttributes {...}
    method attributes {...}
    method ownerDocument {...}
    method insertBefore {...}
    method replaceChild {...}
    method removeChild {...}
    method appendChild {...}
    method hasChildNodes {...}
    method cloneNode {...}
    method normalize {...}
    method isSupported {...}
    method namespaceURI {...}
    method prefix {...}
    method localName {...}
}
class DtdMost is Node {
    method name {...}
    method entities {...}
    method notations {...}
    method publicId {...}
    method systemId {...}
}

class DtdAll is DtdMost {
    method internalSubset {...}
}

class Dtd is DtdAll does DOM::DocumentType {
}

dies-ok {(DtdMost but DOM::DocumentType).new};
lives-ok {(DtdAll but DOM::DocumentType).new};
lives-ok {Dtd.new};

