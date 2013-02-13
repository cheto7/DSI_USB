<%-- 
    Document   : confirmar-eliminar-proveedor
    Created on : 02/02/2013, 07:02:20 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<fieldset>
    <center>
        <br><br><br>
        <label>¿Desea eliminar el Proveedor
            '<bean:write name="proveedor" property="nombre"></bean:write>'
            (<bean:write name="proveedor" property="rif"></bean:write>)
            ?
        </label>
        <br>
        <html:form action="/EliminarProveedor" onsubmit="return (this)">
            <html:hidden name="proveedor" property="rif"/>
            <html:submit styleClass="btn btn-primary">
                Si, deseo eliminar
            </html:submit>
        </html:form>
    </center>
</fieldset>