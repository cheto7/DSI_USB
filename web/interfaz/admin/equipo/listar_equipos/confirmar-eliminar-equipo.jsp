<%-- 
    Document   : confirmar-eliminar-equipo
    Created on : Feb 4, 2013, 4:51:54 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<fieldset>
    <center>
        <br><br><br>
        <label>Desea eliminar la equipo
            '<bean:write name="equipo" property="nombre_vista"></bean:write>'
            ?
        </label>
        <br>
        <html:form action="/EliminarEquipo" onsubmit="return (this)">
            <html:hidden name="equipo" property="nombre_vista"/>
            <html:hidden name="equipo" property="serial"/>
            <html:submit styleClass="btn btn-primary">
                Si, deseo eliminar
            </html:submit>
        </html:form>
    </center>
</fieldset>

