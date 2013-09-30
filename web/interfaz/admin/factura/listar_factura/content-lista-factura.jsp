<%-- 
    Document   : content-lista-factura
    Created on : Mar 20, 2013, 7:49:41 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Dirección de Seguridad Integral</title>
<script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/scroll-startstop.events.jquery.js"></script>
<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/jquery-ui.css" />

<html>

<fieldset>
    <legend>Lista de facturas</legend> 
    
    <logic:present name="no_eliminado">
        <center>
            <label style="color:red"> No pudo ser eliminado.</label>
        </center>
    </logic:present>
    <logic:present name="noHayEquipos">
        <center>
            <label style="color:red">La factura no tiene ningún equipo</label>
        </center>
    </logic:present>    
    
    <logic:present name="eliminado">
        <center>
            <label style="color:blue"> Se eliminó satisfactoriamente la factura.</label>
        </center>
    </logic:present>    
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">No validadas</a></li>
            <li><a href="#tabs-2">Validadas</a></li>
        </ul>
        <div id="tabs-1">
            <logic:present name="facturasNoValidadas">
            <logic:notEmpty name="facturasNoValidadas">
            <table class="table table-hover" width="100%" >
                <tbody>
                    <tr>
                        <th width="20%"><center>Fecha</center></th>
                        <th width="50%" ><center>Proveedor</center></th>
                        <th width="30%" colspan="2"><center>Opciones</center></th>
                    </tr>

                <logic:iterate name="facturasNoValidadas" id="factura">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="factura" property="fecha"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <p> <bean:write name="factura" property="proveedor"></bean:write> </p>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/FormularioEditarFactura" onsubmit = "return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-primary"> Ver </html:submit>
                        </html:form> 
                    </center>
                    </td>
                    
                        <td>
                    <center>
                        <html:form action = "/EliminarFactura" onsubmit = "return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                        </html:form> 
                    </center>
                    </td>

                    <%--<td>
                    <center>
                        <html:form action="/ValidarFactura" onsubmit="return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-success"> Validar </html:submit>
                        </html:form>
                    </center>
                    </td>--%>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
        <logic:empty name="facturasNoValidadas">
            <center>
                <label> No hay facturas sin validar.</label>
            </center>
        </logic:empty>
        </logic:present>
        </div>
        <!--==================== Facturas Validadas =======================-->
        <div id="tabs-2">
            <logic:present name="facturasValidadas">
            <logic:notEmpty name="facturasValidadas">
            <table class="table table-hover" width="100%">
                <tbody>
                    <tr>
                        <th width="20%"><center>Fecha</center></th>
                        <th width="60%"><center>Proveedor</center></th>
                        <th width="20%"><center>Modificar</center></th>
                    </tr>

                <logic:iterate name="facturasValidadas" id="factura">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="factura" property="fecha"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <p> <bean:write name="factura" property="proveedor"></bean:write> </p>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/VerFactura" onsubmit = "return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-primary"> Ver </html:submit>
                        </html:form> 
                    </center>
                    </td>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
        <logic:empty name="facturasValidadas">
            <center>
                <label> No hay facturas validadas.</label>
            </center>
        </logic:empty>
        </logic:present>            
        </div>
</fieldset>
</html>