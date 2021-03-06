<%-- 
    Document   : form-agregar-factura-content
    Created on : Mar 20, 2013, 8:22:47 PM
    Author     : cheto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Agregar factura</legend>
<center>
    <logic:present name="mensajeFactura">
        <logic:notEmpty name="mensajeFactura">
            <center>
                <label style="color:red">Error: <bean:write name="mensajeFactura" property="value"/></label>
            </center>
        </logic:notEmpty>
    </logic:present>
    
    <logic:empty name="proveedores">
        <label style="color:red">No hay proveedores registrados</label>
    </logic:empty>

    <logic:notEmpty name="proveedores">
        <html:form action = "/AgregarFactura" acceptCharset="iso-8859-1" onsubmit = "return (this)">

            <h1 style="display:inline">Proveedor:</h1>
            <html:select name="Factura" property="proveedor" styleClass="span5">
                <html:optionsCollection name="proveedores" value="nombre" label="nombre"/>
            </html:select>
            <html:submit styleClass="btn btn-primary"> Agregar </html:submit>
        </html:form>
    </logic:notEmpty>
</center>