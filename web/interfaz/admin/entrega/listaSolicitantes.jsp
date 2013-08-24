<%-- 
    Document   : listaSolicitantes
    Created on : 30/03/2013, 04:07:03 PM
    Author     : Azocar
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 


<logic:present name="mensajeUsuarioEditado">
    <logic:notEmpty name="mensajeUsuarioEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/>                
            </label>
        </center>
    </logic:notEmpty>   
</logic:present>

<logic:present name="mensajeUsuarioNoEditado">
    <logic:notEmpty name="mensajeUsuarioNoEditado">
        <center>
            <label style="color:red">Error:<bean:write name="mensajeUsuarioNoEditado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<fieldset>

    <legend>Solicitudes revisadas del período:
        <bean:write name="periodos" property="fecha_inicio"/>
        al
        <bean:write name="periodos" property="fecha_fin"/>
    </legend>

    <logic:notPresent name="listaSolicitudes">
        <label>
            <center> No hay solicitudes de usuarios revisadas por la DSI para este período.</center>
        </label>
    </logic:notPresent>

    <logic:present name="listaSolicitudes">

        <logic:empty name="listaSolicitudes">
            <label>
                <center> No hay solicitudes de usuarios revisadas por la DSI para este período.</center>
            </label>
        </logic:empty>

        <br>

        <logic:notEmpty name="listaSolicitudes">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th>Cédula</th>
                        <th>Usuario</th>
                        <th>Unidad Adscripción</th>
                        <th>Fecha Solicitud</th>
                        <th> </th>
                        <th></th>
                    </tr>

                    <logic:iterate name="listaSolicitudes" id="listaSolicitudes">
                        <tr>
                            <td >
                                <h1>
                                    <%--nombre_vista es usado para escribir la cedula del usuario--%>
                                    <p> <bean:write name="listaSolicitudes" property="nombre_vista"></bean:write></p>
                                </h1>
                            </td>

                            <td>
                                <h1>
                                    <p> <bean:write name="listaSolicitudes" property="nombre_usuario"></bean:write></p>
                                </h1>
                            </td>

                            <td >
                                <h1>
                                    <%--Talla es usado para escribir la unidad de adscripcion--%>
                                    <p> <bean:write name="listaSolicitudes" property="talla"></bean:write></p>
                                </h1>
                            </td>

                            <td>
                                <h1>
                                    <p> <bean:write name="listaSolicitudes" property="fecha_solicitud"></bean:write></p>
                                </h1>
                            </td>

                            <td>
                                <html:form method="POST" action="/hacerEntrega" onsubmit="return (this)">
                                    
                                    <html:hidden name="listaSolicitudes" property="nombre_usuario"/>                                    
                                    <html:hidden name="listaSolicitudes" property="fecha_solicitud"/>                                    
                                    <html:hidden name="listaSolicitudes" property="id"/>
                                    <html:hidden name="listaSolicitudes" property="nombre_vista"/>
                                    <html:hidden name="periodos" property="fecha_fin"/>
                                    <html:hidden name="periodos" property="fecha_inicio"/>
                                    <html:submit styleClass="btn btn-primary"> Solicitud </html:submit>
                                </html:form>
                            </td>
                        </tr>

                       <%-- <%
                            if (request.getAttribute("entregar") != null) {
                                if (request.getAttribute("entregar").equals("Activado")) {
                        %>
                        <tr>
                            <th>Equipo</th>
                            <th>Imagen</th>
                            <th><center>Cantidad solicitada</center></th>
                    <th>Tiene</th>
                    <th><center>Entregar</center></th>
                    <th colspan="2"></th>
                    </tr>

                    <logic:notEmpty name="solicitud">
                        <logic:iterate name="solicitud" id="solicitud">
                            <tr>
                                <html:form action="/entregarEquipo" onsubmit="return (this)">
                                <td> <bean:write name="solicitud" property="equipo" /> </td>
                                <td><img width="70px" src="assets/materiales/<bean:write name="solicitud" property="equipo"/>.png" /></td>
                                <td>
                            <center> 
                                <bean:write name="solicitud" property="cantidad_solicitada" />
                            </center>
                            </td>
                            <td>
                            <center>
                                <bean:write name="solicitud" property="cantidad_entregada" />
                            </center>
                            </td>
                            <td>
                            <center>
                                <html:text name="solicitud" property="cantidad_entregada" style="width:20px" />
                            </center>
                            </td>
                            <td>
                            </td>
                            <td>                               
                                    <html:hidden name="listaSolicitudes" property="fecha_solicitud"/>
                                    <html:hidden name="solicitud" property="id"/>                                    
                                    <html:hidden name="solicitud" property="cantidad_entregada"/>                                    
                                    <html:hidden name="solicitud" property="nombre_usuario"/>
                                    <html:hidden name="solicitud" property="serialEquipo"/>
                                    <html:submit styleClass="btn btn-success"> Entregar</html:submit>
                                </html:form>
                            </td>              
                            </tr>

                        </logic:iterate>
                    </logic:notEmpty>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th> </th>
                        <th></th>
                    </tr>

                    <%
                                request.setAttribute("entregar", "Desactivado");
                            }
                        }
                    %>--%>     

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>
