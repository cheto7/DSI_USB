<%-- 
    Document   : form-content-equipoEnSolAdmin
    Created on : 28/02/2013, 03:07:17 AM
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Editar Equipo de protección de la solicitud</legend>
<logic:present name="cantidadNula">
        <center>
            <label style="color:red">Error: El equipo tiene cero unidades solicitadas </label>
        </center>
</logic:present>

<table>
    <tr>
        <th>Equipo a Editar</th>
    </tr>
    <tr>
        <td>
            <bean:write name="solicitud" property="nombre_vista"/>
        </td>
        <td style="">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img width="120px" src="assets/materiales/<bean:write name="solicitud" property="nombre_vista"/>.png"/>
        </td>
    </tr>
    <tr>
        <td>
            <html:form action = "/ActualizarEquipoEnSolicitudAdmin" acceptCharset="iso-8859-1" onsubmit = "return (this)">
                <html:hidden name="solicitud" property="id"/>
                <html:hidden name="solicitud" property="serialEquipo"/>
                <html:hidden name="solicitud" property="fecha_solicitud"/>
                <html:hidden name="solicitud" property="nombre_vista"/>
                <html:hidden name="usuario" property="usuario"/>
                <label>Frecuencia de Uso:</label>
                <html:select name="solicitud" property="frecuencia" styleClass="spana">
                    <option>Diaria</option>
                    <option>Semanal</option>
                    <option>Mensual</option>
                    <option>Trimestral</option>
                    <option>Anual</option>
                </html:select>
                <label>Cantidad:</label>
                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner">
                    <bean:write name="solicitud" property="cantidad"/>
                </html:text>
                <label>Talla:</label>
                <html:text name="solicitud" property="talla" styleClass="span1" styleId="spinner" disabled="true">
                    <bean:write name="solicitud" property="talla"/>
                </html:text><br>
                <center>
                    <html:submit styleClass="btn btn-primary"> Editar </html:submit>
                </center>
            </html:form>
        </td>
    </tr>    
</table>