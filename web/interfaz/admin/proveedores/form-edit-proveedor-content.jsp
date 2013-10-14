<%-- 
    Document   : form-edit-proveedor-content
    Created on : 02/02/2013, 11:10:50 PM
    Author     : ivan
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Editar proveedor</legend>

<logic:present name="mensajeProveedorRif">
        <center>
            <label style="color:red">Error: Debe introducir el RIF del proveedor</label>
        </center>
</logic:present>

<logic:present name="mensajeProveedorNombre">
        <center>
            <label style="color:red">Error: Debe introducir el nombre del proveedor</label>
        </center>
</logic:present>

<html:form action = "/EditarProveedor" acceptCharset="ISO-8859-1" onsubmit = "return (this)">

    <label>RIF:</label>
    <html:text name="Proveedor" property="rif" styleClass="span5">
        <bean:write name="proveedor" property="rif"/>
    </html:text><br>
    <label>Nombre / Razón Social:</label>
    <html:text name="Proveedor" property="nombre" styleClass="span5">
        <bean:write name="proveedor" property="nombre"/>
    </html:text><br>
    <label>Dirección:</label>
    <html:textarea name="Proveedor" property="direccion" rows="4" styleClass="span5">
        <bean:write name="proveedor" property="direccion"/>
    </html:textarea><br>
    <label>Email:</label>
    <html:text name="Proveedor" property="email" styleClass="span5">
        <bean:write name="proveedor" property="email"/>
    </html:text><br>
    <label>Contacto</label>
    <html:text name="Proveedor" property="contacto" styleClass="span5">
        <bean:write name="proveedor" property="contacto"/>
    </html:text><br>
    <label>Teléfono:</label>
    <html:text name="Proveedor" property="telefono" styleClass="span5">
        <bean:write name="proveedor" property="telefono"/>
    </html:text><br>

    <html:hidden name="proveedor" property="rifAnterior"/>
    <html:hidden name="autenticado" property="usuario" />
    <center>
        <html:submit styleClass="btn btn-primary"> Editar </html:submit>
    </center>
</html:form>