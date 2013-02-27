<%-- 
    Document   : interfaz_formulario_agregar_equipo
    Created on : Ene 30, 2013, 6:20:53 PM
    Author     : Cheto
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
<tiles:insert definition="formulario-agregar-equipos"/>
<%
    }
%>
