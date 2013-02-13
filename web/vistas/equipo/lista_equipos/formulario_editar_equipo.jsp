<%-- 
    Document   : formulario_editar_equipo
    Created on : Feb 4, 2013, 5:59:16 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="formulario-editar-equipo"/>
<%
    }
%>