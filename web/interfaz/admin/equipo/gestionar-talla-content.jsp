<%-- 
    Document   : gestionar-talla-content
    Created on : 15/07/2013, 12:20:03 AM
    Author     : ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <legend>Agregar talla a equipo</legend>
</head>
<body>
    <logic:present name="tallaNoAgregada">
        <center>
            <label style="color:red">Error: El equipo ya tiene esta talla registrada</label>
        </center>
    </logic:present>
    <logic:present name="tallaVacia">
        <label style="color:red">Error: El campo talla no puede ser vacío</label>
    </logic:present>        
    <h1 style="display: inline">Nombre de equipo: </h1><bean:write name="equipo" property="nombre_vista"/><br>
    <h1 style="display: inline">Tipo de talla: </h1><bean:write name="equipo" property="tipo_talla"/><br><br><br>



    <html:form action = "/GuardarTalla" onsubmit = "return (this)">
        <table width="100%">
            <tbody>
                <tr>
                    <td>
                        <h1 style="display: inline">Talla: </h1> <html:text 
                            name="equipo" 
                            property="talla" styleClass="span3"/>
                    </td>
                    <td>
                        <h1 style="display: inline">Cantidad: </h1><html:text 
                            name="equipo" 
                            property="cantidad" 
                            styleClass="span3" value="0"/>                
                    </td>

                    <html:hidden name="equipo" property="serial"/>
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:hidden name="equipo" property="imagen"/>
                    <html:hidden name="equipo" property="tipo"/>
                    <html:hidden name="equipo" property="nombre_vista"/>
                    <html:hidden name="equipo" property="evaluacion"/>
                    <html:hidden name="equipo" property="funcionalidad"/>
                    <html:hidden name="equipo" property="sector"/>
                    <html:hidden name="equipo" property="vida_util"/>
                    <html:hidden name="equipo" property="tipo_talla"/>
                    <html:hidden name="equipo" property="norma"/>
                </tr>
            </tbody>
        </table>
        <br>
        <br>
    <center>
        <html:submit styleClass="btn btn-success">Guardar</html:submit>
    </center>
</html:form>
</body>
</html>
