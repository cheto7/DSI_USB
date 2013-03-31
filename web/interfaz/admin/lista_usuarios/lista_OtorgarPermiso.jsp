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
                        <th>CI</th>
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
                                    <p> <bean:write name="usuario" property="ci"></bean:write> </p>
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
    
    <h1> Usuarios Supervisores: </h1>

    <logic:notPresent name="supervisores">
        <center>
            <label> No hay usuarios habilitados que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="supervisores">

        <logic:empty name="supervisores">
            <center>
                <label> No hay usuarios habilitados que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="supervisores">
            <table class="table table-hover"> 
                <tbody>
                    <tr>
                        <th>USB-ID</th>
                        <th>CI</th>
                        <th>Ortorgar Permiso</th>
                        <th>Quitar Permiso</th>
                        <th>Deshabilitar</th>
                    </tr>

                    <logic:iterate name="supervisores" id="usuario">

                        <tr>
                            <td >
                                <h1>
                                    <p> <bean:write name="usuario" property="usuario"></bean:write></p>
                                    </h1>
                                </td>

                                <td>
                                    <p> <bean:write name="usuario" property="ci"></bean:write> </p>
                                </td>

                                <td >
                                <html:form action = "/otorgarPermisoInspector" onsubmit = "return (this)">                                
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Inspector </html:submit>
                                </html:form>
                            </td>

                            <td>
                                <html:form action = "/removerPrivilegios" onsubmit = "return (this)">                                
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-warning"> Remover </html:submit>
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
    
    <h1> Usuarios Inspectores </h1>

    <logic:notPresent name="inspectores">
        <center>
            <label> No hay usuarios habilitados que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="inspectores">

        <logic:empty name="inspectores">
            <center>
                <label> No hay usuarios habilitados que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="inspectores">
            <table class="table table-hover"> 
                <tbody>
                    <tr>
                        <th>USB-ID</th>
                        <th>CI</th>
                        <th>Ortorgar Permiso</th>
                        <th>Quitar Permiso</th>
                        <th>Deshabilitar</th>
                    </tr>

                    <logic:iterate name="inspectores" id="usuario">

                        <tr>
                            <td >
                                <h1>
                                    <p> <bean:write name="usuario" property="usuario"></bean:write></p>
                                    </h1>
                                </td>

                                <td>
                                    <p> <bean:write name="usuario" property="ci"></bean:write> </p>
                                </td>

                                <td >
                                <html:form action = "/otorgarPermisoSupervisor" onsubmit = "return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Supervisor </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form action = "/removerPrivilegios" onsubmit = "return (this)">
                                    <html:hidden name="usuario" property="usuario"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-warning"> Remover </html:submit>
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

</fielset>           	


