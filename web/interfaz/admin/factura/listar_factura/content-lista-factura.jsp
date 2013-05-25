<%-- 
    Document   : content-lista-factura
    Created on : Mar 20, 2013, 7:49:41 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 


<fieldset>
    <legend>Lista de Facturas (no validadas)</legend> 
    
    <logic:present name="no_eliminado">
        <center>
            <label> No pudo ser eliminado.</label>
        </center>
    </logic:present>

    <logic:notPresent name="facturas">
        <center>
            <label> No hay facturas que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="facturas">

        <logic:empty name="facturas">
            <center>
                <label> No hay facturas que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="facturas">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Fecha</center></th>
                <th><center>Proveedor</center></th>
                <th><center>Modificar</center></th>
                <th><center>Eliminar</center></th>
                <th><center>Validar</center></th>
                </tr>

                <logic:iterate name="facturas" id="factura">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="factura" property="fecha"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <p> <bean:write name="factura" property="proveedor"></bean:write> </p>
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