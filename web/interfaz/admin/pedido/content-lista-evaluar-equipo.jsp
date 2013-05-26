<%-- 
    Document   : content-lista-evaluar-equipo
    Created on : May 25, 2013, 7:06:26 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 


<fieldset>
    <legend>Lista de Equipos que hayas tenido</legend> 

    <logic:notPresent name="equipos">
        <center>
            <label> No hay equipos que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="equipos">

        <logic:empty name="equipos">
            <center>
                <label> No hay equipos que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="equipos">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Equipo</center></th>
                <th><center>Imagen</center></th>
                <th><center>Puntuacion</center></th>
                <th><center>Evaluar</center></th>
                </tr>

                <logic:iterate name="equipos" id="equipo">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="equipo" property="nombre_vista"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <p><img src="<bean:write name="factura" property="proveedor"></bean:write>" width="55" height="55"> </p>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/FormularioEditarFactura" onsubmit = "return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-success"> Editar </html:submit>
                        </html:form> 
                    </center>
                    </td>
                    
                        <td>
                    <center>
                        <html:form action = "/EliminarFactura" onsubmit = "return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-danger"> Eliminar </html:submit>
                        </html:form> 
                    </center>
                    </td>

                    <td>
                    <center>
                        <html:form action="/ValidarFactura" onsubmit="return (this)">
                            <html:hidden name="factura" property="numero_factura"/>
                            <html:hidden name="factura" property="proveedor"/>
                            <html:submit styleClass="btn btn-danger"> Validar </html:submit>
                        </html:form>
                    </center>
                    </td>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>