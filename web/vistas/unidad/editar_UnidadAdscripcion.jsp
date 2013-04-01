<%-- 
    Document   : editar_UnidadAdscripcion
    Created on : 28/03/2013, 09:11:26 PM
    Author     : Azocar
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("usuarioAdministrador") != null)  {
        if (session.getAttribute("usuarioAdministrador").equals("administrador")){
%>
<tiles:insert definition="editar-UnidadAdscripcion"/>
<%
        } else {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
        }
    }  else {
%>
<tiles:insert definition="interfaz-sesion-no-iniciada"/>
<%
    }     
%>