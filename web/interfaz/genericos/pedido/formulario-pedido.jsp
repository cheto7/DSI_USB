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

<!-- FORMULARIO DE REGISTRO -->
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Académico</a></li>
        <li><a href="#tabs-2">Administrativo</a></li>
        <li><a href="#tabs-3">Bombero</a></li>
        <li><a href="#tabs-4">Obrero</a></li>
        <li><a href="#tabs-5">Genéricos</a></li>
    </ul>

    <%--<html:form method="POST" action="/Pedido?method=save" onsubmit="return (this)">
        <html:hidden name="autenticado" property="usuario"/>--%>

        <div id="tabs-1">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <div class="selector">
                <logic:iterate name="equiposAcad" id="eq">
                <div class="casilla">
                    <label class="checkbox inline">
                        <%--<html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>--%>
                        <bean:write name="eq" property="nombre_vista"/>
                    </label>
                    <center>
                        <div class="casillaimg">
                            <img width="80" src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" />
                        </div>
                    </center>
                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                            <html:hidden name="eq" property="serial"/>
                            <html:hidden name="eq" property="tipo_talla"/>
                            <html:hidden name="solicitud" property="id"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <p style="float:left">Frecuencia de Uso:</p>
                            <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            <p style="float:left; display: inline">Cantidad:
                            <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                            </html:text></p>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
                    </div>
                    <!--- HASTA AQUI --->
                </div>
                </logic:iterate>

            </div>
            <center>
                <logic:empty name="equiposAcad">
                    <center>
                    <label>No hay equipos para profesores disponibles</label>
                </center>
                </logic:empty>
            </center>
        </div>
        <div id="tabs-2">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <div class="selector">
                <logic:iterate name="equiposAdmin" id="eq">
                <div class="casilla">
                    <label class="checkbox inline">
                        <%--<html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>--%>
                        <bean:write name="eq" property="nombre_vista"/>
                    </label>
                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" />
                        </div>
                    </center>
                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                            <html:hidden name="eq" property="serial"/>
                            <html:hidden name="eq" property="tipo_talla"/>
                            <html:hidden name="solicitud" property="id"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <p style="float:left">Frecuencia de Uso:</p>
                            <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            <p style="float:left; display: inline">Cantidad:
                            <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                            </html:text></p>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
                    </div>
                    <!--- HASTA AQUI --->
                </div>
                </logic:iterate>

            </div>
            <center>  
                <logic:empty name="equiposAdmin">
                    <center>
                    <label>No hay equipos para personal administrativo disponibles</label>
                </center>
                </logic:empty>                  
            </center>
        </div>
        <div id="tabs-3">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <div class="selector">
                <logic:iterate name="equiposBomb" id="eq">
                <div class="casilla">
                    <label class="checkbox inline">
                        <%--<html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>--%>
                        <bean:write name="eq" property="nombre_vista"/>
                    </label>
                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" />
                        </div>
                    </center>
                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                            <html:hidden name="eq" property="serial"/>
                            <html:hidden name="eq" property="tipo_talla"/>
                            <html:hidden name="solicitud" property="id"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <p style="float:left">Frecuencia de Uso:</p>
                            <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            <p style="float:left; display: inline">Cantidad:
                            <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                            </html:text></p>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
                    </div>
                    <!--- HASTA AQUI --->
                </div>
                </logic:iterate>
            </div>
            <center>
               <logic:empty name="equiposBomb">
                    <center>
                    <label>No hay equipos para bomberos disponibles</label>
                </center>
                </logic:empty>
            </center>
        </div>
        <div id="tabs-4">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <div class="selector">
                <logic:present name="equiposObrero">
                <logic:iterate name="equiposObrero" id="eq">
                <div class="casilla">
                    <label class="checkbox inline">
                        <%--<html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>--%>
                        <bean:write name="eq" property="nombre_vista"/>
                    </label>
                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" />
                        </div>
                    </center>
                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                            <html:hidden name="eq" property="serial"/>
                            <html:hidden name="eq" property="tipo_talla"/>
                            <html:hidden name="solicitud" property="id"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <p style="float:left">Frecuencia de Uso:</p>
                            <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            <p style="float:left; display: inline">Cantidad:
                            <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                            </html:text></p>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
                    </div>
                    <!--- HASTA AQUI --->
                </div>
                </logic:iterate>
                </logic:present>
            </div>
            <center>
                <logic:empty name="equiposObrero">
                    <center>
                    <label>No hay equipos para obreros disponibles</label>
                </center>
                </logic:empty>   
            </center>
        </div> 
        <div id="tabs-5">
            <logic:present name="errorCantidad">
                <center>
                    <label style="color:red">Error: Debe introducir una cantidad mayor a cero para agregar</label>
                </center>
            </logic:present>
            <div class="selector">
                <logic:iterate name="equiposGen" id="eq">
                <div class="casilla">
                    <label class="checkbox inline">
                        <%--<html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>--%>
                        <bean:write name="eq" property="nombre_vista"/>
                    </label>
                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/<bean:write name="eq" property="nombre_vista"/>.png" />
                        </div>
                    </center>
                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <html:form action="/AgregarEquipoASolicitud" onsubmit="return (this)">
                            <html:hidden name="eq" property="serial"/>
                            <html:hidden name="eq" property="tipo_talla"/>
                            <html:hidden name="solicitud" property="id"/>
                            <html:hidden name="autenticado" property="usuario"/>
                            <p style="float:left">Frecuencia de Uso:</p>
                            <html:select name="solicitud" property="frecuencia" styleClass="spana">
                                <option>Diaria</option>
                                <option>Semanal</option>
                                <option>Mensual</option>
                                <option>Trimestral</option>
                                <option>Anual</option>
                            </html:select>
                            <p style="float:left; display: inline">Cantidad:
                            <html:text name="solicitud" property="cantidad" styleClass="span1" styleId="spinner" value="0">                
                            </html:text></p>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
                    </div>
                    <!--- HASTA AQUI --->
                </div>
                </logic:iterate>
            </div>
            <center>
                <logic:empty name="equiposGen">
                    <center>
                    <label>No hay equipos genéricos disponibles</label>
                </center>
                </logic:empty> 
            </center>
        </div>

    </center>
</div>
    <br><br>
    <center>
    <html:form action="/SiguientePaso" onsubmit="return (this)">
        <html:hidden name="solicitud" property="id"/>
        <html:hidden name="autenticado" property="usuario"/>
        <html:submit styleClass="btn btn-primary"> Siguiente </html:submit>
    </html:form>
</center>        

<div style="display:none;" class="nav_up" id="nav_up"></div>
<div style="display:none;" class="nav_down" id="nav_down"></div>