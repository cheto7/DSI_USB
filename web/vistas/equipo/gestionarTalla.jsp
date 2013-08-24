<%-- 
    Document   : gestionarTalla
    Created on : 15/07/2013, 12:06:41 AM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!= null && session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="gestionar-talla-equipo"/>
<%
    }
%>

