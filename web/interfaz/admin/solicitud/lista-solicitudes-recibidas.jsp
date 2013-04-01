<%-- 
    Document   : lista-solicitudes-recibidas
    Created on : 27/02/2013, 11:57:47 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<fieldset>
    <legend>Lista de Solicitudes recibidas</legend>
    <h1 style="display: inline">Fecha inicio: </h1><bean:write name="periodo" property="fecha_inicio"></bean:write><br>
    <h1 style="display: inline">Fecha fin: </h1> <bean:write name="periodo" property="fecha_fin"></bean:write><br>
    <%--<h1 style="display: inline">Solicitudes recibidas: </h1><bean:write name="periodo" property="cantidadRecibida"></bean:write><br>
    <h1 style="display: inline">Solicitudes procesadas: </h1><bean:write name="periodo" property="cantidadProcesada"></bean:write><br>--%>
    <h1 style="display: inline">Estado: </h1><logic:equal name="periodo" property="habilitado" value="true">
            Abierto
            </logic:equal>
            <logic:equal name="periodo" property="habilitado" value="false">
            Cerrado
            </logic:equal>            
    
</fieldset>
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Sin modificar</a></li>
        <li><a href="#tabs-2">Modificadas</a></li>
    </ul>
    

    <div id="tabs-1">
        <logic:present name="noHayNoModificadas">
            <center>
                <label>No hay solicitudes pendientes por modificar</label>
            </center>
        </logic:present>
        <logic:notEmpty name= "solNoModificadas">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Solicitud</center></th>
                <th><center>Usuario</center></th>
                <th><center>Fecha de elaboración</center></th>
                <th><center>Opciones</center></th>
                </tr>
                <logic:iterate name="solNoModificadas" id="solNoModificadas">
                    <tr>
                        <td>
                            <p> <bean:write name="solNoModificadas" property="id"></bean:write></p>
                        </td>
                        <td>
                            <p> <bean:write name="solNoModificadas" property="nombre_usuario"></bean:write></p>
                        </td>
                        <td>
                            <p> <bean:write name="solNoModificadas" property="fecha_solicitud"></bean:write></p>
                        </td>
                        <td>
                            <html:form action="/VerSolicitudRecibida" onsubmit="return (this)">
                                <html:hidden name="solNoModificadas" property="id"/>
                                <html:hidden name="solNoModificadas" property="fecha_solicitud"/>
                                <html:submit styleClass="btn btn-primary"> Ver </html:submit>
                            </html:form>
                        </td>
                    </tr>
                </logic:iterate>
                </tbody>                
            </table>                
        </logic:notEmpty>
                       
        
    </div>
    <div id="tabs-2">
        <logic:present name="noHayModificadas">
            <center>
                <label>No hay solicitudes modificadas</label>
            </center>
        </logic:present>
        <logic:notEmpty name= "solModificadas">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Solicitud</center></th>
                        <th><center>Usuario</center></th>
                        <th><center>Fecha de elaboración</center></th>
                        <th><center>Opciones</center></th>
                </tr>
                    <logic:iterate name="solModificadas" id="solModificadas">
                        <tr>
                            <td>
                                <p> <bean:write name="solModificadas" property="id"></bean:write></p>
                            </td>
                            <td>
                                <p> <bean:write name="solModificadas" property="nombre_usuario"></bean:write></p>
                            </td>
                            <td>
                                <p> <bean:write name="solModificadas" property="fecha_solicitud"></bean:write></p>
                            </td>
                            <td>
                                <html:form action="/VerSolicitudRecibida" onsubmit="return (this)">
                                    <html:hidden name="solModificadas" property="id"/>
                                    <html:hidden name="solModificadas" property="fecha_solicitud"/>
                                    <html:submit styleClass="btn btn-primary"> Ver </html:submit>
                                </html:form>
                            </td>
                        </tr>
                    </logic:iterate>
                </tbody>
            </table>                
        </logic:notEmpty>
    </div>   
</div>
</html>