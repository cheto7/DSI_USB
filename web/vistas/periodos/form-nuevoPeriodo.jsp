<%-- 
    Document   : form-nuevoPeriodo
    Created on : 30/03/2013, 09:14:25 PM
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
<tiles:insert definition="form-nuevo-periodo"/>
<%
    }
%>


