<%-- 
    Document   : formulario-factura
    Created on : Apr 1, 2013, 4:32:11 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- FORMULARIO DE LA FACTURA -->
<html>
    <head>
        <style type="text/css">
            td {
                text-align: center;
            } 
        </style>
    </head>
    <logic:present name="agregadoEquipo">
        <center>
            <label style="color:red">El equipo ya fue agregado a la factura.</label>
        </center>
    </logic:present>    
    <div id="tabs">
        <ul>
            <li><a href="#tabs-1">Académico</a></li>
            <li><a href="#tabs-2">Administrativo</a></li>
            <li><a href="#tabs-3">Bombero</a></li>
            <li><a href="#tabs-4">Obrero</a></li>
        </ul>

        <div id="tabs-1">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Nombre de Equipo</center></th>
                <th><center>Imagen</center></th>
                <th><center>Cantidad</center></th>
                <th><center>Opciones</center></th>
                </tr>
                <logic:iterate name="equiposAcad" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit style="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                <logic:iterate name="equiposGen" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit style="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                </tbody> 
            </table>
            <center>
                <logic:empty name="equiposAcad">
                    <logic:empty name="equiposGen">
                        <center>
                            <label>No hay equipos para personal académico disponibles</label>
                        </center>
                    </logic:empty>
                </logic:empty>
            </center>          
        </div>
        <div id="tabs-2">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Nombre de Equipo</center></th>
                <th><center>Imagen</center></th>
                <th><center>Cantidad</center></th>
                <th><center>Opciones</center></th>
                </tr>
                <logic:iterate name="equiposAdmin" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                <logic:iterate name="equiposGen" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                </tbody> 
            </table>
            <center>
                <logic:empty name="equiposAdmin">
                    <logic:empty name="equiposGen">
                        <center>
                            <label>No hay equipos para personal administrativo disponibles</label>
                        </center>
                    </logic:empty>
                </logic:empty>
            </center>        
        </div>    
        <div id="tabs-3">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Nombre de Equipo</center></th>
                <th><center>Imagen</center></th>
                <th><center>Cantidad</center></th>
                <th><center>Opciones</center></th>
                </tr>
                <logic:iterate name="equiposBomb" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                <logic:iterate name="equiposGen" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                </tbody> 
            </table>
            <center>
                <logic:empty name="equiposBomb">
                    <logic:empty name="equiposGen">
                        <center>
                            <label>No hay equipos para bomberos disponibles</label>
                        </center>
                    </logic:empty>
                </logic:empty>
            </center>

        </div>
        <div id="tabs-4">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>Nombre de Equipo</center></th>
                <th><center>Imagen</center></th>
                <th><center>Cantidad</center></th>
                <th><center>Opciones</center></th>
                </tr>
                <logic:iterate name="equiposObrero" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                <logic:iterate name="equiposGen" id="eq">
                    <tr>
                        <td><bean:write name="eq" property="nombre_vista"/></td>
                        <td><img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                            <html:form action="/PonerTalla" onsubmit="return (this)">
                                <html:hidden name="facturado" property="numero_factura"/>
                                <html:hidden name="eq" property="serial"/>
                                <html:hidden name="eq" property="tipo_talla"/>
                            <td><html:text name="facturado" property="cantidad" styleClass="span1" styleId="spinner" value="0"/></td>

                            <td><html:submit styleClass="btn btn-primary"> Agregar </html:submit></td>
                        </html:form>
                    </tr>
                </logic:iterate>
                </tbody> 
            </table>
            <center>
                <logic:empty name="equiposObrero">
                    <logic:empty name="equiposGen">
                        <center>
                            <label>No hay equipos para personal obrero disponibles</label>
                        </center>
                    </logic:empty>
                </logic:empty>
            </center>       
        </div>        
    </div>
    <br><br>
    <center>
        <html:form action="/FormularioEditarFactura" onsubmit="return (this)">
            <html:hidden name="facturado" property="numero_factura"/>
            <html:submit styleClass="btn btn-primary"> Siguiente </html:submit>
        </html:form>
    </center>
</html>