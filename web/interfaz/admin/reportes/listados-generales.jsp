<%-- 
    Document   : listados-generales
    Created on : 29/11/2012, 07:10:55 PM
    Author     : Alfred
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend> Ver consolidados </legend>

<p> Seleccione una de las siguientes opciones para descargar el 
    consolidado deseado: </p>
<center>
<html:link action="/DownloadXLS" target="_blank">
    <img src="assets/Boton xls Material- cantidad DEF.png"/>
</html:link>

<html:link action="/DownloadXLS" target="_blank">
    <img src="assets/Boton xls Usuario- Pedido DEF.png"/>
</html:link>
</center>