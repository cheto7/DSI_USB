<%-- 
    Document   : form-agregar-proveedor-content
    Created on : 30/01/2013, 04:09:11 PM
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Agregar un nuevo proveedor</legend>

<%--<logic:present name="noticiaNula">
    <logic:notEmpty name="noticiaNula">
        <center>
            <label style="color:red">Error: <bean:write name="noticiaNula" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>--%>
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

<logic:present name="mensajeProveedorExistente">
        <center>
            <label style="color:red">Error: El RIF ya se encuentra registrado en la base de datos</label>
        </center>
</logic:present>

<html:form action = "/AgregarProveedor" acceptCharset="iso-8859-1" onsubmit = "return (this)">

    <label>RIF:</label>
    <html:text name="Proveedor" property="rif" styleClass="span5"></html:text><br>  
    <label>Nombre / Razón Social:</label>
    <html:text name="Proveedor" property="nombre" styleClass="span5"></html:text><br>
    <label>Dirección:</label>
    <html:textarea name="Proveedor" property="direccion" rows="4" styleClass="span5"></html:textarea><br>
    <label>Email:</label>
    <html:text name="Proveedor" property="email" styleClass="span5"></html:text><br>
    <label>Contacto</label>
    <html:text name="Proveedor" property="contacto" styleClass="span5"></html:text><br>
    <label>Teléfono:</label>
    <html:text name="Proveedor" property="telefono" styleClass="span5"></html:text><br>

    <html:hidden name="autenticado" property="usuario" />
    <center>
    <html:submit styleClass="btn btn-primary"> Agregar </html:submit>
    </center>        
</html:form>
