use Test;

unit class W3C::DOM::Test;
use W3C::DOM;
our sub document-basic(W3C::DOM::Implementation $impl) {
    plan 1;

    my $htmlPublic = "-//W3C//DTD XHTML 1.0 Transitional//EN";
    my $htmlSystem = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";

    my W3C::DOM::DocumentType:D $dtd = $impl.createDocumentType('xhtml', $htmlPublic, $htmlSystem);
    my W3C::DOM::Document:D $doc = $impl.createDocument('http://blah.org', 'html', $dtd);
    my W3C::DOM::Element:D $root = $doc.documentElement;
    is $root.nodeName, 'html';
}
