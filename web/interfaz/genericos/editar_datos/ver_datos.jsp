<%-- 
    Document   : ver_datos
    Created on : 06/03/2013, 02:33:24 PM
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
            <legend>Datos Personales</legend> 

            <table class="table table-hover">
                <tbody>
                    <tr>
                        <td>
                            <h1 style="display: inline">Nombre de usuario:</h1>
                            <bean:write name="Usuario" property="usuario"></bean:write>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <h1 style="display: inline">Nombres y Apellidos:</h1>
                            <bean:write name="Usuario" property="nombre"></bean:write> 
                            <bean:write name="Usuario" property="apellido"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Fecha de ingreso a la USB:</h1>
                            <bean:write name="Usuario" property="unidad_adscripcion"></bean:write>
                            </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Sexo:</h1>
                            <bean:write name="Usuario" property="sexo"></bean:write>
                        </td>
                    </tr>                            
                    <tr>
                        <td>
                                <h1 style="display: inline">Email: </h1>
                            <bean:write name="Usuario" property="email"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Teléfono: </h1>
                            <bean:write name="Usuario" property="telefono"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Área laboral: </h1>
                            <bean:write name="Usuario" property="area_laboral"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Talla máscara: </h1>
                            <bean:write name="Usuario" property="talla_mascara"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Talla camisa: </h1>
                            <bean:write name="Usuario" property="talla_camisa"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Talla pantalón: </h1>
                            <bean:write name="Usuario" property="talla_pantalon"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Talla guantes: </h1>
                            <bean:write name="Usuario" property="talla_guantes"></bean:write>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h1 style="display: inline">Talla zapatos: </h1>
                            <bean:write name="Usuario" property="talla_zapato"></bean:write>
                        </td>
                    </tr>

                </tbody>
            </table>
            <table align="center">
                <tr>
                    <td>
                        <html:form action = "/FormularioEditarUsuario" onsubmit = "return (this)">
                            <html:hidden name="Usuario" property="usuario"/>
                            <html:hidden name="Usuario" property="nombre"/>
                            <html:hidden name="Usuario" property="email"/>
                            <html:hidden name="Usuario" property="password"/>
                            <html:hidden name="Usuario" property="fecha"/>
                            <html:hidden name="Usuario" property="sexo"/>
                            <html:hidden name="Usuario" property="talla_mascara"/>
                            <html:hidden name="Usuario" property="talla_camisa"/>
                            <html:hidden name="Usuario" property="talla_pantalon"/>
                            <html:hidden name="Usuario" property="talla_guantes"/>
                            <html:hidden name="Usuario" property="talla_zapato"/>
                            <html:hidden name="Usuario" property="habilitado"/>
                            <html:hidden name="Usuario" property="apellido"/>
                            <html:hidden name="Usuario" property="telefono"/>
                            <html:hidden name="Usuario" property="habilitado"/>
                            <html:hidden name="Usuario" property="administrador"/>
                            <html:hidden name="Usuario" property="area_laboral"/>
                            <html:hidden name="Usuario" property="unidad_adscripcion"/>
                            <html:submit styleClass="btn btn-primary"> Editar mis datos </html:submit>
                        </html:form>
                    </td>
                </tr>
            </table>
        </fieldset>

    </body>
</html>
