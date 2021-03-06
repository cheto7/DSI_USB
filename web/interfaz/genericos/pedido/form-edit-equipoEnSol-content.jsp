<%--
    Document   : form-edit-equipoEnSol-content
    Created on : 27/02/2013, 08:32:12 PM
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
            <label style="color:red">Error: Debe introducir una cantidad mayor a cero </label>
        </center>
</logic:present>

<table class="table table-hover">
    <tbody>
    <tr>
        <th>Equipo</th>
        <th>Imagen </th>
        <th>Frecuencia de uso</th>
        <th>Cantidad</th>
        <th>Talla</th>
    </tr>
    <tr>
        <td>
            <bean:write name="solicitud" property="nombre_vista"/>
        </td>
        <td style="">
            <img width="120px" src="assets/materiales/<bean:write name="solicitud" property="nombre_vista"/>.png"/>
        </td>
        
            <html:form action = "/ActualizarEquipoEnSolicitud" acceptCharset="iso-8859-1" onsubmit = "return (this)">
                <html:hidden name="solicitud" property="id"/>
                <html:hidden name="solicitud" property="serialEquipo"/>
                <html:hidden name="solicitud" property="nombre_vista"/>
                <html:hidden name="solicitud" property="periodo"/>
                <html:hidden name="solicitud" property="talla"/>
                <html:hidden name="usuario" property="usuario"/>
                <td>
                <html:select name="solicitud" property="frecuencia" styleClass="spana">
                    <option>Diaria</option>
                    <option>Semanal</option>
                    <option>Mensual</option>
                    <option>Trimestral</option>
                    <option>Anual</option>
                </html:select>
                </td>
                <td>
                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner">
                    <bean:write name="solicitud" property="cantidad"/>
                </html:text>
                </td>
                <td>
                <html:text name="solicitud" property="talla" styleClass="span1" styleId="spinner" disabled="true">
                    <bean:write name="solicitud" property="talla"/>
                </html:text><br>
                </td>
                <tr>
                    <td colspan="5">
                <center>
                    <html:submit styleClass="btn btn-primary"> Editar </html:submit>
                </center>
                    </td>
                </tr>
            </html:form>
        </td>
    </tr>
    </tbody>
</table>