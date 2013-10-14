<%-- 
    Document   : agregarCargo
    Created on : 02/10/2013, 05:01:40 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<script>
    $(function() {
        $("#editCargo").attr('placeholder', 'Nombre del cargo');
    });
    
</script>

<fieldset>
    <legend>Registrar Cargo</legend>
    
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
            <label style="color:red">Error: <bean:write name="mensajeUsuarioNoEditado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>
    <html:form styleId="Form" method="POST" action="/registrarCargo" acceptCharset="ISO-8859-1" onsubmit="return (this)">
        <html:text name="Cargo" value="" property="cargo" styleClass="span6" styleId="editCargo"></html:text>
        <html:submit styleClass="btn btn-primary"> Registrar </html:submit>
    </html:form>


    <legend>Cargos registrados</legend>
    <logic:notPresent name="cargo">
        <label>
            <center> No hay cargos que mostrar.</center>
        </label>
    </logic:notPresent>

    <logic:present name="cargo">

        <logic:empty name="cargo">
            <label>
                <center> No hay cargos que mostrar.</center>
            </label>
        </logic:empty>
        <br>

        <logic:notEmpty name="cargo">
            <table class="table table-hover">
                <tbody>


                    <logic:iterate name="cargo" id="cargo">

                        <%
                            if (request.getAttribute("editar") != null) {
                                if (request.getAttribute("editar").equals("Activado")) {
                        %>
                        <tr>
                            <html:form action = "/editarCargoConfirm" acceptCharset="ISO-8859-1" onsubmit = "return (this)">
                                <td>          
                                    <h1>
                                        <p><html:text name="cargo" 
                                                   property="cargo" 
                                                   styleId="editCargo"
                                                   styleClass="span5">
                                                
                                            </html:text></p>
                                        <html:hidden name="cargo" property="id"/>
                                    </h1>
                                </td>
                                <td></td>
                                <td></td>
                                <td>                              
                                    <html:submit styleClass="btn btn-primary"> Confirmar </html:submit>
                                </td>
                                <td></td>
                            </html:form>
                            <%
                                request.setAttribute("editar", "Desactivado");
                            } else {
                            %>
                        <tr>
                            <td >
                                <h1>
                                    <p> <bean:write name="cargo" property="cargo"></bean:write></p>
                                </h1>
                            </td>

                            <td>

                            </td>

                            <td >

                            </td>

                            <td>
                            <html:form action = "/editarCargo" acceptCharset="ISO-8859-1" onsubmit = "return (this)">
                                    <html:hidden name="cargo" property="cargo"/>
                                    <html:hidden name="cargo" property="id"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Editar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form method="POST" action="/eliminarCargo" acceptCharset="ISO-8859-1" onsubmit="return (this)">
                                    <html:hidden name="cargo" property="id"/>                                    
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                </html:form>                                                                   
                            </td>
                            <%      }
                            } else {
                            %>
                        <tr>
                            <td >
                                <h1>
                                    <p> <bean:write name="cargo" property="cargo"></bean:write></p>
                                </h1>
                            </td>

                            <td>

                            </td>

                            <td >

                            </td>

                            <td>
                            <html:form action = "/editarCargo" acceptCharset="ISO-8859-1" onsubmit = "return (this)">
                                    <html:hidden name="cargo" property="cargo"/>
                                    <html:hidden name="cargo" property="id"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Editar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form method="POST" action="/eliminarCargo" acceptCharset="ISO-8859-1" onsubmit="return (this)">
                                    <html:hidden name="cargo" property="id"/>                                    
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                </html:form>                                                                   
                            </td>
                            <%  }%> 
                        </tr>        
                    </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>

    <br>   

    </fielset>