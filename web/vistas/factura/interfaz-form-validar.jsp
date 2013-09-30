<%-- 
    Document   : interfaz-form-validar
    Created on : May 15, 2013, 9:52:27 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!=null && (session.getAttribute("sesionIniciada") == null || 
            !session.getAttribute("usuarioAdministrador").equals("administrador"))) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="formulario-validar-factura"/>
<%
    }
%>
