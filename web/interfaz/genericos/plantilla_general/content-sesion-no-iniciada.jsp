<%-- 
    Document   : content-sesion-no-iniciada
    Created on : Nov 11, 2012, 11:41:06 AM
    Author     : smaf
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<fieldset>
    <center>
        <h1>Para entrar al sitio debe iniciar sesión</h1>
        <html:form action="/VolverPagInicio" onsubmit="return (this)">
            <html:submit styleClass="btn btn-primary">
                Ir a página principal
            </html:submit>
        </html:form>
    </center>
</fieldset>
