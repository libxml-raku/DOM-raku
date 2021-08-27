use Test;

unit module W3C::DOM::Test;
use W3C::DOM;

our sub document-basic(W3C::DOM::Implementation $impl) {
    my $htmlPublic = "-//W3C//DTD XHTML 1.0 Transitional//EN";
    my $htmlSystem = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";
    plan 2;

    subtest 'create document', {
        plan 5;
        my $doc = $impl.createDocument('http://blah.org', 'html');
        does-ok $doc, W3C::DOM::Document;
        is $doc.nodeName, '#document';
        my $root = $doc.documentElement;
        does-ok $root,  W3C::DOM::Element;
        is $root.nodeName, 'html';
        is $root.ownerDocument.documentElement.nodeName, $root.nodeName;
    }

    subtest 'create document type', {
        plan 1;
        my W3C::DOM::DocumentType:D $dtd = $impl.createDocumentType('xhtml', $htmlPublic, $htmlSystem);
        my W3C::DOM::Document:D $doc = $impl.createDocument('http://blah.org', 'html', $dtd);
        pass;
    }
}

our sub element-basic(W3C::DOM::Implementation $impl) {
    my W3C::DOM::Document:D $doc = $impl.createDocument(Str, 'doc');
    my W3C::DOM::Element:D $root = $doc.documentElement;
    is +$root.nodeType, 1, 'nodeType';
    is $root.tagName, 'doc';
}

our sub text-nodes(W3C::DOM::Implementation $impl) {
    my W3C::DOM::Document:D $doc = $impl.createDocument(Str, 'doc');
    my W3C::DOM::Element:D $root = $doc.documentElement;
    my W3C::DOM::Text:D $text = $doc.createTextNode('test text node');
    is $text.nodeValue, 'test text node', 'nodevalue';
    is +$text.nodeType, 3, 'nodeType';
    $root.appendChild($text);
    is $root.Str, '<doc>test text node</doc>';
    $text .= splitText(5);
    is $text.nodeValue, 'text node';
    is $root.firstChild.nodeValue, 'test ';
    is $root.lastChild.nodeValue, 'text node';
}

our sub elements(W3C::DOM::Implementation $impl) {
    my $doc = $impl.parseFromString: q:to<END>;
    <doc>xxx<elem/></doc>
    END
    does-ok $doc, W3C::DOM::Document;
    my $root = $doc.documentElement;
    does-ok $root, W3C::DOM::Element;
    does-ok $root.firstChild, W3C::DOM::Text;
    does-ok $root.lastChild, W3C::DOM::Element;
    is-deeply $root.nodeValue, Str, 'nodeValue()';
}

our @tests = :&document-basic, :&element-basic, :&text-nodes, :&elements;

our sub run-tests(W3C::DOM::Implementation $impl) is hidden-from-backtrace {
    plan +@tests;
    for @tests {
        my $name = .key;
        my &test = .value;
        subtest $name, { &test($impl) };
    }
}
