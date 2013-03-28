<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<logic:present name="mensajeUsuarioEditado">
    <logic:notEmpty name="mensajeUsuarioEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/>
                <bean:write name="usuario" property="usuario"/> han sido modificados.
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
    <legend>Lista de Usuarios</legend> 

    <h1> Usuarios Sin Privilegios: </h1>

    <logic:notPresent name="usuariosHab">
        <center>
            <label> No hay usuarios habilitados que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="usuariosHab">

        <logic:empty name="usuariosHab">
            <center>
                <label> No hay usuarios habilitados que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="usuariosHab">
            <table class="table table-hover"> 
                <tbody>
                    <tr>
                        <th>USB-ID</th>
                        <th>Contraseña</th>
                        <%--<th></th>--%>
                        <th colspan="3"><center>Ortorgar Permiso</center></th>
                        <%--<th></th>--%>
                </tr>

                <logic:iterate name="usuariosHab" id="usuario">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="usuario" property="usuario"></bean:write></p>
                                </h1>
                            </td>

                            <td>
                                <p> <bean:write name="usuario" property="password"></bean:write> </p>
                            </td>

                            <td >
                            <html:form action = "/otorgarPermisoSupervisor" onsubmit = "return (this)">
                                <html:hidden name="usuario" property="usuario"/>
                                <html:hidden name="autenticado" property="usuario"/>
                                <html:submit styleClass="btn btn-success"> Supervisor </html:submit>
                            </html:form> 
                        </td>

                        <td>
                            <html:form action = "/otorgarPermisoInspector" onsubmit = "return (this)">                                
                                <html:hidden name="usuario" property="usuario"/>
                                <html:hidden name="autenticado" property="usuario"/>
                                <html:submit styleClass="btn btn-warning"> Inspector </html:submit>
                            </html:form>
                        </td>

                        <td>
                            <html:form action = "/Deshabilitar" onsubmit = "return (this)">                                
                                <html:hidden name="usuario" property="usuario"/>
                                <html:hidden name="autenticado" property="usuario"/>
                                <html:submit styleClass="btn btn-danger"> Deshabilitar </html:submit>
                            </html:form>
                        </td>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>

    <br>   

    <h1> Unidades Adscripción: </h1>

   

    <legend>Noticias</legend> 

    <logic:notPresent name="unidadAdscripcion">
        <label>
            <center> No hay noticias que mostrar.</center>
        </label>
    </logic:notPresent>

    <logic:present name="unidadAdscripcion">

        <logic:empty name="unidadAdscripcion">
            <label>
                <center> No hay noticias que mostrar.</center>
            </label>
        </logic:empty>

        <logic:iterate name="unidadAdscripcion" id="unidadAdscripcion">

            <h1>
                <p style="float:left; font-size: 15px;"> <bean:write name="unidadAdscripcion" property="nombre"></bean:write> </p>
                <bean:write name="unidadAdscripcion" property="nombre"></bean:write>
            </h1>
                        
                <br><br><br>
        </logic:iterate>
    </logic:present>




    <br>   

    </fielset>           	


