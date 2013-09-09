<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<script>
    $(function() {
        $("#editUnidad").attr('placeholder', 'Nombre unidad de adscripción');
    });
    
</script>

<fieldset>
    <legend>Registrar Unidad</legend>
    
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
    <html:form styleId="Form" method="POST" action="/registrarUnidadAdscripcion" onsubmit="return (this)">
        <!--<label>Nombre Unidad:</label>-->
        <html:text name="Usuario" value="" property="nombre" styleClass="span6" styleId="editUnidad"></html:text>
        <html:submit styleClass="btn btn-primary"> Registrar </html:submit>
    </html:form>


    <legend>Unidades Registradas</legend>
    <logic:notPresent name="unidadAdscripcion">
        <label>
            <center> No hay unidades que mostrar.</center>
        </label>
    </logic:notPresent>

    <logic:present name="unidadAdscripcion">

        <logic:empty name="unidadAdscripcion">
            <label>
                <center> No hay unidades que mostrar.</center>
            </label>
        </logic:empty>
        <br>

        <logic:notEmpty name="unidadAdscripcion">
            <table class="table table-hover">
                <tbody>


                    <logic:iterate name="unidadAdscripcion" id="unidadAdscripcion">

                        <%
                            if (request.getAttribute("editar") != null) {
                                if (request.getAttribute("editar").equals("Activado")) {
                        %>
                        <tr>
                            <html:form action = "/editarUnidad" onsubmit = "return (this)">
                                <td>          
                                    <h1>
                                        <p><html:text name="unidadAdscripcion" 
                                                   property="nombre" 
                                                   styleId="editUnidad"
                                                   styleClass="span5">
                                                
                                            </html:text></p>
                                        <html:hidden name="unidadAdscripcion" property="id"/>
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
                                    <p> <bean:write name="unidadAdscripcion" property="nombre"></bean:write></p>
                                </h1>
                            </td>

                            <td>

                            </td>

                            <td >

                            </td>

                            <td>
                                <html:form action = "/editarUnidadAdscripcion" onsubmit = "return (this)">
                                    <html:hidden name="unidadAdscripcion" property="nombre"/>
                                    <html:hidden name="unidadAdscripcion" property="id"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Editar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form method="POST" action="/eliminarUnidadAdscripcion" onsubmit="return (this)">
                                    <html:hidden name="unidadAdscripcion" property="id"/>                                    
                                    <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                                </html:form>                                                                   
                            </td>
                            <%      }
                            } else {
                            %>
                        <tr>
                            <td >
                                <h1>
                                    <p> <bean:write name="unidadAdscripcion" property="nombre"></bean:write></p>
                                </h1>
                            </td>

                            <td>

                            </td>

                            <td >

                            </td>

                            <td>
                                <html:form action = "/editarUnidadAdscripcion" onsubmit = "return (this)">
                                    <html:hidden name="unidadAdscripcion" property="nombre"/>
                                    <html:hidden name="unidadAdscripcion" property="id"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                    <html:submit styleClass="btn btn-success"> Editar </html:submit>
                                </html:form> 
                            </td>

                            <td>
                                <html:form method="POST" action="/eliminarUnidadAdscripcion" onsubmit="return (this)">
                                    <html:hidden name="unidadAdscripcion" property="id"/>                                    
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


