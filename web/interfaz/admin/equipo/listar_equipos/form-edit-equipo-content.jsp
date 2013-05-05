<%-- 
    Document   : form-edit-equipo-content
    Created on : Feb 5, 2013, 10:17:00 AM
    Author     : cheto
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Editar equipo</legend>

<logic:present name="equipoNulo">
    <logic:notEmpty name="equipoNulo">
        <center>
            <label style="color:red">Error: <bean:write name="equipoNulo" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<font color="red">
<html:errors/>
</font>

<html:form action = "/EditarEquipo" acceptCharset="ISO-8859-1" onsubmit = "return (this)">

    <label>Nombre:</label>
    <html:text name="Equipo" property="nombre_vista" styleClass="span5">
        <bean:write name="equipo" property="nombre_vista"/>
    </html:text>
    <br>
    <label>Tipo:</label>
    <html:text name="Equipo" property="tipo" styleClass="span5">
        <bean:write name="equipo" property="tipo"/>
    </html:text>
    <br>
    <label>Cantidad en existencia:</label>
    <html:text name="Equipo" property="cantidad" styleClass="span5">
        <bean:write name="equipo" property="cantidad"/>
    </html:text>
    <br>
    <label>Norma técnica asociada:</label>
    <html:text name="Equipo" property="norma" styleClass="span5" >
        <bean:write name="equipo" property="norma"/>
    </html:text>
    <br>    
    <label>Vida útil (Meses):</label>
    <html:text name="Equipo" property="vida_util" styleClass="span5">
        <bean:write name="equipo" property="vida_util"/>
    </html:text>
    <br>
    <label>Funcionalidad:</label>
    <html:textarea  name="Equipo" property="funcionalidad" rows="3" styleClass="span5">
        <bean:write name="equipo" property="funcionalidad"/>
    </html:textarea>
    <br>
    <label>Sector universitario asociado:</label>  
    <html:select name="Equipo" property="sector"> 
        <option><bean:write name="equipo" property="sector"/></option>
        <option value="academico">Académico</option>
        <option value="administrarivo">Administrativo</option>
        <option value="bombero">Bombero</option>
        <option value="obrero">Obrero</option>
        <option value="generico">Genérico</option>
    </html:select><br>
    <label>Tipo de talla asociada:</label>
    <html:select name="Equipo" property="tipo_talla">
        <option><bean:write name="equipo" property="tipo_talla"/></option>
        <option value="camisa">Camisa</option>
        <option value="guantes">Guantes</option>
        <option value="mascara">Máscara</option>
        <option value="pantalon">Pantalón</option>
        <option value="zapato">Zapato</option>
        <option value="no aplica">No Aplica</option>
    </html:select><br>     
    
    <script>
        $('textarea').jqte();
    </script>
    <br>
    <html:hidden name="equipo" property="serial"/>
    <html:hidden name="equipo" property="imagen"/>
    <center>
    <html:submit styleClass="btn btn-primary"> Editar </html:submit>
        </center>
</html:form>