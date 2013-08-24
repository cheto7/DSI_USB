<%-- 
    Document   : formulario-puntuacion
    Created on : May 28, 2013, 2:53:21 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<legend>Puntuar equipo de protección</legend>
<center>
    <html:form action="/EvaluarEquipo" onsubmit="return (this)">
        <h1 style="display: inline">Valoracion del Equipo: </h1>
        <html:hidden name="puntuacion" property="serial"/>
        <html:hidden name="puntuacion" property="usuario"/>
        <html:select name="puntuacion" property="puntuacion" styleClass="span2">
            <%--<html:optionsCollection name="select" label="value" value="value"/>--%>
            <option value=0 >Muy malo</option>
            <option value=1 >Malo</option>
            <option value=2 >Normal</option>
            <option value=3 >Bueno</option>
            <option value=4 >Muy bueno</option>
            <option value=5 >Excelente</option>
        </html:select>
        <br/>
        <br/>
        <html:submit styleClass="btn btn-primary"> Evaluar </html:submit>
    </html:form>
</center>        