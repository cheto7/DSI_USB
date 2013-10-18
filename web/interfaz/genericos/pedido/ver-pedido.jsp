<%-- 
    Document   : conf-solicitud
    Created on : Mar 30, 2013, 3:45:12 PM
    Author     : ivan
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Mis solicitudes</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<logic:notPresent name="solicitudes">
    <center>
        <label> No ha realizado ninguna solicitud.</label>
    </center>
</logic:notPresent>

<logic:present name="solicitudes">

    <logic:empty name="solicitudes">
        <center>
            <label> No ha realizado ninguna solicitud.</label>
        </center>
    </logic:empty>
    <br>

    <logic:notEmpty name="solicitudes">

        <table class="table table-hover">
            <tbody>
                <tr>
                    <th><center>Número</center></th>
        <th><center>Fecha de realización</center></th>
    <th><center>Estatus</center></th>
    <th><center>Opciones</center></th>
</tr>

<logic:iterate name="solicitudes" id="solicitud">
    <tr>
        <td><center><bean:write name="solicitud" property="id"/></center></td>
        <td><center> <bean:write name="solicitud" property="fecha_solicitud"/> </center></td>
<td>
    <logic:equal name="solicitud" property="modificada" value="true">
    <center> Aprobada </center>
</logic:equal>
<logic:equal name="solicitud" property="modificada" value="false">
    <center> Pendiente </center>
</logic:equal>
</td>
<td>
<center>
    <html:form action="/VerSolicitud" onsubmit="return (this)">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="solicitud" property="fecha_solicitud"/>
        <html:submit styleClass="btn btn-primary"> Ver </html:submit>
    </html:form>
</center>        
</td>
</tr>
</logic:iterate>
</tbody>
</table>

<%--<center>
    <html:form style="float: left; padding-left: 20%" method="POST" action="/ConfirmarEliminarSolicitud?method=save" onsubmit="return (this)">
        <html:submit styleClass="btn btn-primary"> Eliminar solicitud completa </html:submit>
    </html:form>

            <html:form style="float: left; padding-left: 10px" action="/Ir_pag_pedido" onsubmit="return (this)">
                <html:hidden name="autenticado" property="usuario"/>
                <html:hidden name="autenticado" property="password"/>
                <html:submit styleClass="btn btn-info"> Modificar Solicitud </html:submit>
            </html:form>
                
            <html:link action="/Download" target="_blank" >
                <img src="assets/Boton PDF comprobante pedido DEF.png"/>
            </html:link>
        </center>--%>

</logic:notEmpty>    
</logic:present>

