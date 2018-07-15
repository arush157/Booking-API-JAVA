
package com.videcom;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.videcom package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _MsgStr_QNAME = new QName("http://videcom.com/", "msgStr");
    private final static QName _Msg_QNAME = new QName("http://videcom.com/", "msg");
    private final static QName _RunVRSCommandXmlResult_QNAME = new QName("http://videcom.com/", "RunVRSCommandXmlResult");
    private final static QName _RunVRSCommandResult_QNAME = new QName("http://videcom.com/", "RunVRSCommandResult");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.videcom
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link VrsXmlRequest }
     * 
     */
    public VrsXmlRequest createVrsXmlRequest() {
        return new VrsXmlRequest();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://videcom.com/", name = "msgStr")
    public JAXBElement<String> createMsgStr(String value) {
        return new JAXBElement<String>(_MsgStr_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link VrsXmlRequest }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://videcom.com/", name = "msg")
    public JAXBElement<VrsXmlRequest> createMsg(VrsXmlRequest value) {
        return new JAXBElement<VrsXmlRequest>(_Msg_QNAME, VrsXmlRequest.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://videcom.com/", name = "RunVRSCommandXmlResult")
    public JAXBElement<String> createRunVRSCommandXmlResult(String value) {
        return new JAXBElement<String>(_RunVRSCommandXmlResult_QNAME, String.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://videcom.com/", name = "RunVRSCommandResult")
    public JAXBElement<String> createRunVRSCommandResult(String value) {
        return new JAXBElement<String>(_RunVRSCommandResult_QNAME, String.class, null, value);
    }

}
