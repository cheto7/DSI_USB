<%-- 
    Document   : form-agregar-equipo-content
    Created on : Jan 30, 2013, 4:27:48 PM
    Author     : cheto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Agregar un Equipo</legend>
<logic:present name="equipoNulo">
    <logic:notEmpty name="equipoNulo">
        <center>
            <label style="color:red">Error: <bean:write name="equipoNulo" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorNombreEquipo">
    <logic:notEmpty name="errorNombreEquipo">
        <center>
            <label style="color:red">Error: Debe introducir el nombre del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorTipoEquipo">
    <logic:notEmpty name="errorTipoEquipo">
        <center>
            <label style="color:red">Error: Debe introducir el tipo del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorFuncionalidadEquipo">
    <logic:notEmpty name="errorFuncionalidadEquipo">
        <center>
            <label style="color:red">Error: Debe introducir la funcionalidad del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<html:form action = "/AgregarEquipo" acceptCharset="iso-8859-1" onsubmit = "return (this)">

    <label>Nombre</label>
    <html:text name="Equipo" property="nombre_vista" styleClass="span5"></html:text><br>  
    <label>Tipo</label>
    <html:text name="Equipo" property="tipo" styleClass="span5" ></html:text><br>
    <label>Imagen</label>
    <html:file name="Equipo" property="file" styleClass="span5" ></html:file><br>
    <label>Funcionalidad</label>
    <html:textarea name="Equipo" property="funcionalidad" rows="3" styleClass="span5" ></html:textarea><br>

    <html:submit styleClass="btn btn-primary"> Agregar </html:submit>
</html:form>