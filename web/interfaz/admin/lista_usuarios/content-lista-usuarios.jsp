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
    
     <h1> Usuarios no habilitados: </h1>

    <logic:notPresent name="usuariosNoHab">
        <center>
            <label>No hay usuarios deshabilitados que mostrar</label>
        </center>
    </logic:notPresent>

    <logic:present name="usuariosNoHab">

        <logic:empty name="usuariosNoHab">
            <center>
                <label>No hay usuarios deshabilitados que mostrar</label>
            </center>
        </logic:empty>

        <logic:notEmpty name="usuariosNoHab">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th>USB-ID</th>
                        <th>Contraseña</th>
                        <th>Modificador</th>
                        <th>Eliminar</th>
                    </tr>

                    <logic:iterate name="usuariosNoHab" id="usuario">

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
                                <html:form action = "/Habilitar" onsubmit = "return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-warning"> Habilitar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form method="POST" action="/ConfirmarEliminar?method=save" onsubmit="return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                </html:form>
                            </td>
                        </tr>

                    </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
     <br>

    <h1> Usuarios habilitados: </h1>

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
                        <th>Modificador</th>
                        <th>Ortorgar Permisos</th>
                        <th>Eliminar</th>
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
                                <html:form action = "/FormularioEditarUsuario" onsubmit = "return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Editar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <%-- html:form action = "/Deshabilitar" onsubmit = "return (this)"--%>
                                <html:form action = "/Formulario_OtorgarPermiso" onsubmit = "return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-warning"> Permisos </html:submit>
                                </html:form>
                            </td>

                            <td>
                                <html:form method="POST" action="/ConfirmarEliminar?method=save" onsubmit="return (this)">
                                    <html:hidden name="usuario" property="usuario"/>                                    
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                </html:form>
                            </td>
                        </tr>

                    </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>

    <br>    

   

</fielset>           	


