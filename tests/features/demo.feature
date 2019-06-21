
Feature: zato-apitest demonstration

Scenario: *** REST JSON Demo ***

    Given address "http://apitest-demo.zato.io"
    Given URL path "/demo/json3"
    Given query string "?demo=1"
    Given format "JSON"
    Given header "X-Custom-Header" "MyValue"
    Given request is "{}"
    Given JSON Pointer "/a" in request is "abc"
    Given JSON Pointer "/foo" in request is an integer "7"
    Given JSON Pointer "/bar" in request is a list "1,2,3,4,5"
    Given JSON Pointer "/baz" in request is a random string
    Given JSON Pointer "/hi5" in request is one of "a,b,c,d,e"

    When the URL is invoked

    Then JSON Pointer "/action/msg" is "Now, is that cool or is that cool?"
    And JSON Pointer "/action/code" is an integer "0"
    And JSON Pointer "/action/flow" is a list "Ack,Done"
    And status is "200"
    And header "Connection" is "keep-alive"
    And header "Server" isn't empty

    # You can also compare responses directly inline ..
    And JSON response is equal to "{"action":{"code":0, "msg":"Now, is that cool or is that cool?", "flow":["Ack", "Done"]}}"

    # .. or read them from disk.
    And response is equal to that from "demo.json"

Scenario: *** XML/SOAP Demo ***

    Given address "http://apitest-demo.zato.io"
    Given URL path "/demo/xml"
    Given query string "?demo=1"
    Given SOAP action "demo:xml"
    Given format "XML"
    Given namespace prefix "demo" of "http://example.com/demo"
    Given request "demo.xml"
    Given XPath "//howdy" in request is "partner"
    Given XPath "//hello" in request is a random string
    Given XPath "//world" in request is a random integer
    Given XPath "//and-beyond" in request is one of "Arcturus, Ανδρομέδα, ほうおう座"

    When the URL is invoked

    Then XPath "//demo:action/demo:code" is an integer "0"
    And XPath "//demo:action/demo:msg" is "Now, is that cool or is that cool?"
