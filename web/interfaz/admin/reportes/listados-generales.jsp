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
    consolidado deseado</p> 
<h1> Periodo: Del
    <bean:write name="periodo" property="fecha_inicio"/> al
    <bean:write name="periodo" property="fecha_fin"/>
</h1>
<center>
    <table>
        <tbody>
            <tr>
                <td>
                    <html:form action="/DownloadXLS" onsubmit="return (this)">
                        <html:hidden name="periodo" property="fecha_inicio"/>
                        <html:hidden name="periodo" property="fecha_fin"/>
                        <input type="image" src="assets/Boton xls Material- cantidad DEF.png" 
                               alt="Descargar reporte de solicitudes" />
                    </html:form>
                </td>
                <td>
                    <html:form action="/DownloadXLSUP" onsubmit="return (this)">
                        <html:hidden name="periodo" property="fecha_inicio"/>
                        <html:hidden name="periodo" property="fecha_fin"/>
                        <input type="image" src="assets/Boton xls Usuario- Pedido DEF.png" 
                               alt="Descargar reporte de solicitudes" />
                    </html:form>
                </td>
                <td>
                    <html:form action="/DownloadXLSMU" onsubmit="return (this)">
                        <html:hidden name="periodo" property="fecha_inicio"/>
                        <html:hidden name="periodo" property="fecha_fin"/>
                        <input type="image" src="assets/botonXlsMaterial-Unidad.png" 
                               alt="Descargar reporte de solicitudes" />
                    </html:form>
                </td>
            </tr> 
        </tbody>
    </table>
</center>