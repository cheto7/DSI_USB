<%-- 
    Document   : seleccionarPeriodo
    Created on : 05/08/2013, 04:04:42 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!= null && session.getAttribute("sesionIniciada") == null)  {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    }  else {
%>
<tiles:insert definition="seleccionar-periodo-entrega"/>
<%
    }     
%>


