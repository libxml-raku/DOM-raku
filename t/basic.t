use DOM;
use Test;

plan 3;

class DtdMost {
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

