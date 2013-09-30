<%-- 
    Document   : coleccion
    Created on : Oct 18, 2012, 8:04:53 AM
    Author     : Azocar, Karen
--%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!=null && session.getAttribute("usuarioAdministrador") != null)  {
        if (session.getAttribute("usuarioAdministrador").equals("administrador") || 
                session.getAttribute("usuarioAdministrador").equals("supervisor") ||
                session.getAttribute("usuarioAdministrador").equals("inspector")){
%>
<tiles:insert definition="coleccion-usuariosHabilitados"/>
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