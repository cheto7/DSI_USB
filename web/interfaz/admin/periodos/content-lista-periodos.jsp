<%-- 
    Document   : content-lista-periodos
    Created on : 30/03/2013, 07:48:48 PM
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
        <script type="text/javascript" src="assets/js/ajax.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    </head>
<fieldset>
    <legend>Períodos de Solicitud de equipos</legend>
    <div id="MensajeCerrado"></div>
    <logic:present name="existeActivo">
        <center>
            <label style="color:red">
                <p id="Parrafo">Ya existe período de solicitud abierto.</p>
            </label>
        </center>
    </logic:present>
    <logic:present name="periodoAbierto">
        <center>
            <label style="color:blue">
                <p id="Parrafo">Período abierto satisfactoriamente. Habilitado
                 el sistema para recibir solicitudes.
                 </p>
            </label>
        </center>
    </logic:present>    
    <logic:empty name="periodos">
        <center>
            <label> No hay períodos en el hisotrial del sistema.</label>
        </center>
    </logic:empty>

    <logic:present name="periodos">

        <logic:notEmpty name="periodos">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Inicio</center></th>
                        <th><center>Fin</center></th>
                        <%--<th><center>Sol. Recibidas</center></th>
                        <th><center>Sol. Evaluadas</center></th>--%>
                        <th><center>Estado</center></th>
                        <th colspan="2"><center>Opciones</center></th>
                    </tr>

                <logic:iterate name="periodos" id="periodo">

                    <tr>
                        <td>
                            <center>
                            <p> <bean:write name="periodo" property="fecha_inicio"></bean:write></p>
                            </center>
                        </td>

                        <td>
                            <center>
                            <p> <bean:write name="periodo" property="fecha_fin"></bean:write></p>
                            </center>
                        </td>

                        <%--<td>
                    <center>
                        <p> <bean:write name="periodo" property="cantidadRecibida"></bean:write></p>
                    </center>
                    </td>

                    <td>
                    <center>
                        <p> <bean:write name="periodo" property="cantidadProcesada"></bean:write></p>
                    </center>
                    </td>--%>

                    <td>
                    <center>
                        <logic:equal name="periodo" property="ultimo" value="false">
                            <logic:equal name="periodo" property="habilitado" value="true">
                                Abierto
                            </logic:equal>
                            <logic:equal name="periodo" property="habilitado" value="false">
                                Cerrado
                            </logic:equal>
                        </logic:equal>
                        <logic:equal name="periodo" property="ultimo" value="true">
                              <div id="Estado<bean:write name="periodo" property="id"/>">
                                <logic:equal name="periodo" property="habilitado" value="true">
                                    Abierto
                                </logic:equal>
                                <logic:equal name="periodo" property="habilitado" value="false">
                                    Cerrado
                                </logic:equal>
                              </div>
                        </logic:equal>
                    </center>
        
                    
                    
                    </td>
                    <td>
                        <center>
                            <logic:equal name="periodo" property="ultimo" value="true">
                                <logic:equal name="periodo" property="habilitado" value="true">
                                    <input name="<bean:write name="periodo" property="id"/>" 
                                           id="<bean:write name="periodo" property="id"/>" type="button" 
                                           class="btn btn-warning" 
                                           value="Cerrar" 
                                           onclick="Cerrar(this.name)"/>
                                </logic:equal>
                                <logic:equal name="periodo" property="habilitado" value="false">
                                    <input name="<bean:write name="periodo" property="id"/>" 
                                           id="<bean:write name="periodo" property="id"/>" type="button" 
                                           class="btn btn-success" 
                                           value="Reabrir" 
                                           onclick="ReAbrir(this.name)"/>
                                </logic:equal>
                            </logic:equal>
                         </center>
                    </td>
                    <td>
                        <html:form action="/ListarSolicitudes" onsubmit="return (this)">
                            <html:hidden name="periodo" property="id"/>
                            <html:submit styleClass="btn btn-primary">Solicitudes</html:submit>
                        </html:form>
                    </td>
                    </tr>
                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>
</html>
