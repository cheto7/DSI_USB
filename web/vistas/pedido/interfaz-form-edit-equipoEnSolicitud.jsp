<%-- 
    Document   : interfaz-form-edit-equipoEnSolicitud
    Created on : 27/02/2013, 08:25:12 PM
    Author     : ivan
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
<tiles:insert definition="formulario-editar-equipo-en-solicitud"/>
<%
    }
%>
