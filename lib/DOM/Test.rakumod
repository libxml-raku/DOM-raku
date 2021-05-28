use Test;

unit class DOM::Test;
use DOM;
our sub document-basic(DOM::Implementation $impl) {
    plan 1;

    my $htmlPublic = "-//W3C//DTD XHTML 1.0 Transitional//EN";
    my $htmlSystem = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd";

    my DOM::DocumentType:D $dtd = $impl.createDocumentType('xhtml', $htmlPublic, $htmlSystem);
    my DOM::Document:D $doc = $impl.createDocument('http://blah.org', 'html', $dtd);
    my DOM::Element:D $root = $doc.documentElement;
    is $root.nodeName, 'html';
}
