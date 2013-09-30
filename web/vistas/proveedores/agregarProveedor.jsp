<%-- 
    Document   : agregarProveedor
    Created on : 02/02/2013, 08:46:10 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
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
<tiles:insert definition="formulario-agregar-proveedor"/>
<%
    }
%>