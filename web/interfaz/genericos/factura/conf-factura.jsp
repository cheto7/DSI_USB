<%-- 
    Document   : conf-factura
    Created on : Apr 1, 2013, 2:21:34 PM
    Author     : cheto
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<legend>Confirmación de factura</legend>

<logic:empty name="equipos">
    <center>
        <label style="color:red">Usted no ha ingresado ningún equipo de protección a la factura.</label>
    </center>    
</logic:empty>
<logic:notEmpty name="equipos">
<h1>Pedido realizado a:</h1>
<h5><bean:write name="proveedor" property="value"/></h5>
<label> Usted debe validar la factura para que se efectuen los cambios en el sistema. </label>
<%--<label> En caso que haya olvidado algo, puede volver a modificar su pedido. </label>--%>

<table class="table table-hover">
    
    <tbody>
        <tr>
            <th>Equipo</th>
            <th>Imagen</th>
            <th>Cantidad solicitada</th>
            <th>Talla</th>
            <th colspan="2"><center>Opciones</center></th>
        </tr>
        
    <%--<bean:write name="usuario" property="usuario"/>--%>
    <logic:iterate name="equipos" id="equipo">
        <tr>
            <td> <bean:write name="equipo" property="nombre_vista" /> </td>
            <%--<td> <img src="assets/materiales/img.png" /> </td>--%>
            <%--<td> <img src="<bean:write name="solicitud" property="imagen"/>" /> </td>--%>
            <td><img width="70px" src="assets/materiales/<bean:write name="equipo" property="nombre_vista"/>.png" /></td>
            
            <td>
                <center>
                    <bean:write name="equipo" property="cantidad" />
                </center>
            </td>
            <td>
                <center>
                    <bean:write name="equipo" property="talla" />
                </center>
            </td>
            <td>
                <html:form action="/EditarEquipoEnFactura" onsubmit="return (this)" style="display: inline">
                        <html:hidden name="equipo" property="cantidad"/>
                        <html:hidden name="equipo" property="serial"/>
                        <html:hidden name="equipo" property="nombre_vista"/> 
                        <html:hidden name="equipo" property="talla"/>
                        <html:hidden name="equipo" property="tipo_talla"/>
                        <html:hidden name="factura" property="numero_factura"/>
                        <html:submit styleClass="btn btn-primary"> Editar </html:submit>
                </html:form>
            </td>
            <td>
                    <html:form action="/EliminarEquipoEnFactura" onsubmit="return (this)">
                        <html:hidden name="equipo" property="cantidad"/>
                        <html:hidden name="equipo" property="serial"/>
                        <html:hidden name="equipo" property="nombre_vista"/> 
                        <html:hidden name="equipo" property="talla"/>
                        <html:hidden name="factura" property="numero_factura"/>
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
    <%--<html:form action="/Ir_pag_pedido" onsubmit="return (this)">
        <html:submit styleClass="btn btn-primary"> Seguir Agregando </html:submit>
    </html:form>   --%>
    </td>
    <td>
    <html:form action="/ValidarFactura" onsubmit="return (this)">
        <html:hidden name="factura" property="numero_factura"/>
        <html:submit styleClass="btn btn-success"> Validar </html:submit>
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