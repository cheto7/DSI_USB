<%-- 
    Document   : solicitudUsuario
    Created on : 05/08/2013, 08:56:10 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<legend>Solicitud de usuario</legend>
<label style="color:blue">
    <center>
        <p id="Parrafo">Una vez registrada la entrega de equipos no se podrá dehacer.</p>
    </center>                    
</label>
<logic:present name="noHayEquipo">
    <center>
        <label style="color:red">
            <p id="Parrafo">No hay cantidad disponible para este equipo.</p>
        </label>
    </center>
</logic:present>
<logic:present name="errorFormulario">
    <center>
        <label style="color:red">
            <p id="Parrafo">Debe introducir una cantidad mayor a cero.</p>
        </label>
    </center>
</logic:present>
<logic:present name="mensajeUsuarioEditado">
    <logic:notEmpty name="mensajeUsuarioEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="mensajeUsuarioNoEditado">
    <logic:notEmpty name="mensajeUsuarioNoEditado">
        <center>
            <label style="color:red"><bean:write name="mensajeUsuarioNoEditado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>


<table class="table table-hover" width="100%">
    <tbody>
        <tr>
            <th width="35%">Equipo</th>
            <th width="15%">Imagen</th>
            <th>Talla</th>
            <th><center>Solicitada</center></th>
            <th>Entregada</th>
            <th><center>Entregar</center></th>
            <th colspan="2"></th>
        </tr>

<logic:notEmpty name="solicitud">
    <logic:iterate name="solicitud" id="solicitud">
        <tr>
            <html:form action="/entregarEquipo" onsubmit="return (this)">
                <td> <bean:write name="solicitud" property="equipo" /> </td>
                <td><img width="70px" src="assets/materiales/<bean:write name="solicitud" property="equipo"/>.png" /></td>
                <td>
                    <bean:write name="solicitud" property="talla"/>
                </td>
                <td>
                    <center> 
                        <bean:write name="solicitud" property="cantidad_solicitada" />
                    </center>
                </td>
        <td>
        <center>
            <bean:write name="solicitud" property="cantidad_entregada" />
        </center>
    </td>
    <td>
    <center>
        <html:text name="solicitud" property="cantidad_entregada" style="width:20px" />
    </center>
</td>
<td>
</td>
<td>
    <html:hidden name="solicitud" property="idSolicitud"/>                                    
    <html:hidden name="solicitud" property="usuario"/>
    <html:hidden name="solicitud" property="serialEquipo"/>
    <html:hidden name="solicitud" property="fecha_solicitud"/>
    <html:hidden name="periodos" property="fecha_inicio"/>
    <html:hidden name="periodos" property="fecha_fin"/>
    <html:submit styleClass="btn btn-success"> Entregar</html:submit>
</html:form>
</td>              
</tr>

</logic:iterate>
</logic:notEmpty>
</tbody>
</table>
<center>
    <html:form action="/DownloadEntregaPDF" onsubmit="return (this)">
        <html:hidden name="solicitud" property="idSolicitud"/>
        <input type="image" src="/assets/BotonPDFEntrega.png" alt="Descargar comprobante de entrega" />
    </html:form>
</center>