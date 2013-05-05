<%-- 
    Document   : conf-solicitud
    Created on : Feb , 2013, 07:09:27 PM
    Author     : ivan
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<legend>Confirmación de solicitud</legend>

<logic:empty name="solicitud">
    <center>
        <label style="color:red">
            <center>
                Usted no ha ingresado ningún equipo de protección a la solicitud
            </center>
        </label>
    </center>    
</logic:empty>
<logic:notEmpty name="solicitud">
    <label><center> Usted debe confirmar su pedido para continuar.</center> </label>
    <%--<label> En caso que haya olvidado algo, puede volver a modificar su pedido. </label>--%>

    <table class="table table-hover" style="table-layout:fixed">

        <tbody>
            <tr>
                <th width="30%">Equipo</th>
                <th width="10%">Imagen</th>
                <th width="14%"><center>Uso (días)</center></th>
                <th width="13%">Cantidad</th>
                <th width="13%">Talla</th>
                <th colspan="2" width="20%"><center>Opciones</center></th>
</tr>

<%--<bean:write name="usuario" property="usuario"/>--%>
<logic:iterate name="solicitud" id="solicitud">
    <tr>
        <td> <bean:write name="solicitud" property="nombre_vista" /> </td>
        <%--<td> <img src="assets/materiales/img.png" /> </td>--%>
        <%--<td> <img src="<bean:write name="solicitud" property="imagen"/>" /> </td>--%>
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
    <html:form action="/EditarEquipoEnSolicitud" onsubmit="return (this)" style="display: inline">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="solicitud" property="cantidad"/>
        <html:hidden name="solicitud" property="frecuencia"/>
        <html:hidden name="solicitud" property="serialEquipo"/>
        <html:hidden name="solicitud" property="nombre_vista"/> 
        <html:hidden name="solicitud" property="talla"/>
        <html:hidden name="usuario" property="usuario"/>
        <html:submit styleClass="btn btn-primary"> Editar </html:submit>
    </html:form>
</td>
<td>
    <html:form action="/EliminarEquipoEnSolicitud" onsubmit="return (this)">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="solicitud" property="serialEquipo"/>
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
           <html:form action = "/CancelarPedido" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:hidden name="solicitud" property="id"/>
            <html:submit styleClass="btn btn-danger"> Cancelar </html:submit>
            </html:form>
        </td>
        <td>
            <html:form action="/CulminarSolicitud" onsubmit="return (this)">
                <html:hidden name="solicitud" property="id"/>
                <html:submit styleClass="btn btn-success"> Confirmar </html:submit>
            </html:form>
        </td>
    </tr>
</table>
</logic:notEmpty>    
<%--
    <br>
    <center>
        <a class="btn btn-info" href="javascript: history.go(-1)">Modificar Pedido</a>
        <html:submit styleClass="btn btn-primary">
            Confirmar
        </html:submit>
    </center>
    <br>
    <br>
</html:form>
--%>