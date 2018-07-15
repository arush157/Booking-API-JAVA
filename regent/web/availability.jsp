

<%@page import="mypack.NewClass"%>
<%@page import="org.xml.sax.InputSource"%>
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


<%@page import="org.w3c.dom.Document"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Availability</title>
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
    </head>
    <body>
        <h1>Search Result</h1>
        <%! public String Fvalue = "";%>
        <%
            String[] month = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String date = request.getParameter("date");
            String rdate = request.getParameter("rdate");
            String adult = request.getParameter("adult");
            String child = request.getParameter("child");
            String infant = request.getParameter("infant");
            String cls = request.getParameter("class");
            String trip = request.getParameter("trip");
            trip = trip.trim();
            session.setAttribute("trip", trip);
            session.setAttribute("from", from);
            session.setAttribute("to", to);

            String[] parts = date.split("-");

            String[] rparts = rdate.split("-");

            String ndate = parts[2] + month[Integer.parseInt(parts[1]) - 1] + parts[0];
            String sdate = parts[2] + month[Integer.parseInt(parts[1]) - 1];

            String rndate = rparts[2] + month[Integer.parseInt(rparts[1]) - 1] + rparts[0];
            String rsdate = rparts[2] + month[Integer.parseInt(rparts[1]) - 1];

            session.setAttribute("sdate", sdate);
            String command = "A" + parts[2] + month[Integer.parseInt(parts[1]) - 1] + from + to;
            String comReturn = "A" + rparts[2] + month[Integer.parseInt(rparts[1]) - 1] + to + from;
            //out.println(command);


        %>


        <%            try {
                com.videcom.VrsXmlWebService3 service = new com.videcom.VrsXmlWebService3();
                com.videcom.VrsXmlWebService3Soap port = service.getVrsXmlWebService3Soap();
                VrsXmlRequest vr = new VrsXmlRequest();

                ObjectFactory of = new ObjectFactory();

                String command1, command2;

                command1 = command + "[SalesCity=" + from + ",VARS=True,ClassBands=True,StartCity=" + from + ",SingleSeg=" + trip + ",FGNoAv=True,qtyseats=1]";
                vr.setToken("NulFjgDfdI74Tpm0Y6lfqgpcsEDXjX07J3hVE01Qb60=");
                vr.setCommand(command1);
                String result = port.runVRSCommand(vr);

                //out.println(result.replaceAll("<", "&lt;"));
                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                InputSource is = new InputSource();
                is.setCharacterStream(new StringReader(result));
                Document doc = db.parse(is);
                doc.getDocumentElement().normalize();
                NodeList nList = doc.getElementsByTagName("itin");
                int nlen = nList.getLength();
                //out.println(command1);
                List<String> sLine = new ArrayList<String>();
                List<String> sDep = new ArrayList<String>();
                List<String> sArr = new ArrayList<String>();

                List<String> sDdaygmt = new ArrayList<String>();
                List<String> sDtimlcl = new ArrayList<String>();
                List<String> sDuration = new ArrayList<String>();
                List<String> sAdaygmt = new ArrayList<String>();
                List<String> sAtimlcl = new ArrayList<String>();
                List<String> sAirid = new ArrayList<String>();
                List<String> sFltno = new ArrayList<String>();
                List<String> sEqp = new ArrayList<String>();
                List<String> sStp = new ArrayList<String>();
                List<String> sFac = new ArrayList<String>();

                List<String> sCb = new ArrayList<String>();
                List<String> sId = new ArrayList<String>();
                List<String> sAv = new ArrayList<String>();
                List<String> sCur = new ArrayList<String>();
                List<String> sCurInf = new ArrayList<String>();
                List<String> sPri = new ArrayList<String>();
                List<String> sTax = new ArrayList<String>();
                List<String> sFav = new ArrayList<String>();
                List<String> sAwards = new ArrayList<String>();
                List<String> sFid = new ArrayList<String>();

                List<String> rLine = new ArrayList<String>();
                List<String> rDep = new ArrayList<String>();
                List<String> rArr = new ArrayList<String>();

                List<String> rDdaygmt = new ArrayList<String>();
                List<String> rDtimlcl = new ArrayList<String>();
                List<String> rDuration = new ArrayList<String>();
                List<String> rAdaygmt = new ArrayList<String>();
                List<String> rAtimlcl = new ArrayList<String>();
                List<String> rAirid = new ArrayList<String>();
                List<String> rFltno = new ArrayList<String>();
                List<String> rEqp = new ArrayList<String>();
                List<String> rStp = new ArrayList<String>();
                List<String> rFac = new ArrayList<String>();

                List<String> rCb = new ArrayList<String>();
                List<String> rId = new ArrayList<String>();
                List<String> rAv = new ArrayList<String>();
                List<String> rCur = new ArrayList<String>();
                List<String> rCurInf = new ArrayList<String>();
                List<String> rPri = new ArrayList<String>();
                List<String> rTax = new ArrayList<String>();
                List<String> rFav = new ArrayList<String>();
                List<String> rAwards = new ArrayList<String>();
                List<String> rFid = new ArrayList<String>();

                for (int i = 0; i < nList.getLength(); i++) {
                    Node nNode = nList.item(i);

                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;

                        //out.println(eElement.getAttribute("line"));
                        sLine.add(eElement.getAttribute("line"));
                        //out.println(eElement.getAttribute("dep"));
                        sDep.add(eElement.getAttribute("dep"));
                        //out.println(eElement.getAttribute("arr") + "<br>");
                        sArr.add(eElement.getAttribute("arr"));
                        //out.println(eElement.getElementsByTagName("ddaygmt").item(0).getTextContent() + " : ");
                        sDdaygmt.add(eElement.getElementsByTagName("ddaygmt").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("dtimlcl").item(0).getTextContent() + " : ");
                        sDtimlcl.add(eElement.getElementsByTagName("dtimlcl").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("duration").item(0).getTextContent() + " : ");
                        sDuration.add(eElement.getElementsByTagName("duration").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("adaygmt").item(0).getTextContent() + " : ");
                        sAdaygmt.add(eElement.getElementsByTagName("adaygmt").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("atimlcl").item(0).getTextContent() + "<br>");
                        sAtimlcl.add(eElement.getElementsByTagName("atimlcl").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("airid").item(0).getTextContent() + " : ");
                        sAirid.add(eElement.getElementsByTagName("airid").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("fltno").item(0).getTextContent() + " : ");
                        sFltno.add(eElement.getElementsByTagName("fltno").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("eqp").item(0).getTextContent() + " : ");
                        sEqp.add(eElement.getElementsByTagName("eqp").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("stp").item(0).getTextContent() + " : ");
                        sStp.add(eElement.getElementsByTagName("stp").item(0).getTextContent());
                        //out.println(eElement.getElementsByTagName("fac").item(0).getTextContent() + "<br>");
                        sFac.add(eElement.getElementsByTagName("fac").item(0).getTextContent());
                    }
                }

                NodeList idLen = doc.getElementsByTagName("id");
                int idLength = idLen.getLength();
                int len;
                //out.println(idLength+" <<"+nlen);
                if (idLength > 1) {
                    len = idLength / nlen;
                } else {
                    if (trip.compareTo("s") == 0) {
                        out.println("No Flight Available 2");
                        return;
                    }
                    out.println("sorry !! something is wrong");
                    len = 0;
                }

                for (int i = 0; i < nlen; i++) {
                    Node nNode = nList.item(i);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        for (int j = 0; j < len; j++) {
                            Element eElement = (Element) nNode;
                            //out.println(eElement.getElementsByTagName("cb").item(j).getTextContent() + " : ");
                            sCb.add(eElement.getElementsByTagName("cb").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("id").item(j).getTextContent() + " : ");
                            sId.add(eElement.getElementsByTagName("id").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("av").item(j).getTextContent() + " : ");
                            sAv.add(eElement.getElementsByTagName("av").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("cur").item(j).getTextContent() + " : ");
                            sCur.add(eElement.getElementsByTagName("cur").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("CurInf").item(j).getTextContent() + " : ");
                            sCurInf.add(eElement.getElementsByTagName("CurInf").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("pri").item(j).getTextContent() + " : ");
                            sPri.add(eElement.getElementsByTagName("pri").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("tax").item(j).getTextContent() + " : ");
                            sTax.add(eElement.getElementsByTagName("tax").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("fav").item(j).getTextContent() + " : ");
                            sFav.add(eElement.getElementsByTagName("fav").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("awards").item(j).getTextContent() + " : ");
                            sAwards.add(eElement.getElementsByTagName("awards").item(j).getTextContent());
                            //out.println(eElement.getElementsByTagName("fid").item(j).getTextContent() + "<br>");
                            sFid.add(eElement.getElementsByTagName("fid").item(j).getTextContent());
                        }
                    }
                }
                if (trip.compareTo("r") == 0) {

                    com.videcom.VrsXmlWebService3 service1 = new com.videcom.VrsXmlWebService3();
                    com.videcom.VrsXmlWebService3Soap port1 = service1.getVrsXmlWebService3Soap();
                    VrsXmlRequest vr1 = new VrsXmlRequest();

                    command2 = comReturn + "[SalesCity=" + from + ",VARS=True,ClassBands=True,StartCity=" + from + ",SingleSeg=" + trip + ",FGNoAv=True,qtyseats=1]";
                    vr1.setToken("NulFjgDfdI74Tpm0Y6lfqgpcsEDXjX07J3hVE01Qb60=");
                    vr1.setCommand(command2);
                    String result1 = port1.runVRSCommand(vr1);
                    //out.println(result1.replaceAll("<", "&lt;"));
                    out.println("Return <br>");
                    //out.println(command2);
                    DocumentBuilderFactory dbf1 = DocumentBuilderFactory.newInstance();
                    DocumentBuilder db1 = dbf1.newDocumentBuilder();
                    InputSource is1 = new InputSource();
                    is1.setCharacterStream(new StringReader(result1));
                    Document doc1 = db1.parse(is1);
                    doc1.getDocumentElement().normalize();
                    NodeList nList1 = doc1.getElementsByTagName("itin");
                    int nlen1 = nList1.getLength();

                    for (int i = 0; i < nlen1; i++) {
                        Node nNode = nList1.item(i);

                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element eElement = (Element) nNode;

                            //out.println(eElement.getAttribute("line"));
                            rLine.add(eElement.getAttribute("line"));
                            //out.println(eElement.getAttribute("dep"));
                            rDep.add(eElement.getAttribute("dep"));
                            //out.println(eElement.getAttribute("arr") + "<br>");
                            rArr.add(eElement.getAttribute("arr"));
                            //out.println(eElement.getElementsByTagName("ddaygmt").item(0).getTextContent() + " : ");
                            rDdaygmt.add(eElement.getElementsByTagName("ddaygmt").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("dtimlcl").item(0).getTextContent() + " : ");
                            rDtimlcl.add(eElement.getElementsByTagName("dtimlcl").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("duration").item(0).getTextContent() + " : ");
                            rDuration.add(eElement.getElementsByTagName("duration").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("adaygmt").item(0).getTextContent() + " : ");
                            rAdaygmt.add(eElement.getElementsByTagName("adaygmt").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("atimlcl").item(0).getTextContent() + "<br>");
                            rAtimlcl.add(eElement.getElementsByTagName("atimlcl").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("airid").item(0).getTextContent() + " : ");
                            rAirid.add(eElement.getElementsByTagName("airid").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("fltno").item(0).getTextContent() + " : ");
                            rFltno.add(eElement.getElementsByTagName("fltno").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("eqp").item(0).getTextContent() + " : ");
                            rEqp.add(eElement.getElementsByTagName("eqp").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("stp").item(0).getTextContent() + " : ");
                            rStp.add(eElement.getElementsByTagName("stp").item(0).getTextContent());
                            //out.println(eElement.getElementsByTagName("fac").item(0).getTextContent() + "<br>");
                            rFac.add(eElement.getElementsByTagName("fac").item(0).getTextContent());
                        }
                    }

                    NodeList idLen1 = doc1.getElementsByTagName("id");
                    int idLength1 = idLen1.getLength();
                    int len1;
                    //out.println(idLength1+" >>"+nlen);
                    if (idLength1 > 1) {
                        len1 = idLength / nlen1;
                    } else {
                        if (trip.compareTo("r") == 0) {
                            out.println("No Flight Available 2");
                            return;
                        }
                        out.println("sorry !! something is wrong");
                        len1 = 0;
                    }

                    for (int i = 0; i < nlen; i++) {
                        Node nNode = nList1.item(i);
                        if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                            for (int j = 0; j < len; j++) {
                                Element eElement = (Element) nNode;
                                //out.println(eElement.getElementsByTagName("cb").item(j).getTextContent() + " : ");
                                rCb.add(eElement.getElementsByTagName("cb").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("id").item(j).getTextContent() + " : ");
                                rId.add(eElement.getElementsByTagName("id").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("av").item(j).getTextContent() + " : ");
                                rAv.add(eElement.getElementsByTagName("av").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("cur").item(j).getTextContent() + " : ");
                                rCur.add(eElement.getElementsByTagName("cur").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("CurInf").item(j).getTextContent() + " : ");
                                rCurInf.add(eElement.getElementsByTagName("CurInf").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("pri").item(j).getTextContent() + " : ");
                                rPri.add(eElement.getElementsByTagName("pri").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("tax").item(j).getTextContent() + " : ");
                                rTax.add(eElement.getElementsByTagName("tax").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("fav").item(j).getTextContent() + " : ");
                                rFav.add(eElement.getElementsByTagName("fav").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("awards").item(j).getTextContent() + " : ");
                                rAwards.add(eElement.getElementsByTagName("awards").item(j).getTextContent());
                                //out.println(eElement.getElementsByTagName("fid").item(j).getTextContent() + "<br>");
                                rFid.add(eElement.getElementsByTagName("fid").item(j).getTextContent());
                            }
                        }
                    }
                } else {

                }

                int slen = sLine.size();
                out.println(slen + ">>>" + sId.size());
                int idlsize=0;
                if (slen > 1) {
                    idlsize = sId.size() / slen;
                } else {
                    out.println("No Flight Available 2");
                }
                int rlen = rLine.size();

                int clss = Integer.parseInt(cls);

                List<String> sTrip = new ArrayList<String>();
                List<String> rTrip = new ArrayList<String>();
                List<String> rTrip1 = new ArrayList<String>();

                out.println(" length : " + sId.size());
                if (trip.compareTo("s") == 0) {

                    out.print("<div align='center'>");
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>DEPARTURE</th>");
                    out.println("<th>DURATION</th>");
                    out.println("<th>ARRIVAL</th>");
                    out.println("<th>AIRLINES</th>");
                    out.println("<th>PRICE</th>");
                    out.println("<th>BOOK</th>");
                    out.println("<tr>");

                    for (int i = 0; i < nlen; i++) {
                        for (int j = 0; j < sId.size() / slen; j++) {
                            if (clss == 2) {
                                if ((sId.get(j + i * idlsize).trim().compareTo("C") == 0) || (sId.get(j + i * idlsize).trim().compareTo("D") == 0)) {
                                    sTrip.clear();
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i) + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Business(" + sId.get(j + i * idlsize) + ")<br>Available"+sAv.get(j + i * idlsize)+"</td>");
                                    out.println("<td><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");

                                    sTrip.add(sDep.get(i));
                                    sTrip.add(sDdaygmt.get(i));
                                    sTrip.add(sDtimlcl.get(i));
                                    sTrip.add(sDuration.get(i));
                                    sTrip.add(sArr.get(i));
                                    sTrip.add(sAdaygmt.get(i));
                                    sTrip.add(sAtimlcl.get(i));
                                    sTrip.add(sAirid.get(i));
                                    sTrip.add(sFltno.get(i));
                                    sTrip.add(sCur.get(j + i * idlsize));
                                    sTrip.add(sPri.get(j + i * idlsize));
                                    sTrip.add(sId.get(j + i * idlsize));
                                    
                                    session.setAttribute("sTrip", sTrip);
                                    break;
                                }
                            } else if (clss == 1) {
                                if ((sId.get(j + i * idlsize).trim().compareTo("A") == 0) /*|| (idl.get(j).trim().compareTo("H") == 0)*/) {
                                    sTrip.clear();
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i) + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Premium Economy(" + sId.get(j + i * idlsize) + ")<br>Available"+sAv.get(j + i * idlsize)+"</td>");
                                    out.println("<td><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");

                                    sTrip.add(sDep.get(i));
                                    sTrip.add(sDdaygmt.get(i));
                                    sTrip.add(sDtimlcl.get(i));
                                    sTrip.add(sDuration.get(i));
                                    sTrip.add(sArr.get(i));
                                    sTrip.add(sAdaygmt.get(i));
                                    sTrip.add(sAtimlcl.get(i));
                                    sTrip.add(sAirid.get(i));
                                    sTrip.add(sFltno.get(i));
                                    sTrip.add(sCur.get(j + i * idlsize));
                                    sTrip.add(sPri.get(j + i * idlsize));
                                    sTrip.add(sId.get(j + i * idlsize));
                                    session.setAttribute("sTrip", sTrip);

                                    break;
                                }
                            } else {
                                if ((sId.get(j + i * idlsize).trim().compareTo("P") == 0) || (sId.get(j + i * idlsize).trim().compareTo("Q") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("W") == 0) || (sId.get(j + i * idlsize).trim().compareTo("E") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("N") == 0) || (sId.get(j + i * idlsize).trim().compareTo("X") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("T") == 0) || (sId.get(j + i * idlsize).trim().compareTo("I") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("R") == 0) || (sId.get(j + i * idlsize).trim().compareTo("B") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("M") == 0) || (sId.get(j + i * idlsize).trim().compareTo("H") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("L") == 0) || (sId.get(j + i * idlsize).trim().compareTo("O") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("K") == 0) || (sId.get(j + i * idlsize).trim().compareTo("Z") == 0)) {
                                    sTrip.clear();
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i) + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Economy(" + sId.get(j + i * idlsize)  + ")<br>Available"+sAv.get(j + i * idlsize)+"</td>");
                                    out.println("<td><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");

                                    sTrip.add(sDep.get(i));
                                    sTrip.add(sDdaygmt.get(i));
                                    sTrip.add(sDtimlcl.get(i));
                                    sTrip.add(sDuration.get(i));
                                    sTrip.add(sArr.get(i));
                                    sTrip.add(sAdaygmt.get(i));
                                    sTrip.add(sAtimlcl.get(i));
                                    sTrip.add(sAirid.get(i));
                                    sTrip.add(sFltno.get(i));
                                    sTrip.add(sCur.get(j + i * idlsize));
                                    sTrip.add(sPri.get(j + i * idlsize));
                                    sTrip.add(sId.get(j + i * idlsize));
                                    session.setAttribute("sTrip", sTrip);
                                    break;
                                }

                            }

                        }
                    }
                    out.println("</table>");
                    out.println("</div>");
                } else if (trip.compareTo("r") == 0) {
                    int ridlsize = rId.size() / rlen;
                    int count=0;
                    int con=0;
                    Boolean flag=true;
                    Boolean flag1=true;
                    String rx="";
                    
                    out.print("<div align='center'>");
                    out.println("<table>");
                    out.println("<tr>");
                    out.println("<th>DEPARTURE</th>");
                    out.println("<th>DURATION</th>");
                    out.println("<th>ARRIVAL</th>");
                    out.println("<th>AIRLINES</th>");
                    out.println("<th>PRICE</th>");
                    out.println("<th>BOOK</th>");
                    out.println("<tr>");

                    for (int i = 0; i < nlen; i++) {
                        rx=sFltno.get(i);
                        for (int j = 0; j < sId.size() / slen; j++) {
                            if (clss == 2) {
                                if ((sId.get(j + i * idlsize).trim().compareTo("C") == 0) || (sId.get(j + i * idlsize).trim().compareTo("D") == 0) && flag) {
                                    //rTrip.clear();
                                    flag=false;
                                    flag1=true;
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    %><input type="hidden" name="select" value="<%out.println(count++);%>"><%
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i) + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Business(" + sId.get(j + i * idlsize) + ")</td>");
                                    out.println("<td rowspan='2'><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");
                                    rTrip.add(sDep.get(i));
                                    rTrip.add(sDdaygmt.get(i));
                                    rTrip.add(sDtimlcl.get(i));
                                    rTrip.add(sDuration.get(i));
                                    rTrip.add(sArr.get(i));
                                    rTrip.add(sAdaygmt.get(i));
                                    rTrip.add(sAtimlcl.get(i));
                                    rTrip.add(sAirid.get(i));
                                    rTrip.add(sFltno.get(i));
                                    rTrip.add(sCur.get(j + i * idlsize));
                                    rTrip.add(sPri.get(j + i * idlsize));
                                    rTrip.add(sId.get(j + i * idlsize));

                                }
                                if ((rId.get(j + i * ridlsize).trim().compareTo("C") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("D") == 0)) {
                                    //rTrip1.clear();
                                    flag1=false;
                                    flag=true;
                                    out.println("<tr>");
                                    //out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + rDep.get(i) + "<br>" + rDdaygmt.get(i) + "<br>" + rDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rDuration.get(i) + "<br></td>");
                                    out.println("<td>" + rArr.get(i) + "<br>" + rAdaygmt.get(i) + "<br>" + rAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rAirid.get(i) + rFltno.get(i) + "</td>");
                                    out.println("<td>" + rCur.get(j + i * ridlsize) + " : " + rPri.get(j + i * ridlsize) + "<br>Business(" + rId.get(j + i * ridlsize) + ")</td>");
                                    out.println("</tr>");
                                    //out.println("</form>");

                                    rTrip1.add(rDep.get(i));
                                    rTrip1.add(rDdaygmt.get(i));
                                    rTrip1.add(rDtimlcl.get(i));
                                    rTrip1.add(rDuration.get(i));
                                    rTrip1.add(rArr.get(i));
                                    rTrip1.add(rAdaygmt.get(i));
                                    rTrip1.add(rAtimlcl.get(i));
                                    rTrip1.add(rAirid.get(i));
                                    rTrip1.add(rFltno.get(i));
                                    rTrip1.add(rCur.get(j + i * ridlsize));
                                    rTrip1.add(rPri.get(j + i * ridlsize));
                                    rTrip1.add(rId.get(j + i * ridlsize));
                                    
                                    session.setAttribute("rFlight", rTrip);
                                    session.setAttribute("rFlight1", rTrip1);
                                    
                                    break;
                                }
                            } else if (clss == 1) {
                                if ((sId.get(j + i * idlsize).trim().compareTo("A") == 0) /*|| (idl.get(j).trim().compareTo("H") == 0)*/ && flag) {
                                    //rTrip.clear();
                                    flag=false;
                                    flag1=true;
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    %><input type="hidden" name="select" value="<%out.println(count++);%>"><% 
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i) + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Business(" + sId.get(j + i * idlsize) + ")</td>");
                                    out.println("<td rowspan='2'><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");
                                    rTrip.add(sDep.get(i));
                                    rTrip.add(sDdaygmt.get(i));
                                    rTrip.add(sDtimlcl.get(i));
                                    rTrip.add(sDuration.get(i));
                                    rTrip.add(sArr.get(i));
                                    rTrip.add(sAdaygmt.get(i));
                                    rTrip.add(sAtimlcl.get(i));
                                    rTrip.add(sAirid.get(i));
                                    rTrip.add(sFltno.get(i));
                                    rTrip.add(sCur.get(j + i * idlsize));
                                    rTrip.add(sPri.get(j + i * idlsize));
                                    rTrip.add(sId.get(j + i * idlsize));

                                }
                                if ((rId.get(j + i * ridlsize).trim().compareTo("A") == 0) /*|| (rdl.get(j + i * ridlsize).trim().compareTo("H") == 0)*/) {
                                    //rTrip1.clear();
                                    flag1=false;
                                    flag=true;
                                    out.println("<tr>");
                                    //out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + rDep.get(i) + "<br>" + rDdaygmt.get(i) + "<br>" + rDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rDuration.get(i) + "<br></td>");
                                    out.println("<td>" + rArr.get(i) + "<br>" + rAdaygmt.get(i) + "<br>" + rAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rAirid.get(i) + rFltno.get(i) + "</td>");
                                    out.println("<td>" + rCur.get(j + i * ridlsize) + " : " + rPri.get(j + i * ridlsize) + "<br>Business(" + rId.get(j + i * ridlsize) + ")</td>");
                                    out.println("</tr>");
                                    //out.println("</form>");
                                    rTrip1.add(rDep.get(i));
                                    rTrip1.add(rDdaygmt.get(i));
                                    rTrip1.add(rDtimlcl.get(i));
                                    rTrip1.add(rDuration.get(i));
                                    rTrip1.add(rArr.get(i));
                                    rTrip1.add(rAdaygmt.get(i));
                                    rTrip1.add(rAtimlcl.get(i));
                                    rTrip1.add(rAirid.get(i));
                                    rTrip1.add(rFltno.get(i));
                                    rTrip1.add(rCur.get(j + i * ridlsize));
                                    rTrip1.add(rPri.get(j + i * ridlsize));
                                    rTrip1.add(rId.get(j + i * ridlsize));

                                    session.setAttribute("rFlight", rTrip);
                                    session.setAttribute("rFlight1", rTrip1);

                                    break;
                                }
                            } else {
                                if (((sId.get(j + i * idlsize).trim().compareTo("P") == 0) || (sId.get(j + i * idlsize).trim().compareTo("Q") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("W") == 0) || (sId.get(j + i * idlsize).trim().compareTo("E") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("N") == 0) || (sId.get(j + i * idlsize).trim().compareTo("X") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("T") == 0) || (sId.get(j + i * idlsize).trim().compareTo("I") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("R") == 0) || (sId.get(j + i * idlsize).trim().compareTo("B") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("M") == 0) || (sId.get(j + i * idlsize).trim().compareTo("H") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("L") == 0) || (sId.get(j + i * idlsize).trim().compareTo("O") == 0)
                                        || (sId.get(j + i * idlsize).trim().compareTo("K") == 0) || (sId.get(j + i * idlsize).trim().compareTo("Z") == 0)) && flag) {
                                    //rTrip.clear();
                                    out.println("<tr>");
                                    out.println("<form method='POST' action='select.jsp'>");
                                    
                                    flag =false;
                                    flag1=true;
                                    %><input type="hidden" name="select" value="<%out.println(con++);%>"><%  
                                    out.println("<td>" + sDep.get(i) + "<br>" + sDdaygmt.get(i) + "<br>" + sDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sDuration.get(i)+":"+con + "<br></td>");
                                    out.println("<td>" + sArr.get(i) + "<br>" + sAdaygmt.get(i) + "<br>" + sAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + sAirid.get(i) + sFltno.get(i) + "</td>");
                                    out.println("<td>" + sCur.get(j + i * idlsize) + " : " + sPri.get(j + i * idlsize) + "<br>Economy(" + sId.get(j + i * idlsize) + ")</td>");
                                    out.println("<td rowspan='2'><input type = 'submit' name = 'submit' value='Book'></td>");
                                    out.println("</form>");
                                    out.println("</tr>");
                                    rTrip.add(sDep.get(i));
                                    rTrip.add(sDdaygmt.get(i));
                                    rTrip.add(sDtimlcl.get(i));
                                    rTrip.add(sDuration.get(i));
                                    rTrip.add(sArr.get(i));
                                    rTrip.add(sAdaygmt.get(i));
                                    rTrip.add(sAtimlcl.get(i));
                                    rTrip.add(sAirid.get(i));
                                    rTrip.add(sFltno.get(i));
                                    rTrip.add(sCur.get(j + i * idlsize));
                                    rTrip.add(sPri.get(j + i * idlsize));
                                    rTrip.add(sId.get(j + i * idlsize));
                                    

                                }
                                if (((rId.get(j + i * ridlsize).trim().compareTo("P") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("Q") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("W") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("E") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("N") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("X") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("T") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("I") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("R") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("B") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("M") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("H") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("L") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("O") == 0)
                                        || (rId.get(j + i * ridlsize).trim().compareTo("K") == 0) || (rId.get(j + i * ridlsize).trim().compareTo("Z") == 0)) && flag1) {
                                    //rTrip1.clear();
                                    out.println("<tr>");
                                    flag=true;
                                    flag1 = false;
                                    //out.println("<form method='POST' action='select.jsp'>");
                                    out.println("<td>" + rDep.get(i) + "<br>" + rDdaygmt.get(i) + "<br>" + rDtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rDuration.get(i) + "<br></td>");
                                    out.println("<td>" + rArr.get(i) + "<br>" + rAdaygmt.get(i) + "<br>" + rAtimlcl.get(i) + "</td>");
                                    out.println("<td>" + rAirid.get(i) + rFltno.get(i) + "</td>");
                                    out.println("<td>" + rCur.get(j + i * ridlsize) + " : " + rPri.get(j + i * ridlsize) + "<br>Economy(" + rId.get(j + i * ridlsize) + ")</td>");
                                    //out.println("<td><input type = 'submit' name = 'submit' value='Book'></td>");
                                    //out.println("</form>");
                                    out.println("</tr>");

                                    rTrip1.add(rDep.get(i));
                                    rTrip1.add(rDdaygmt.get(i));
                                    rTrip1.add(rDtimlcl.get(i));
                                    rTrip1.add(rDuration.get(i));
                                    rTrip1.add(rArr.get(i));
                                    rTrip1.add(rAdaygmt.get(i));
                                    rTrip1.add(rAtimlcl.get(i));
                                    rTrip1.add(rAirid.get(i));
                                    rTrip1.add(rFltno.get(i));
                                    rTrip1.add(rCur.get(j + i * ridlsize));
                                    rTrip1.add(rPri.get(j + i * ridlsize));
                                    rTrip1.add(rId.get(j + i * ridlsize));

                                    session.setAttribute("rFlight", rTrip);
                                    session.setAttribute("rFlight1", rTrip1);

                                    break;
                                }

                            }

                        }
                    }
                    out.println("</table>");
                    out.println("</div>");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Error : " + ex);

            }
        %>
    </body>
</html>
