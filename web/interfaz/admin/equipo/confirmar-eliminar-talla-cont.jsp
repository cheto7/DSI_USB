<%-- 
    Document   : confirmar-eliminar-talla-cont
    Created on : 31/07/2013, 09:19:55 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<fieldset>
    <center>
        <br><br><br>
        <label>¿Desea eliminar la talla
            '<bean:write name="equipo" property="talla"/>'
            del equipo <bean:write name="equipo" property="nombre_vista"/>?
        </label>
        <br>
        <html:form action="/EliminarTallaEquipo" onsubmit="return (this)">
            <html:hidden name="equipo" property="serial"/>
            <html:hidden name="equipo" property="imagen"/>
            <html:hidden name="equipo" property="tipo"/>
            <html:hidden name="equipo" property="nombre_vista"/>
            <html:hidden name="equipo" property="evaluacion"/>
            <html:hidden name="equipo" property="funcionalidad"/>
            <html:hidden name="equipo" property="sector"/>
            <html:hidden name="equipo" property="vida_util"/>
            <html:hidden name="equipo" property="tipo_talla"/>
            <html:hidden name="equipo" property="norma"/>
            <html:hidden name="equipo" property="norma"/>
            <html:hidden name="equipo" property="talla"/>
            <html:hidden name="equipo" property="cantidad"/>
            <html:submit styleClass="btn btn-primary">
                Si, deseo eliminar
            </html:submit>
        </html:form>
    </center>
</fieldset>
