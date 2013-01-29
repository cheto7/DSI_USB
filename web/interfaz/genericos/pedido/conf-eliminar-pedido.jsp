<%-- 
    Document   : conf-eliminar
    Created on : Nov 12, 2012, 10:01:38 AM
    Author     : smaf
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<fieldset>
    <center>
        <br><br><br>
        <label>Desea eliminar su solicitud de equipos?</label>
        <br>
        <html:form method="POST" action="/EliminarSolicitudCompleta?method=save" onsubmit="return (this)">
            <html:submit styleClass="btn btn-primary">
                Si, deseo eliminar
            </html:submit>
        </html:form>
    </center>
</fieldset>
