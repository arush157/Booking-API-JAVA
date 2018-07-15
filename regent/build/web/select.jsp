<%-- 
    Document   : select
    Created on : Jun 14, 2018, 11:18:59 AM
    Author     : shakilur.arush
--%>

<%@page import="java.lang.String"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="mypack.NewClass"%>

<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.w3c.dom.CharacterData"%>
<%@page import="com.sun.org.apache.xerces.internal.parsers.DOMParser"%>
<%@page import="javax.xml.bind.JAXBElement"%>
<%@page import="com.videcom.ObjectFactory"%>
<%@page import="java.io.StringReader"%>

<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.soap.SOAPConstants"%>
<%@page import="javax.xml.soap.SOAPBody"%>
<%@page import="javax.xml.soap.SOAPHeader"%>
<%@page import="javax.xml.soap.SOAPEnvelope"%>
<%@page import="javax.xml.soap.SOAPPart"%>
<%@page import="javax.xml.soap.MessageFactory"%>
<%@page import="javax.xml.ws.soap.SOAPBinding"%>
<%@page import="javax.xml.ws.Service"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.soap.SOAPMessage"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="com.videcom.VrsXmlRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import ="org.w3c.dom.NodeList"%>
<%@page import ="org.w3c.dom.Node"%>
<%@page import ="org.w3c.dom.Element"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            tr:hover {background-color: #f5f5f5;}
            tr:nth-child(even) {background-color: #f2f2f2;}
            th {
                background-color: #4CAF50;
                color: white;
            }
            th, td {
                padding: 15px;
                text-align: left;
            }
            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert your information for booking!</h1>
        <%

            try {
                String[] month = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
                //out.println("fghhty");
                String trip = (String) request.getSession().getAttribute("trip");
                //out.println(trip);
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                InputSource is = new InputSource();

                com.videcom.VrsXmlWebService3 service = new com.videcom.VrsXmlWebService3();
                com.videcom.VrsXmlWebService3Soap port = service.getVrsXmlWebService3Soap();
                VrsXmlRequest vr = new VrsXmlRequest();
                ObjectFactory of = new ObjectFactory();
                
                List<String> book = new ArrayList<String>();

                if (trip.trim().compareTo("r") == 0) {
                    String select = request.getParameter("select");
                    int s = Integer.parseInt(select.trim());
                    out.println(select + ":" + "<br>");
                    List<String> rFlight = (ArrayList<String>) request.getSession().getAttribute("rFlight");
                    List<String> rFlight1 = (ArrayList<String>) request.getSession().getAttribute("rFlight1");

                    List<String> Segment1 = new ArrayList<String>();
                    List<String> Segment2 = new ArrayList<String>();

                    out.println(rFlight.size() + ":" + rFlight1.size());
                    for (int i = 0; i < 12; i++) {
                        out.println(rFlight.get(s * 12 + i) + " : ");
                        out.println(rFlight1.get(s * 12 + i) + "<br>");
                        Segment1.add(rFlight.get(s * 12 + i));
                        Segment2.add(rFlight1.get(s * 12 + i));

                    }

                    String Sairid = Segment1.get(7).trim();
                    String Sfltno = Segment1.get(8).trim();
                    book.add(Sfltno);
                    String Sdep = Segment1.get(0).trim();
                    book.add(Sdep);
                    String Sarr = Segment1.get(4).trim();
                    book.add(Sarr);
                    String Sid = Segment1.get(11).trim();
                    book.add(Sid);
                    String Sdate = Segment1.get(1).trim();
                    String[] parts = Sdate.split("-");
                    String sdate = parts[2] + month[Integer.parseInt(parts[1]) - 1];
                    book.add(sdate);
                    
                    String Rairid = Segment2.get(7).trim();
                    String Rfltno = Segment2.get(8).trim();
                    book.add(Rfltno);
                    String Rdep = Segment2.get(0).trim();
                    book.add(Rdep);
                    String Rarr = Segment2.get(4).trim();
                    book.add(Rarr);
                    String Rid = Segment2.get(11).trim();
                    book.add(Rid);
                    String Rdate = Segment2.get(1).trim();
                    String[] rparts = Rdate.split("-");
                    String rdate = rparts[2] + month[Integer.parseInt(rparts[1]) - 1];
                    book.add(rdate);
                    
                    out.println("-1Arush/ShakilurMR^9E*shakilur.nsu@gmail.com^9M*123456^0" + Sairid + Sfltno + Sid + sdate + Sdep + Sarr + "QQ1^0" + Rairid + Rfltno + Rid + rdate + Rdep + Rarr + "QQ1^FG^FS1^*R~x");

                    vr.setToken("NulFjgDfdI74Tpm0Y6lfqgpcsEDXjX07J3hVE01Qb60=");
                    vr.setCommand("-1Arush/ShakilurMR^9E*shakilur.nsu@gmail.com^9M*123456^0" + Sairid + Sfltno + Sid + sdate + Sdep + Sarr + "QQ1^0" + Rairid + Rfltno + Rid + rdate + Rdep + Rarr + "QQ1^FG^FS1^*R~x");

                    String result = port.runVRSCommand(vr);
                    is.setCharacterStream(new StringReader(result));
                    Document doc = db.parse(is);
                    doc.getDocumentElement().normalize();
                    NodeList nodes = doc.getElementsByTagName("FareStore");
                    List<String> farestore = new ArrayList<String>();
                    for (int i = 0; i < nodes.getLength(); i++) {
                        Node nNode = nodes.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            out.println(eElement.getAttribute("Total") + "<br>");
                            farestore.add(eElement.getAttribute("Total"));
                        }
                    }
                    NodeList nodes1 = doc.getElementsByTagName("SegmentFS");
                    List<String> SegmentFS = new ArrayList<String>();
                    for (int i = 0; i < nodes1.getLength(); i++) {
                        Node nNode = nodes1.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;

                            out.println(eElement.getAttribute("Seg") + "<br>");
                            out.println(eElement.getAttribute("Fare") + "<br>");
                            out.println(eElement.getAttribute("Tax1") + "<br>");
                            out.println(eElement.getAttribute("Tax2") + "<br>");
                            out.println(eElement.getAttribute("Tax3") + "<br>");
                            SegmentFS.add(eElement.getAttribute("Seg"));
                            SegmentFS.add(eElement.getAttribute("Fare"));
                            SegmentFS.add(eElement.getAttribute("Tax1"));
                            SegmentFS.add(eElement.getAttribute("Tax2"));
                            SegmentFS.add(eElement.getAttribute("Tax3"));
                        }
                    }
                } else {
                    List<String> sTrip = (ArrayList<String>) request.getSession().getAttribute("sTrip");

                    String Rairid = sTrip.get(7).trim();
                    String Rfltno = sTrip.get(8).trim();
                    book.add(Rfltno);
                    String Rdep = sTrip.get(0).trim();
                    book.add(Rdep);
                    String Rarr = sTrip.get(4).trim();
                    book.add(Rarr);
                    String Rid = sTrip.get(11).trim();
                    book.add(Rid);
                    String Rdate = sTrip.get(1).trim();
                    String[] rparts = Rdate.split("-");
                    String rdate = rparts[2] + month[Integer.parseInt(rparts[1]) - 1];
                    book.add(rdate);
                    vr.setToken("NulFjgDfdI74Tpm0Y6lfqgpcsEDXjX07J3hVE01Qb60=");
                    vr.setCommand("-1Arush/ShakilurMR^9E*shakilur.nsu@gmail.com^9M*123456^0" + Rairid + Rfltno + Rid + rdate + Rdep + Rarr + "QQ1^FG^FS1^*R~x");

                    String result = port.runVRSCommand(vr);
                    is.setCharacterStream(new StringReader(result));
                    Document doc = db.parse(is);
                    doc.getDocumentElement().normalize();
                    NodeList nodes = doc.getElementsByTagName("FareStore");
                    List<String> farestore = new ArrayList<String>();
                    for (int i = 0; i < nodes.getLength(); i++) {
                        Node nNode = nodes.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            out.println(eElement.getAttribute("Total") + "<br>");
                            farestore.add(eElement.getAttribute("Total"));
                        }
                    }
                    NodeList nodes1 = doc.getElementsByTagName("SegmentFS");
                    List<String> SegmentFS = new ArrayList<String>();
                    for (int i = 0; i < nodes1.getLength(); i++) {
                        Node nNode = nodes1.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;

                            out.println(eElement.getAttribute("Seg") + "<br>");
                            out.println(eElement.getAttribute("Fare") + "<br>");
                            out.println(eElement.getAttribute("Tax1") + "<br>");
                            out.println(eElement.getAttribute("Tax2") + "<br>");
                            out.println(eElement.getAttribute("Tax3") + "<br>");
                            SegmentFS.add(eElement.getAttribute("Seg"));
                            SegmentFS.add(eElement.getAttribute("Fare"));
                            SegmentFS.add(eElement.getAttribute("Tax1"));
                            SegmentFS.add(eElement.getAttribute("Tax2"));
                            SegmentFS.add(eElement.getAttribute("Tax3"));
                        }
                    }
                }
                session.setAttribute("book", book);
        %>
        <div align = "center">
            <table>
                <form method="POST" action="booking.jsp" >
                    <tr>
                        <th>Description</th>
                        <th>Insert</th>
                    </tr>
                    <tr>
                        <td>Title</td>
                        <td>
                            <select name="title">
                                <option value="mr">MR</option>
                                <option value="mrs">MRS</option>
                                <option value="ms">MS</option>
                                <option value="mstr">MSTR</option>
                                <option value="miss">MISS</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td>
                            <input type="text" name="lname">
                        </td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td>
                            <input type="text" name="fname">
                        </td>
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td>
                            <select name="year">
                                <% for (int i = 2010; i >= 1950; i--) {%>
                                <option value="<%out.println(i);%>"><%out.println(i);%></option> <%}%>
                            </select>
                            <select name="month">
                                <% for (int i = 1; i <= 12; i++) {%>
                                <option value="<%out.println(i);%>"><%out.println(i);%></option> <%}%>
                            </select>
                            <select name="day">
                                <% for (int i = 1; i <= 31; i++) {%>
                                <option value="<%out.println(i);%>"><%out.println(i);%></option> <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td>
                            <select name="contry">
                                <option value="bd">Bangladesh(+88)</option>
                                <option value="ind">India(+91)</option>
                                <option value="sri">Srilanka(+94)</option>
                                <option value="usa">USA(+1)</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone</td>
                        <td>
                            <input type="text" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <input type="email" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="submit" value="Book Now">
                        </td>
                    </tr>
                </form>
            </table>
        </div>
        <%
            } catch (Exception E) {
                E.printStackTrace();
                out.println(E);
            }

        %>
    </body>
</html>
