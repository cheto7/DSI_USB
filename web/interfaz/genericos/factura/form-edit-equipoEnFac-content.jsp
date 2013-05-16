<%-- 
    Document   : form-edit-equipoEnFac-content
    Created on : May 7, 2013, 6:50:03 PM
    Author     : cheto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Editar Equipo de protección de la factura</legend>
<logic:present name="cantidadNula">
        <center>
            <label style="color:red">Error: El equipo tiene cero unidades solicitadas </label>
        </center>
</logic:present>

<table class="table table-hover">
    <tbody>
    <tr>
        <th>Equipo</th>
        <th>Imagen </th>
        <th>Cantidad</th>
        <th>Talla</th>
    </tr>
    <tr>
        <td>
            <bean:write name="facturado" property="nombre_vista"/>
        </td>
        <td style="">
            <img width="120px" src="assets/materiales/<bean:write name="facturado" property="nombre_vista"/>.png"/>
        </td>
        
            <html:form action = "/ActualizarEquipoEnFactura" acceptCharset="iso-8859-1" onsubmit = "return (this)">
                <html:hidden name="facturado" property="numero_factura"/>
                <html:hidden name="facturado" property="serial"/>
                <html:hidden name="facturado" property="nombre_vista"/>
                <html:hidden name="facturado" property="talla"/>
                
                <td>
                <html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner">
                    <bean:write name="facturado" property="cantidad"/>
                </html:text>
                </td>
                <td>
                    <bean:write name="facturado" property="talla"/>
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