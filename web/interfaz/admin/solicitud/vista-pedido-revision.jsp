<%-- 
    Document   : vista-peido-revision
    Created on : 28/02/2013, 01:37:39 AM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Solicitud</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<logic:empty name="solicitud">
    <center>
        <span style="color:red">No hay equipos en la solicitud</span>
    </center>
</logic:empty>
<logic:notEmpty name="solicitud">
    <h1>Pedido realizado por:</h1>
    <h5>Nombre de usuario: <bean:write name="usuario" property="usuario"/></h5>
    <h5>Nombres: <bean:write name="usuario" property="nombre"/></h5>
    <h5>Apellidos: <bean:write name="usuario" property="apellido"/></h5>
    <h5>CI: <bean:write name="usuario" property="ci"/></h5>
    <h5>Email: <bean:write name="usuario" property="email"/></h5>
    <h5>Sexo: <bean:write name="usuario" property="sexo"/></h5>
    <h5>Sector Universitario: <bean:write name="usuario" property="area_laboral"/></h5> 
    <table class="table table-hover">
        <tbody>
            <tr>
                <th>Equipo</th>
                <th>Imagen</th>
                <th><center>Frecuencia de uso</center></th>
    <th>Cantidad solicitada</th>
    <th>Talla</th>
    <th colspan="2"><center>Opciones</center></th>
</tr>


<logic:iterate name="solicitud" id="solicitud">
    <tr>
        <td> <bean:write name="solicitud" property="nombre_vista" /> </td>
        <td><img width="70px" src="assets/materiales/<bean:write name="solicitud" property="nombre_vista"/>.png" /></td>
        <td>
    <center> 
        <bean:write name="solicitud" property="frecuencia" />
    </center>
</td>
<td>
<center>
    <bean:write name="solicitud" property="cantidad" />
</center>
</td>
<td>
<center>
    <bean:write name="solicitud" property="talla" />
</center>
</td>
<td>
    <html:form action="/EditarEquipoEnSolicitudAdmin" onsubmit="return (this)" style="display: inline">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="solicitud" property="cantidad"/>
        <html:hidden name="solicitud" property="frecuencia"/>
        <html:hidden name="solicitud" property="serialEquipo"/>
        <html:hidden name="solicitud" property="nombre_vista"/>
        <html:hidden name="solicitud" property="fecha_solicitud"/>
        <html:hidden name="solicitud" property="talla"/>
        <html:hidden name="usuario" property="usuario"/>
        <html:submit styleClass="btn btn-primary"> Editar </html:submit>
    </html:form>
</td>
<td>
    <html:form action="/EliminarEquipoEnSolicitudAdmin" onsubmit="return (this)">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="solicitud" property="serialEquipo"/>
        <html:hidden name="solicitud" property="fecha_solicitud"/>
        <html:hidden name="usuario" property="usuario"/>
        <html:submit styleClass="btn btn-danger"> Borrar </html:submit>
    </html:form>
</td>              
</tr>
</logic:iterate>

</tbody>
</table>
<table align="center">
    <tr>
        <td>
            <logic:notPresent name="modificada">
                <html:form action="/ConfirmarModificacion" onsubmit="return (this)">
                    <html:hidden name="solicitud" property="id"/>
                    <html:submit styleClass="btn btn-success"> Aprobar solicitud </html:submit>
                </html:form>
            </logic:notPresent>
        </td>
    </tr>
</table>
</logic:notEmpty>