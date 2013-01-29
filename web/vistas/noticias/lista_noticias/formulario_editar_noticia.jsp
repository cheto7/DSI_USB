<%-- 
    Document   : formulario_editar_noticia
    Created on : Nov 25, 2012, 1:14:33 PM
    Author     : smaf
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
<tiles:insert definition="formulario-editar-noticia"/>
<%
    }
%>
