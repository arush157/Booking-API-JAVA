
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
        <h1>Search Flight</h1>
        <%
            String[] country = {"CCU", "KUL", "MCT", "CIN", "BKK", "DOH", "DMM", "KTM", "DAC", "CGP", "CXB", "SPD", "JSR"};
        %>
        <div align="center" >
            <form method="POST" action="availability.jsp" name="myForm">
                <table>
                    <tbody>
                        <tr>
                            <th>Description</th>
                            <th>Insert</th>
                        </tr>
                        <tr>
                            <td>From</td>
                            <td>
                                <select name="from" style="width:145px;">
                                    <%
                                        for (int i = 0; i < country.length; i++) {
                                            String con = country[i];
                                    %>
                                    <option value="<%=con%>"><%=con%></option>
                                    <%}
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>To</td>
                            <td>
                                <select name="to" style="width:145px;">
                                    <%
                                        for (int i = 0; i < country.length; i++) {
                                            String con = country[i];
                                    %>
                                    <option value="<%=con%>"><%=con%></option>
                                    <%}
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>dep<input type="date" name= "date" >
                                <%
                                %>
                                <div id="demo">
                                    arr <input type="date" name= "rdate" value="2018-07-03">
                                </div>
                            
                            </td>
                        </tr>
                        <tr>
                            <td>Adult</td>
                            <td>
                                <select name="adult" style="width:145px;">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Child</td>
                            <td>
                                <select name="child" style="width:145px;">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>Infant</td>
                            <td>
                                <select name="infant" style="width:145px;">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Trip</td>
                            <td>
                                <input type="radio" name ="trip" value="s" checked="checked">Single
                                <input type="radio" name ="trip" value="r" onclick="myFunction()">Round
                            </td>
                        </tr>
                        <tr>
                            <td>Select Class</td>
                            <td>
                                <select name="class" style="width:145px;">
                                    <option value="0">Economy</option>
                                    <option value="1">Premium Economy</option>
                                    <option value="2">Business</option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="Submit" name="submit" value="Show Result" ></td>
                        </tr>

                    </tbody>

                </table>

            </form>
        </div>
                                
    </body>
    <script >
        
        function myFunction() {
            var x = document.getElementById("demo");
            if (x.style.display === "block") {
                x.style.display = "none";
                x.value="2018-07-01";
            } else {
                x.style.display = "block";
            }
        }
    </script>
</html>
