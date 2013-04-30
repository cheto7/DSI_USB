<%-- 
    Document   : formulario-pedido
    Created on : feb 14, 2013, 00:32:30 AM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <th><center>Frecuencia de uso</center></th>
                    <th><center>Cantidad</center></th>
                    <th><center>Opciones</center></th>
                    </tr>
                    <logic:iterate name="equiposAcad" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
                        </html:form>
                        </tr>
                    </logic:iterate>

                    <logic:iterate name="equiposGen" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
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
                    <th><center>Frecuencia de uso</center></th>
                    <th><center>Cantidad</center></th>
                    <th><center>Opciones</center></th>
                    </tr>  
                    <logic:iterate name="equiposAdmin" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
                        </html:form>
                        </tr>
                    </logic:iterate>
                    <logic:iterate name="equiposGen" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
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
                    <th><center>Frecuencia de uso</center></th>
                    <th><center>Cantidad</center></th>
                    <th><center>Opciones</center></th>
                    </tr>
                    <logic:iterate name="equiposBomb" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
                        </html:form>
                        </tr>
                    </logic:iterate>
                    <logic:iterate name="equiposGen" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
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
                    <th><center>Frecuencia de uso</center></th>
                    <th><center>Cantidad</center></th>
                    <th><center>Opciones</center></th>
                    </tr>
                    <logic:iterate name="equiposObrero" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
                        </html:form>
                        </tr>
                    </logic:iterate>
                    <logic:iterate name="equiposGen" id="eq">
                        <tr>
                            <td><bean:write name="eq" property="nombre_vista"/></td>
                            <td><img width="70" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" /></td>
                                <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                                    <html:hidden name="eq" property="serial"/>
                                    <html:hidden name="eq" property="tipo_talla"/>
                                    <html:hidden name="solicitud" property="id"/>
                                    <html:hidden name="solicitud" property="periodo"/>
                                    <html:hidden name="autenticado" property="usuario"/>
                                <td>
                                    <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            </td>
                            <td>
                                <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                                </html:text></p>
                            </td>
                            <td>
                                <html:submit style="btn btn-primary"> Agregar </html:submit>
                            </td>
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
    <br><br>
    <center>
        <html:form action="/SiguientePaso" onsubmit="return (this)">
            <html:hidden name="solicitud" property="id"/>
            <html:hidden name="solicitud" property="periodo"/>
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit styleClass="btn btn-primary"> Siguiente </html:submit>
        </html:form>
    </center>