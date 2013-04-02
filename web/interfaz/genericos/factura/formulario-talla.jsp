<%-- 
    Document   : formulario-talla
    Created on : Apr 2, 2013, 9:57:04 AM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <center>
        <html:form action="/AgregarEquipoAFactura" onsubmit="return (this)">
            <label>Talla del Equipo: </label>
                            <html:hidden name="facturado" property="numero_factura"/>
                            <html:hidden name="facturado" property="serial"/>
                            <html:hidden name="facturado" property="cantidad"/>
                            <html:select name="facturado" property="talla" styleClass="span1">
                                <html:optionsCollection name="select" label="value" value="value"/>
                            </html:select>
                            <br/>
                            <br/>
                            <html:submit style="btn btn-primary"> Agregar </html:submit>
                        </html:form>
</center>        