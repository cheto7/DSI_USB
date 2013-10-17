<%-- 
    Document   : mi-pedido
    Created on : 30/03/2013, 04:25:14 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Solicitud</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<logic:notEmpty name="solicitud">
<table class="table table-hover">
    <tbody>
        <tr>
            <th>Equipo</th>
            <th>Imagen</th>
            <th><center>Frecuencia de uso</center></th>
<th>Cantidad solicitada</th>
<th>Talla</th>
</tr>
<logic:iterate name="solicitud" id="solicitud">
    <tr>
        <td> <bean:write name="solicitud" property="nombre_vista" /> </td>
        <td><img width="50px" src="assets/materiales/<bean:write name="solicitud" property="nombre_vista"/>.png" /></td>
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
</tr>
</logic:iterate>
</tbody>
</table>
<center>
    <html:form action="/Download" onsubmit="return (this)">
        <html:hidden name="solicitud" property="id"/>
        <input type="image" src="assets/Boton PDF comprobante pedido DEF.png" alt="Descargar comprobante" />
    </html:form>
</center>
</logic:notEmpty>
<logic:empty name="solicitud">
    <center>
        <span style="color:red">No hay equipos en la solicitud.</span>
    </center>
</logic:empty>