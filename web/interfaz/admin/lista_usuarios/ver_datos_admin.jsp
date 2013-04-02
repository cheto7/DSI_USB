<%-- 
    Document   : ver_datos_admin
    Created on : 06/03/2013, 08:30:40 PM
    Author     : ivan
--%>

<%@page import="Editar.Habilitar"%>
<%@page import="java.lang.String"%>
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
        <script type="text/javascript" src="assets/js/ajax.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <fieldset>
            <legend>Datos de usuario </legend> 
            <div id="MensajeHabilitacion"></div>
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
                            <h1 style="display: inline">Fecha de nacimiento:</h1>
                            <bean:write name="Usuario" property="fecha"></bean:write>
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
                            <h1 style="display: inline">Unidad de adscripción:</h1>
                            <bean:write name="Usuario" property="unidad_adscripcion"></bean:write>
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
                    <tr>
                        <td>
                            <h1 style="display: inline">Permisos: </h1>
                            <bean:write name="Usuario" property="administrador"></bean:write>
                        </td>
                    </tr>                        

                </tbody>
            </table>
            <table align="center">
                <tr>
                    <%--<td> <h1 style="display: inline">Modificar datos: </h1></td>--%>
                    <td>
                        <br>
                        <html:form action = "/FormularioEditarUsuarioAdmin" onsubmit = "return (this)">
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
                            <html:hidden name="Usuario" property="apellido"/>
                            <html:hidden name="Usuario" property="telefono"/>
                            <html:hidden name="Usuario" property="unidad_adscripcion"/>
                            <html:hidden name="Usuario" property="administrador"/>
                            <html:hidden name="Usuario" property="area_laboral"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <html:submit styleClass="btn btn-primary"> Editar datos </html:submit>
                        </html:form>
                    </td>
                    <td>
                        <br>
                        <html:form method="POST" action="/ConfirmarEliminar?method=save" onsubmit="return (this)">
                            <html:hidden name="Usuario" property="usuario"/>                            
                            <html:submit styleClass="btn btn-danger"> Eliminar</html:submit>
                        </html:form>
                    </td>
                    <td>
                        <logic:present name="usuarioDeshabilitado">
                                <input name="<bean:write name="Usuario" property="usuario"/>" 
                                       id="BotonHabilitar" type="button" 
                                       class="btn btn-success" 
                                       value="Habilitar" 
                                       onclick="Habilitar(this.name)"/>
                        </logic:present>
                        <logic:present name="usuarioHabilitado">
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonDeshabilitar" 
                                   type="button" 
                                   class="btn btn-warning" 
                                   value="Deshabilitar" 
                                   onclick="Deshabilitar(this.name)"/>
                        </logic:present>
                    </td>
                </tr>
                <%--<tr>
                    <select>
                        <option name="<bean:write name="Usuario" property="usuario"/>" 
                                id="BotonUsuario"
                                value="Usuario"
                                onclick="serUsuario(this.name)">
                                Usuario
                        </option>
                        <option name="<bean:write name="Usuario" property="usuario"/>" 
                                id="BotonSupervisor"
                                value="Usuario"
                                onclick="serSupervisor(this.name)">
                                Supervisor
                        </option>
                        <option name="<bean:write name="Usuario" property="usuario"/>" 
                                id="BotonInspector"
                                value="Usuario"
                                onclick="serInspector(this.name)">
                                Inspector
                        </option>
                        <option name="<bean:write name="Usuario" property="usuario"/>" 
                                id="BotonAdministrador"
                                value="Usuario"
                                onclick="serAdministrador(this.name)">
                                Administrador
                        </option>
                    </select>
                </tr>--%>
                <%--<tr>
                    <td> <h1 style="display: inline">Permisos: </h1></td>
                    <logic:present name="usuarioUsuario">
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonUsuario" 
                                   type="button" 
                                   class="btn btn-success" 
                                   value="Usuario" 
                                   onclick="serUsuario(this.name)"
                                   disabled ="true"/>
                        </td>
                        <td>       
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonSupervisor" 
                                   type="button" 
                                   class="btn btn-primary" 
                                   value="Supervisor" 
                                   onclick="serSupervisor(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonInspector" 
                                   type="button" 
                                   class="btn btn-warning" 
                                   value="Inspector" 
                                   onclick="serInspector(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonAdministrador" 
                                   type="button" 
                                   class="btn btn-danger" 
                                   value="Administrador" 
                                   onclick="serAdministrador(this.name)"/> 
                        </td>
                    </logic:present>

                    <logic:present name="usuarioSupervisor">
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonUsuario" 
                                   type="button" 
                                   class="btn btn-success" 
                                   value="Usuario" 
                                   onclick="serUsuario(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonSupervisor" 
                                   type="button" 
                                   class="btn btn-primary" 
                                   value="Supervisor" 
                                   onclick="serSupervisor(this.name)"
                                   disabled ="true"/>
                        </td>       
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonInspector" 
                                   type="button" 
                                   class="btn btn-warning" 
                                   value="Inspector" 
                                   onclick="serInspector(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonAdministrador" 
                                   type="button" 
                                   class="btn btn-danger" 
                                   value="Administrador" 
                                   onclick="serAdministrador(this.name)"/> 
                        </td>
                    </logic:present>
                    <logic:present name="usuarioInspector">
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonUsuario" 
                                   type="button" 
                                   class="btn btn-success" 
                                   value="Usuario" 
                                   onclick="serUsuario(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonSupervisor" 
                                   type="button" 
                                   class="btn btn-primary" 
                                   value="Supervisor" 
                                   onclick="serSupervisor(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonInspector" 
                                   type="button" 
                                   class="btn btn-warning" 
                                   value="Inspector" 
                                   onclick="serInspector(this.name)"
                                   disabled ="true"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonAdministrador" 
                                   type="button" 
                                   class="btn btn-danger" 
                                   value="Administrador" 
                                   onclick="serAdministrador(this.name)"/>  
                        </td>
                    </logic:present>
                    <logic:present name="usuarioAdministrador">
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonUsuario" 
                                   type="button" 
                                   class="btn btn-success" 
                                   value="Usuario" 
                                   onclick="serUsuario(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonSupervisor" 
                                   type="button" 
                                   class="btn btn-primary" 
                                   value="Supervisor" 
                                   onclick="serSupervisor(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonInspector" 
                                   type="button" 
                                   class="btn btn-warning" 
                                   value="Inspector" 
                                   onclick="serInspector(this.name)"/>
                        </td>
                        <td>
                            <input name="<bean:write name="Usuario" property="usuario"/>" 
                                   id="BotonAdministrador" 
                                   type="button" 
                                   class="btn btn-danger" 
                                   value="Administrador" 
                                   onclick="serAdministrador(this.name)"
                                   disabled ="true"/>
                        </td>
                    </logic:present>
                </tr>--%>
            </table>
        </fieldset>
    </body>
</html>
