<%-- 
    Document   : cambiarTalla
    Created on : 15/07/2013, 11:11:59 PM
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
<tiles:insert definition="cambiar-talla-equipo"/>
<%
    }
%>


