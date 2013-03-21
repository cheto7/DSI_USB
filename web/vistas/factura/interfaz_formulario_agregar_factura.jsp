<%-- 
    Document   : interfaz_formulario_agregar_factura
    Created on : Mar 20, 2013, 8:20:24 PM
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
<tiles:insert definition="formulario-agregar-factura"/>
<%
    }
%>