<%-- 
    Document   : ver-equipo-content
    Created on : 14/07/2013, 07:17:59 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title><tiles:getAsString name="titulo" ignore="true" /></title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/magia.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
            #contenedor {
                float: left;
                width: 800px;
            }

            #tabla1{
                float: left;
                width: 600px;
            }

            #tabla2 {
                float: left;
                width: 200px;
            }

            #tabla1 table, #tabla2 table {
                text-align: center;
            }

            #tabla1 table tr td, #tabla2 table tr td {
                width: 100px
            }
        </style>
    </head>

    <body>
        <fieldset>
            <legend>Datos del equipo de protección</legend>.
            <logic:present name="errorTallaNoAplica">
                <center>
                    <label style="color:red">Error: No aplican tallas al equipo de protección </label>
                </center>
            </logic:present>
            <logic:present name="tallaAgregada">
                <center>
                    <label style="color:blue">Talla registrada satisfactoriamente </label>
                </center>
            </logic:present>                 

            <div id="contenedor">
                <div id="tabla1">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Nombre:</h1>
                                    <bean:write name="equipo" property="nombre_vista"/>
                                </td>
                            </tr> 
                            <tr>
                                <td>
                                    <h1 style="display: inline">Tipo:</h1>
                                    <bean:write name="equipo" property="tipo"></bean:write> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Funcionalidad:</h1>
                                    <bean:write name="equipo" property="funcionalidad"></bean:write>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Norma técnica asociada:</h1>
                                    <bean:write name="equipo" property="norma"></bean:write>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Vida útil: </h1>
                                    <bean:write name="equipo" property="vida_util"></bean:write>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Sector Universitario: </h1>
                                    <bean:write name="equipo" property="sector"></bean:write>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h1 style="display: inline">Tipo de talla:</h1>
                                    <bean:write name="equipo" property="tipo_talla"></bean:write>
                                </td>
                            </tr>                         
                        </tbody>
                    </table>
                </div>
                <div id="tabla2">
                    <center>
                        <img width="100" src="assets/materiales/<bean:write name="equipo" property="nombre_vista"/>.png" />
                    </center>
                </div>
                <!--<div id="tabla2">-->
                <table class="table table-hover">
                    <tbody>
                        <!--<tr>
                            <td colspan="3">
                                <center>
                                    <img width="100" src="assets/materiales/<bean:write name="equipo" property="nombre_vista"/>.png" />
                                </center>
                            </td>
                        </tr>-->                            
                        <tr>
                            <th><center>Talla</center></th>
                            <th><center>Cantidad</center></th>
                            <th></th>
                        </tr>
                        <logic:present name="listaTallas">
                            <logic:notEmpty name="listaTallas">
                                <logic:iterate id="talla" name="listaTallas">

                                    <tr>
                                        <td><center>
                                                <bean:write name="talla" property="talla"/>
                                            </center>
                                        </td>
                                        <td><center>
                                                <bean:write name="talla" property="cantidad"/>
                                            </center>
                                        </td>
                                        <td>
                                            <html:form action = "/CambiarTalla" onsubmit = "return (this)">
                                                <html:hidden name="equipo" property="serial"/>
                                                <html:hidden name="equipo" property="imagen"/>
                                                <html:hidden name="equipo" property="tipo"/>
                                                <html:hidden name="equipo" property="nombre_vista"/>
                                                <html:hidden name="equipo" property="evaluacion"/>
                                                <html:hidden name="equipo" property="funcionalidad"/>
                                                <html:hidden name="equipo" property="sector"/>
                                                <html:hidden name="equipo" property="vida_util"/>
                                                <html:hidden name="equipo" property="tipo_talla"/>
                                                <html:hidden name="equipo" property="norma"/>
                                                <html:hidden name="talla" property="talla"/>
                                                <html:hidden name="talla" property="cantidad"/>
                                                <html:submit styleClass="btn btn-primary">Cambiar</html:submit>
                                            </html:form>
                                        </td>
                                            <td>
                                            <html:form action = "/EliminarTalla" onsubmit = "return (this)">
                                                <html:hidden name="equipo" property="serial"/>
                                                <html:hidden name="equipo" property="imagen"/>
                                                <html:hidden name="equipo" property="tipo"/>
                                                <html:hidden name="equipo" property="nombre_vista"/>
                                                <html:hidden name="equipo" property="evaluacion"/>
                                                <html:hidden name="equipo" property="funcionalidad"/>
                                                <html:hidden name="equipo" property="sector"/>
                                                <html:hidden name="equipo" property="vida_util"/>
                                                <html:hidden name="equipo" property="tipo_talla"/>
                                                <html:hidden name="equipo" property="norma"/>
                                                <html:hidden name="equipo" property="norma"/>
                                                <html:hidden name="talla" property="talla"/>
                                                <html:hidden name="talla" property="cantidad"/>
                                                <html:submit styleClass="btn btn-danger">Eliminar</html:submit>
                                            </html:form>                                                
                                            </td>
                                    </tr>
                                </logic:iterate>
                            </logic:notEmpty>
                        </logic:present>
                    </tbody>
                </table>
                <!--</div>-->
            </div>

            <%--<table align="center">
                <tr>
                    <td>
                        <html:form action = "/FormularioEditarEquipo" onsubmit = "return (this)">
                            <html:hidden name="equipo" property="serial"/>
                            <html:hidden name="equipo" property="imagen"/>
                            <html:hidden name="equipo" property="tipo"/>
                            <html:hidden name="equipo" property="nombre_vista"/>
                            <html:hidden name="equipo" property="cantidad"/>
                            <html:hidden name="equipo" property="evaluacion"/>
                            <html:hidden name="equipo" property="funcionalidad"/>
                            <html:hidden name="equipo" property="sector"/>
                            <html:hidden name="equipo" property="vida_util"/>
                            <html:hidden name="equipo" property="tipo_talla"/>
                            <html:hidden name="equipo" property="norma"/>
                            <html:submit styleClass="btn btn-success"> Editar </html:submit>
                        </html:form>
                    </td>
                </tr>
            </table>--%>
        </fieldset>
    </body>
</html>