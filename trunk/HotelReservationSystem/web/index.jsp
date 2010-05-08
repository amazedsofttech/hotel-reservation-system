<%-- 
    Document   : index
    Author     : Liu Chun(HTML) Wang Qi Chen(JSP)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,serv.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link href="css/styleHRS.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div align="center">
            <table width="1024" border="0" bgcolor="#FFFFFF">
                <tr>
                    <td align="center" height="100" colspan="2"><img src="image/logo.jpg" width="1020" height="150" alt=""></td>
                </tr>

                <tr>
                    <td id="sidebar" width="200" bgcolor="#CCCCCC">
                        <%if(session.getAttribute("username")==null && session.getAttribute("adminusername")==null && session.getAttribute("adminroot")==null){%>
       <table width="200" align="center"><tr><td id="navigator"><strong>Welcome, Guest :<br>
       </strong></td></tr>
                        <tr><td id="menu"><a href=login.jsp>Sign in</a></td></tr>
                        <tr><td id="menu"><a href="reg.jsp">Sign up</a></td></tr></table>
                    <%}else if(session.getAttribute("username")!=null){%>
                        <%String username = (String)session.getAttribute("username");%>
                        <table width="200" align="center"><tr><td id="navigator"><strong>Welcome,
                        <%out.println(username);%> 
                        :</strong></td></tr>
                        <tr><td id="menu"><a href=useredit.jsp>Edit my profile</a></td></tr>
                        <tr><td id="menu"><a href=userorder.jsp>My Order</a></td></tr>
                        <tr><td id="menu"><a href=orderserv?action=order>check order status</a></td></tr>
                        <tr><td id="menu"><a href=logoutserv?action=logout>Logout</a></td></tr></table>

                    <%} else if(session.getAttribute("adminusername")!=null){ %>
                        <%String adminusername = (String)session.getAttribute("adminusername");%>
                        <table width="200" align="center"><tr><td id="navigator"><strong>Welcome,
                        <%out.println(adminusername);%>
                        :</strong></td></tr>
                        <tr><td id="menu"><a href=listserv?action=adminList&&groupid=0>manage room</a></td></tr>
                        <tr><td id="menu"><a href=listserv?action=adminGroup>manage room group</a></td></tr>
                        <tr><td id="menu"><a href=orderserv?action=allOrders&&condition=1>manage order</a></td></tr>
                        <tr><td id="menu"><a href=logoutserv?action=logout>logout</a></td></tr></table>
                    <%} else if(session.getAttribute("adminroot")!=null){ %>
                        <%String adminroot = (String)session.getAttribute("adminroot");%>
                        <table width="200" align="center"><tr><td id="navigator"><strong>Welcome,
                        <%out.println(adminroot);%>
                        </strong></td></tr>
                        <tr><td id="menu"><a href=adminmanage.jsp>manage admin</a></td></tr>
                        <tr><td id="menu"><a href=adminedit.jsp>edit password</a></td></tr>
                        <tr><td id="menu"><a href=logoutserv?action=logout>Logout</a></td></tr></table>
                        <%}%>
                  </td>
                    <td width="808" height="300">
                        <table width="90%" height="151" border="1" align="center">
                            <%Vector<String[]> v = database.getGroup();
                                        for (String[] s : v) {%>
                                        <tr><td align="center" width="150" rowspan="2"><img alt="RoomPic" src="<%=s[4]%>"/></td>
                       					  <td height="30" ><%=s[1]%></td>
                       					  <td width="150" rowspan="2" ><a href=listserv?action=list&&groupid=<%=s[0]%>>reservation a room!>></a></td>
                       					</tr>
                                        <tr>
                                            <td width="300"><%=s[2]%></td>
                                        </tr>
                            <%}%>
                           
                        </table>
                    </td>
                </tr>
                <tr>
                <td align="center" colspan="2">
                <hr>
                <p>Copy Right by Group 16</p></td>
                </tr>
            </table>
        </div>
    </body>
</html>
