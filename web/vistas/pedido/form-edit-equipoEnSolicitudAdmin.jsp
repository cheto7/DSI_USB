<%-- 
    Document   : form-edit-equipoEnSolicitudAdmin
    Created on : 28/02/2013, 03:05:11 AM
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
<tiles:insert definition="form-editar-equipo-en-solicitud-admin"/>
<%
    }
%>

