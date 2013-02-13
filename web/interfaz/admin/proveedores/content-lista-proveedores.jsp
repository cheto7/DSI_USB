<%-- 
    Document   : content-lista-proveedores
    Created on : 31/01/2013, 11:46:06 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><tiles:getAsString name="titulo" ignore="true" /></title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/magia.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    </head>


    <body>
        <fieldset>
            <legend>Lista de Proveedores</legend>
            <logic:present name="mensajeProveedorAgregado">
                <center>
                    <label> Proveedor AGREGADO satisfactoriamente</label>
                </center>
            </logic:present>
            <logic:present name="mensajeProveedorEliminado">
                <center>
                    <label> Proveedor ELIMINADO satisfactoriamente</label>
                </center>
            </logic:present>

            <logic:notPresent name="proveedores">
                <center>
                    <label> No hay Proveedores guardados.</label>
                </center>
            </logic:notPresent>

            <logic:present name="proveedores">

                <logic:empty name="proveedores">
                    <center>
                        <label> No hay Proveedores guardados.</label>
                    </center>
                </logic:empty>

                    <logic:notEmpty name="proveedores">
                        
                        
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th><center>Nombre</center></th>
                                    <th><center>Rif</center></th>
                                    <th><center>Opciones</center></th>
                                </tr>

                                <logic:iterate name="proveedores" id="proveedor">
                                    <tr>
                                        <td>
                                            <h1>
                                                <p> <bean:write name="proveedor" property="nombre"></bean:write> </p>
                                            </h1>
                                        </td>

                                        <td>
                                            <center>
                                                <p> <bean:write name="proveedor" property="rif"></bean:write></p>
                                            </center>
                                        </td>

                                        <td>
                                            <center>
                                                <html:form action="/VerProveedor" onsubmit="return (this)">
                                                    <html:hidden name="proveedor" property="rif"/>
                                                    <html:hidden name="proveedor" property="nombre"/>
                                                    <html:hidden name="proveedor" property="email"/>
                                                    <html:hidden name="proveedor" property="contacto"/>
                                                    <html:hidden name="proveedor" property="telefono"/>
                                                    <html:hidden name="proveedor" property="direccion"/>
                                                    <html:submit styleClass="btn btn-success"> Ver </html:submit>
                                                </html:form>
                                            </center>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </tbody>
                        </table>
                    </logic:notEmpty>
                </logic:present>
        </fieldset>
    </body>
</html>