<%-- 
    Document   : interfaz_formulario_agregar_noticia
    Created on : Nov 10, 2012, 6:20:53 PM
    Author     : smaf
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
<tiles:insert definition="formulario-agregar-noticia"/>
<%
    }
%>