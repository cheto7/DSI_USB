<%-- 
    Document   : content-lista-equipos
    Created on : Feb 4, 2013, 2:26:04 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<logic:present name="mensajeEquipoEditado">
    <logic:notEmpty name="mensajeEquipoEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeEquipoEditado" property="mensaje"/>
                '<bean:write name="editada" property="titulo"/>'
                ha sido modificada.
            </label>
        </center>
    </logic:notEmpty>
</logic:present>

<fieldset>
    <legend>Lista de Equipos de protección</legend> 

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
            <table class="table table-hover" style="table-layout:fixed">
                <tbody>
                    <tr>
                        <th width="40%"><center>Nombre</center></th>
                <th width="15%"><center>Imagen</center></th>
                <!--<th width="15%"><center>En existencia</center></th>-->
                <th colspan="2" width="30%"><center>Opciones</center></th>
                </tr>

                <logic:iterate name="equipos" id="equipo">

                    <tr>
                        <td>
                            <h1>
                                <p> <bean:write name="equipo" property="nombre_vista"></bean:write></p>
                                </h1>
                            </td>

                            <td>
                                <p> <img width="50" src="assets/materiales/<bean:write name="equipo" property="nombre_vista"/>.png" /></p>
                        </td>

                        <!--<td>
                    <center>
                            <p> <bean:write name="equipo" property="cantidad"></bean:write> </p>
                            </center>
                        </td>-->

                            <td>
                        <center>
                        <html:form action = "/VerDatosEquipo" acceptCharset="ISO-8859-1" onsubmit = "return (this)">
                            <html:hidden name="equipo" property="serial"/>
                            <html:hidden name="equipo" property="imagen"/>
                            <html:hidden name="equipo" property="tipo"/>
                            <html:hidden name="equipo" property="nombre_vista"/>
                            <html:hidden name="equipo" property="cantidad"/>
                            <html:hidden name="equipo" property="evaluacion"/>
                            <html:hidden name="equipo" property="funcionalidad"/>
                            <html:hidden name="equipo" property="sector"/>
                            <html:hidden name="equipo" property="vida_util"/>
                            <html:hidden name="equipo" property="tipo_talla"/>
                            <html:hidden name="equipo" property="norma"/>
                            <html:submit styleClass="btn btn-primary"> Ver </html:submit>
                        </html:form>
                    </center>
                    </td>

                    <td>
                    <center>
                        <html:form action="/ConfirmarEliminarEquipo" acceptCharset="ISO-8859-1" onsubmit="return (this)">
                            <html:hidden name="equipo" property="nombre_vista"/>
                            <html:hidden name="equipo" property="serial"/>
                            <html:submit styleClass="btn btn-danger"> Descontinuar </html:submit>
                        </html:form>
                    </center>
                    </td>
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        <center>
            <html:form action="/DownloadInventario" onsubmit="return (this)">
                <input type="image" src="assets/botonXlsInventario.png" 
                       alt="Descargar reporte de solicitudes" />
            </html:form>            
        </center>            
        </logic:notEmpty>
    </logic:present>
</fieldset>
