<%-- 
    Document   : confirmar_eliminar
    Created on : Nov 12, 2012, 10:02:03 AM
    Author     : smaf
--%>

<%-- 
    Document   : confirmar_solicitud
    Created on : Oct 31, 2012, 1:38:40 PM
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
<tiles:insert definition="confirmar-eliminar"/>
<%
    }
%>