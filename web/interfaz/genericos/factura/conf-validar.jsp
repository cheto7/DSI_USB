<%-- 
    Document   : conf-validar
    Created on : May 15, 2013, 9:54:48 PM
    Author     : cheto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Seguro de validar la factura?</legend>
<p>Al validar se agregaran los equipos a la Base de Datos y no podra seguir modificando</p>
        
            <html:form action = "/IrValidarFactura" acceptCharset="iso-8859-1" onsubmit = "return (this)">
                <html:hidden name="factura" property="numero_factura"/>
                
                <center>
                    <html:submit styleClass="btn btn-primary"> Validar </html:submit>
                </center>
            </html:form>
        