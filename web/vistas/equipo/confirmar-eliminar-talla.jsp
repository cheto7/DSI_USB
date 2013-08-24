<%-- 
    Document   : confirmar-eliminar-talla
    Created on : 31/07/2013, 09:16:57 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session!= null && session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="confirmar-eliminar-talla"/>
<%
    }
%>
