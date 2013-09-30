<%-- 
    Document   : formulario_editar_proveedor
    Created on : 02/02/2013, 11:05:59 PM
    Author     : ivan
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
<tiles:insert definition="formulario-editar-proveedor"/>
<%
    }
%>
