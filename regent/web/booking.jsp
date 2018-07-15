<%-- 
    Document   : booking
    Created on : Jul 1, 2018, 9:19:52 AM
    Author     : shakilur.arush
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.videcom.VrsXmlRequest"%>
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
        <title>JSP Page</title>
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
            #demo{
                display: none;
            }

        </style>
    </head>
    <body>
        <h1>Congratulations! Booking has completed</h1>
        <%
            String[] month = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
            String title = request.getParameter("title");
            String lname = request.getParameter("lname");
            String fname = request.getParameter("fname");
            String year = request.getParameter("year");
            String month1 = request.getParameter("month");
            String day = request.getParameter("day");
            String con = request.getParameter("contry");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String all = "";

            String dob = day + " " + month[Integer.parseInt(month1.trim()) - 1] + " " + year;
            try {
                com.videcom.VrsXmlWebService3 service = new com.videcom.VrsXmlWebService3();
                com.videcom.VrsXmlWebService3Soap port = service.getVrsXmlWebService3Soap();
                com.videcom.VrsXmlRequest req = new VrsXmlRequest();
                req.setToken("NulFjgDfdI74Tpm0Y6lfqgpcsEDXjX07J3hVE01Qb60=");

                List<String> book = (ArrayList<String>) request.getSession().getAttribute("book");
                if (book.size() == 5) {
                    all = "RX"+book.get(0) + book.get(3) + book.get(4) + book.get(1) + book.get(2);
                    //out.println(all+"<br>");
                    String command = "-1" + lname + "/" + fname + title + "^9E*" + email + "^9M*" + phone + "^0" + all + "NN1^FG^FS1^e*R^MI^EZT*R^EZRE^*R~x";
                    command = command.trim();
                    //out.println(command+"<br>");
                    req.setCommand(command);
                    String result = port.runVRSCommand(req);
                    //out.println("<br>"+result.replaceAll("<", "&lt;"));
                    
                    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db = dbf.newDocumentBuilder();
                    InputSource is = new InputSource();
                    is.setCharacterStream(new StringReader(result));

                    Document doc = db.parse(is);
                    NodeList nList = doc.getElementsByTagName("Itin");
                    NodeList nList1 = doc.getElementsByTagName("TKT");
                    NodeList nList2 = doc.getElementsByTagName("PNR");
                    
                    List<String> sLine = new ArrayList<String>();
                    for(int i=0;i<nList.getLength();i++)
                    {
                        Node nNode = nList.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;

                            //out.println(eElement.getAttribute("FltNo"));
                            sLine.add(eElement.getAttribute("FltNo"));
                            //out.println(eElement.getAttribute("Class"));
                            sLine.add(eElement.getAttribute("Class"));
                            //out.println(eElement.getAttribute("Cabin"));
                            sLine.add(eElement.getAttribute("Cabin"));
                            //out.println(eElement.getAttribute("Depart"));
                            sLine.add(eElement.getAttribute("Depart"));
                            //out.println(eElement.getAttribute("DepDate"));
                            sLine.add(eElement.getAttribute("DepDate"));
                            //out.println(eElement.getAttribute("DepTime"));
                            sLine.add(eElement.getAttribute("DepTime"));
                            //out.println(eElement.getAttribute("Arrive"));
                            sLine.add(eElement.getAttribute("Arrive"));
                            //out.println(eElement.getAttribute("ArrTime"));
                            sLine.add(eElement.getAttribute("ArrTime"));
                            //out.println(eElement.getAttribute("TktNo"));
                            
                            
                        }
                        
                    }
                    for(int i=0;i<nList1.getLength();i++)
                    {
                        Node nNode = nList1.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            
                            
                            //out.println(eElement.getAttribute("TktNo"));
                            sLine.add(eElement.getAttribute("TktNo"));
                            //out.println(eElement.getAttribute("Title"));
                            sLine.add(eElement.getAttribute("Title"));
                            //out.println(eElement.getAttribute("Firstname"));
                            sLine.add(eElement.getAttribute("Firstname"));
                            //out.println(eElement.getAttribute("Surname"));
                            sLine.add(eElement.getAttribute("Surname"));
                            
                        }
                    }
                    for(int i=0;i<nList2.getLength();i++)
                    {
                        Node nNode = nList2.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            
                            //out.println(eElement.getAttribute("RLOC"));
                            sLine.add(eElement.getAttribute("RLOC"));
                            
                        }
                    }
                    out.println("<div align='Center'>");
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>FlightNo</th>");
                    out.println("<th>Class</th>");
                    out.println("<th>Cabin</th>");
                    out.println("<th>From</th>");
                    out.println("<th>DDate</th>");
                    out.println("<th>DTime</th>");
                    out.println("<th>To</th>");
                    out.println("<th>ATime</th>");
                    out.println("<th>Ticket No</th>");
                    out.println("<th>Title</th>");
                    out.println("<th>First Name</th>");
                    out.println("<th>Surname</th>");
                    out.println("<th>PNR</th>");
                    out.println("</tr><tr>");
                    out.println("<td>"+sLine.get(0)+"</td>");
                    out.println("<td>"+sLine.get(1)+"</td>");
                    out.println("<td>"+sLine.get(2)+"</td>");
                    out.println("<td>"+sLine.get(3)+"</td>");
                    out.println("<td>"+sLine.get(4)+"</td>");
                    out.println("<td>"+sLine.get(5)+"</td>");
                    out.println("<td>"+sLine.get(6)+"</td>");
                    out.println("<td>"+sLine.get(7)+"</td>");
                    out.println("<td>"+sLine.get(8)+"</td>");
                    out.println("<td>"+sLine.get(9)+"</td>");
                    out.println("<td>"+sLine.get(10)+"</td>");
                    out.println("<td>"+sLine.get(11)+"</td>");
                    out.println("<td>"+sLine.get(12)+"</td>");
                    //out.println("<td>"+sLine.get(13)+"</td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("</div>");

                } else {
                    String all1,all2;
                    all1 = "RX"+book.get(0) + book.get(3) + book.get(4) + book.get(1) + book.get(2);
                    all2 = "RX"+book.get(5) + book.get(8) + book.get(9) + book.get(6) + book.get(7);
                    String command =  "-1" + lname + "/" + fname + title + "^9E*" + email + "^9M*" + phone + "^0" + all1+"NN1^0"+all2 + "NN1^FG^FS1^e*R^MI^EZT*R^EZRE^*R~x";
                    //out.println(all1+"<br>");
                    //out.println(all2+"<br>");
                    //out.println(command+"<br>");
                    req.setCommand(command);
                    String result = port.runVRSCommand(req);
                    //out.println("<br>"+result.replaceAll("<", "&lt;"));
                    
                    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db = dbf.newDocumentBuilder();
                    InputSource is = new InputSource();
                    is.setCharacterStream(new StringReader(result));

                    Document doc = db.parse(is);
                    NodeList nList = doc.getElementsByTagName("Itin");
                    NodeList nList1 = doc.getElementsByTagName("TKT");
                    NodeList nList2 = doc.getElementsByTagName("PNR");
                    
                    List<String> sLine = new ArrayList<String>();
                    for(int i=0;i<nList.getLength();i++)
                    {
                        Node nNode = nList.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;

                            //out.println(eElement.getAttribute("FltNo"));
                            sLine.add(eElement.getAttribute("FltNo"));
                            //out.println(eElement.getAttribute("Class"));
                            sLine.add(eElement.getAttribute("Class"));
                            //out.println(eElement.getAttribute("Cabin"));
                            sLine.add(eElement.getAttribute("Cabin"));
                            //out.println(eElement.getAttribute("Depart"));
                            sLine.add(eElement.getAttribute("Depart"));
                            //out.println(eElement.getAttribute("DepDate"));
                            sLine.add(eElement.getAttribute("DepDate"));
                            //out.println(eElement.getAttribute("DepTime"));
                            sLine.add(eElement.getAttribute("DepTime"));
                            //out.println(eElement.getAttribute("Arrive"));
                            sLine.add(eElement.getAttribute("Arrive"));
                            //out.println(eElement.getAttribute("ArrTime"));
                            sLine.add(eElement.getAttribute("ArrTime"));
                            //out.println(eElement.getAttribute("TktNo"));
                            
                            
                        }
                        
                    }
                    for(int i=0;i<nList1.getLength();i++)
                    {
                        Node nNode = nList1.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            
                            
                            //out.println(eElement.getAttribute("TktNo"));
                            sLine.add(eElement.getAttribute("TktNo"));
                            //out.println(eElement.getAttribute("Title"));
                            sLine.add(eElement.getAttribute("Title"));
                            //out.println(eElement.getAttribute("Firstname"));
                            sLine.add(eElement.getAttribute("Firstname"));
                            //out.println(eElement.getAttribute("Surname"));
                            sLine.add(eElement.getAttribute("Surname"));
                            
                        }
                    }
                    for(int i=0;i<nList2.getLength();i++)
                    {
                        Node nNode = nList2.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;
                            
                            //out.println(eElement.getAttribute("RLOC"));
                            sLine.add(eElement.getAttribute("RLOC"));
                            
                        }
                    }
                    out.println("<div align='Center'>");
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>FlightNo</th>");
                    out.println("<th>Class</th>");
                    out.println("<th>Cabin</th>");
                    out.println("<th>From</th>");
                    out.println("<th>DDate</th>");
                    out.println("<th>DTime</th>");
                    out.println("<th>To</th>");
                    out.println("<th>ATime</th>");
                    out.println("<th>Ticket No</th>");
                    out.println("<th>Title</th>");
                    out.println("<th>First Name</th>");
                    out.println("<th>Surname</th>");
                    out.println("<th>PNR</th>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>"+sLine.get(0)+"</td>");
                    out.println("<td>"+sLine.get(1)+"</td>");
                    out.println("<td>"+sLine.get(2)+"</td>");
                    out.println("<td>"+sLine.get(3)+"</td>");
                    out.println("<td>"+sLine.get(4)+"</td>");
                    out.println("<td>"+sLine.get(5)+"</td>");
                    out.println("<td>"+sLine.get(6)+"</td>");
                    out.println("<td>"+sLine.get(7)+"</td>");
                    out.println("<td>"+sLine.get(16)+"</td>");
                    out.println("<td>"+sLine.get(17)+"</td>");
                    out.println("<td>"+sLine.get(18)+"</td>");
                    out.println("<td>"+sLine.get(19)+"</td>");
                    out.println("<td>"+sLine.get(24)+"</td>");
                    //out.println("<td>"+sLine.get(27)+"</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td>"+sLine.get(8)+"</td>");
                    out.println("<td>"+sLine.get(9)+"</td>");
                    out.println("<td>"+sLine.get(10)+"</td>");
                    out.println("<td>"+sLine.get(11)+"</td>");
                    out.println("<td>"+sLine.get(12)+"</td>");
                    out.println("<td>"+sLine.get(13)+"</td>");
                    out.println("<td>"+sLine.get(14)+"</td>");
                    out.println("<td>"+sLine.get(15)+"</td>");
                    out.println("<td>"+sLine.get(20)+"</td>");
                    out.println("<td>"+sLine.get(21)+"</td>");
                    out.println("<td>"+sLine.get(22)+"</td>");
                    out.println("<td>"+sLine.get(23)+"</td>");
                    out.println("<td>"+sLine.get(24)+"</td>");
                    //out.println("<td>"+sLine.get(27)+"</td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("</div>");
                }
                

            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
