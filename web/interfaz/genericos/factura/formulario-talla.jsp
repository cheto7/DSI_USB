<%-- 
    Document   : formulario-talla
    Created on : Apr 2, 2013, 9:57:04 AM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Seleccionar talla</legend>
<center>
    <html:form action="/AgregarEquipoAFactura" onsubmit="return (this)">
        <h1 style="display: inline">Talla del Equipo: </h1>
        <html:hidden name="facturado" property="numero_factura"/>
        <html:hidden name="facturado" property="serial"/>
        <html:hidden name="facturado" property="cantidad"/>
        <html:select name="facturado" property="talla" styleClass="span3">
            <html:optionsCollection name="select" label="value" value="value"/>
        </html:select>
        <br/>
        <br/>
        <html:submit styleClass="btn btn-primary"> Agregar </html:submit>
    </html:form>
</center>