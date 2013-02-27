<%-- 
    Document   : conf-solicitud
    Created on : Nov 4, 2012, 2:19:41 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Confirmación de solicitud</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<h1>Pedido realizado por:</h1>
<%--<h5><bean:write name="Pedido" property="usuario"/></h5>--%>
<h5><bean:write name="usuario" property="usuario"/></h5>
<label> Usted debe confirmar su pedido para continuar. </label>
<%--<label> En caso que haya olvidado algo, puede volver a modificar su pedido. </label>--%>

<table class="table table-hover">
    
    <tbody>
        <tr>
            <th>Equipo</th>
            <th>Imagen</th>
            <th>Frecuencia de uso (días)</th>
            <th>Cantidad solicitada</th>
            <th>Talla</th>
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
        </tr>
    </logic:iterate>
    </tbody>
    </table>
    
    <table align="center">
        <tr>
            <td>
    <html:form action="/Ir_pag_pedido" onsubmit="return (this)">
        <html:submit styleClass="btn btn-primary"> Seguir Agregando </html:submit>
    </html:form>        
    </td>
    <td>
    <html:form action="/CulminarSolicitud" onsubmit="return (this)">
        <html:submit styleClass="btn btn-primary"> Confirmar </html:submit>
    </html:form>
        </td>
    </tr>
</table>
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