<%-- 
    Document   : listado_content
    Created on : Feb 26, 2013, 8:43:13 PM
    Author     : cheto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Listado de Solicitudes</legend>

<html:form enctype="multipart/form-data" action = "/ListarSolicitudes" acceptCharset="iso-8859-1" onsubmit = "return (this)">

    <label>Usuario:</label>
    <html:text name="ListadoGeneral" property="usuario" styleClass="span5"></html:text><br>  
    <label>Equipo:</label>
    <html:text name="ListadoGeneral" property="equipo" styleClass="span5" ></html:text><br>
    <label>Periodo:</label>
    <html:select name="ListadoGeneral" property="periodo">            
        <option value="actual">Actual</option>
    </html:select><br>
    <label>Tipo:</label>
    <html:select name="ListadoGeneral" property="tipo">            
        <option value="">No Aplica</option>            
        <option value="academico">Académico</option>
        <option value="administrativo">Administrativo</option>
        <option value="bombero">Bombero</option>
        <option value="obrero">Obrero</option>
        <option value="generico">Genérico</option>
    </html:select><br>
    <label>Sexo:</label>
    <html:select name="ListadoGeneral" property="sexo">            
        <option value="">No Aplica</option>            
        <option value="femenino">Femenino</option>
        <option value="masculino">Masculino</option>
    </html:select><br>
    <label>Organizado por:</label>
    <html:select name="ListadoGeneral" property="organizadoPor">            
        <option value="">No Aplica</option>            
        <option value="usuario">Usuarios</option>
        <option value="equipo">Equipos/tallas</option>
        <option value="masPedidos">Los mas pedidos</option>
    </html:select><br>
    
    <html:submit styleClass="btn btn-primary"> Consultar </html:submit>
</html:form>