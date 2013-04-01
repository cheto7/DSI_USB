<%-- 
    Document   : form-nuevoPeriodo
    Created on : 30/03/2013, 09:14:25 PM
    Author     : ivan
--%>
<%-- 
    Document   : ListaPeriodos.jsp
    Created on : 30/03/2013, 07:41:56 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session!=null && session.getAttribute("sesionIniciada") == null) {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    } else {
%>
<tiles:insert definition="form-nuevo-periodo"/>
<%
    }
%>


