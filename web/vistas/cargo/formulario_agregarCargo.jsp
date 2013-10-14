<%-- 
    Document   : formulario_agregarCargo
    Created on : 02/10/2013, 06:07:13 PM
    Author     : ivan
--%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("usuarioAdministrador") != null)  {
        if (session.getAttribute("usuarioAdministrador").equals("administrador")){
%>
<tiles:insert definition="agregarCargo"/>
<%
        } else {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
        }
    }  else {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    }     
%>
