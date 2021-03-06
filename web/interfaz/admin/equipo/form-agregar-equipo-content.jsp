<%-- 
    Document   : form-agregar-equipo-content
    Created on : Jan 30, 2013, 4:27:48 PM
    Author     : cheto
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Agregar equipo de protecci�n</legend>
<logic:present name="equipoNulo">
    <logic:notEmpty name="equipoNulo">
        <center>
            <label style="color:red">Error: <bean:write name="equipoNulo" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorNombreEquipo">
    <logic:notEmpty name="errorNombreEquipo">
        <center>
            <label style="color:red">Error: Debe introducir el nombre del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorTipoEquipo">
    <logic:notEmpty name="errorTipoEquipo">
        <center>
            <label style="color:red">Error: Debe introducir el tipo del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorFuncionalidadEquipo">
    <logic:notEmpty name="errorFuncionalidadEquipo">
        <center>
            <label style="color:red">Error: Debe introducir la funcionalidad del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorTallaEquipo">
    <logic:notEmpty name="errorTallaEquipo">
        <center>
            <label style="color:red">Error: Debe introducir la talla asociada al equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>
<logic:present name="errorFormatoEquipo">
    <logic:notEmpty name="errorFormatoEquipo">
        <center>
            <label style="color:red">Debe introducir un imagen v�lida (jpg,png,gif)</label>
        </center>
    </logic:notEmpty>
</logic:present>

<logic:present name="errorSectorUniversitario">
    <logic:notEmpty name="errorSectorUniversitario">
        <center>
            <label style="color:red">Debe introducir el sector universitario</label>
        </center>
    </logic:notEmpty>
</logic:present>

<logic:present name="errorVidaUtil">
    <logic:notEmpty name="errorVidaUtil">
        <center>
            <label style="color:red">Debe introducir la vida �til del equipo</label>
        </center>
    </logic:notEmpty>
</logic:present>

<html:form enctype="multipart/form-data" action = "/AgregarEquipo" acceptCharset="ISO-8859-1" onsubmit = "return (this)">
    <table width="100%">
        <tr>
            <td>
                <label>Nombre:</label>
                <html:textarea name="Equipo" property="nombre_vista" styleClass="span4"></html:textarea>
            </td>
            <td>
                <label>Sector universitario:</label>
                <html:select name="Equipo" property="sector">
            <option> </option>
            <option value="academico">Acad�mico</option>
            <option value="administrativo">Administrativo</option>
            <option value="bombero">Bombero</option>
            <option value="obrero">Obrero</option>
            <option value="generico">Gen�rico</option>
        </html:select>                
    </td>
</tr>
<tr>
    <td>
        <label>Tipo:</label>
        <html:text name="Equipo" property="tipo" styleClass="span4" ></html:text>
    </td>
    <td>
        <label>Tipo de talla:</label>
        <html:select name="Equipo" property="tipo_talla">
    <option> </option>
    <option value="camisa">Camisa</option>
    <option value="guantes">Guantes</option>
    <option value="mascara">M�scara</option>
    <option value="pantalon">Pantal�n</option>
    <option value="zapato">Zapato</option>
    <option value="no aplica">No Aplica</option>
</html:select>
</td>
</tr>
<tr>
    <td>
        <label>Funcionalidad:</label>
        <html:textarea name="Equipo" property="funcionalidad" rows="3" styleClass="span4" ></html:textarea>                
    </td>
    <td>
        <label>Imagen:</label>
        <html:file name="Equipo" property="file" styleClass="span4" ></html:file>
    </td>            
</tr>
<tr>
    <td>
        <label>Norma t�cnica asociada:</label>
        <html:text name="Equipo" property="norma" styleClass="span4" ></html:text>
    </td>
    <td></td>
</tr>
<tr>
    <td style="display: inline"><label>Vida �til:</label>
        <html:text name="Equipo" property="vida_util" styleClass="span2" value="0"></html:text>
        <html:select name="Equipo" property="talla" styleClass="span2">
            <option></option>
            <option>D�as</option>
            <option>Semanas</option>
            <option>Meses</option>
            <option>A�os</option>
        </html:select>  
    </td>
    <td></td>
</tr>        

</table>
<center><html:submit styleClass="btn btn-primary"> Agregar </html:submit></center>
</html:form>
