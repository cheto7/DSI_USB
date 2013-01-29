<%-- 
    Document   : interfaz_simple_mortal
    Created on : Nov 12, 2012, 10:38:50 AM
    Author     : smaf
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<!--<h1>Eres menos que un simple mortal</h1>-->
<tiles:insert definition="mortal-usuario-habilitado"/>
<%
    }
%>

