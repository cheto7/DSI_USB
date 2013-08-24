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
            <table class="table table-hover" width="100%">
                <tbody>
                    <tr>
                        <th width="60%"><center>Equipo</center></th>
                        <th><center>Imagen</center></th>
                        <th><center>Puntuación</center></th>
                        <th><center>Opción</center></th>
                    </tr>

                <logic:iterate name="equipos" id="equipo">

                    <tr>
                        <td >
                            <h1>
                                <p> <bean:write name="equipo" property="nombre_vista"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                            <img src="assets/materiales/<bean:write name="equipo" property="nombre_vista"></bean:write>.png" width="55" height="55">
                        </td>
                        
                        <td>
                                <p> <bean:write name="equipo" property="puntuacion"></bean:write></p>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/CambiarPuntuacion" onsubmit = "return (this)">
                            <html:hidden name="equipo" property="serial"/>
                            <html:hidden name="Usuario" property="usuario"/>
                            <html:submit styleClass="btn btn-success"> Evaluar </html:submit>
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
