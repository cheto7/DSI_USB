<%-- 
    Document   : interfaz-form-edit-equipoEnFactura
    Created on : May 7, 2013, 6:46:03 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!=null && session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="formulario-editar-equipo-en-factura"/>
<%
    }
%>
