<%-- 
    Document   : ver_proveedor
    Created on : 02/02/2013, 05:46:41 PM
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
        <%--<logic:present name="mensajeProveedorEditado">
            <logic:notEmpty name="mensajeProveedor">
                <center>
                    <label style="color:blue"><bean:write name="mensajeProveedorEditado" property="mensaje"/>
                        '<bean:write name="editada" property="titulo"/>'
                        ha sido modificado.
                    </label>
                </center>
            </logic:notEmpty>
        </logic:present>--%>

        <fieldset>
            <legend>Proveedor</legend> 

                    <logic:notEmpty name="proveedor">
                        
                        
                        <table class="table table-hover">
                            <tbody>
                                    <tr>
                                        <td>
                                            <h1 style="display: inline">Nombre/Razón social:</h1>
                                             <bean:write name="proveedor" property="nombre"></bean:write>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h1 style="display: inline">Rif: </h1>
                                            <bean:write name="proveedor" property="rif"></bean:write>
                                            
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <h1 style="display: inline">Email:</h1>
                                            <bean:write name="proveedor" property="email"></bean:write>
                                        </td>
                                     </tr>
                                     <tr>
                                        <td>
                                            <h1 style="display: inline">Contacto:</h1>
                                            <bean:write name="proveedor" property="contacto"></bean:write>
                                        </td>
                                     </tr>
                                      <tr>
                                        <td>
                                            <h1 style="display: inline">Dirección:</h1>
                                            <bean:write name="proveedor" property="direccion"></bean:write>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td>
                                            <h1 style="display: inline">Teléfono: </h1>
                                            <bean:write name="proveedor" property="telefono"></bean:write>
                                        </td>
                                      </tr>
                            </tbody>
                        </table>
                        <table align="center">
                            <tr>
                                <td>
                                <html:form action = "/FormularioEditarProveedor" onsubmit = "return (this)">
                                    <html:hidden name="proveedor" property="rif"/>
                                    <html:hidden name="proveedor" property="nombre"/>
                                    <html:hidden name="proveedor" property="email"/>
                                    <html:hidden name="proveedor" property="telefono"/>
                                    <html:hidden name="proveedor" property="contacto"/>
                                    <html:hidden name="proveedor" property="direccion"/>
                                    <html:submit styleClass="btn btn-primary"> Editar </html:submit>
                                </html:form>
                                </td>
                                <td>
                                <html:form action = "/ConfirmarEliminarProveedor" onsubmit = "return (this)">
                                    <html:hidden name="proveedor" property="rif"/>
                                    <html:hidden name="proveedor" property="nombre"/>
                                    <html:hidden name="proveedor" property="email"/>
                                    <html:hidden name="proveedor" property="contacto"/>
                                    <html:hidden name="proveedor" property="telefono"/>
                                    <html:hidden name="proveedor" property="direccion"/>
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                 </html:form>
                                </td>
                            </tr>
                        </table>
                    </logic:notEmpty>
        </fieldset>

    </body>
</html>