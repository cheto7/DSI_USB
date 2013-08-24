<%-- 
    Document   : seleccionarPeriodo
    Created on : 05/08/2013, 04:10:40 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <legend>Seleccionar período de solicitudes</legend>
        
        <center>
        Seleccione el período de la solicitud:
    <html:form action="/listarSolicitantes" onsubmit="return (this)">
        <html:select name="Periodo" property="fecha_inicio" styleClass="span3">
            <logic:iterate name="periodos" id="periodos">
                <option>Del <bean:write name="periodos" property="fecha_inicio"/> al 
                        <bean:write name="periodos" property="fecha_fin"/>
                </option>
            </logic:iterate>
        </html:select>
        <html:submit styleClass="btn btn-primary">Buscar</html:submit>
    </html:form>
        </center>
        
        
    </body>
</html>
