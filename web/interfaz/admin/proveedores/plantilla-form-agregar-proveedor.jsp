<%-- 
    Document   : plantilla-form-agregar-proveedor
    Created on : 30/01/2013, 03:49:22 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Dirección de Seguridad Integral</title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="assets/css/jquery-ui.css" />

        <style>
            fieldset div {
                margin-bottom: 2em;
            }
            fieldset .help {
                display: inline-block;
            }
            .ui-tooltip {
                width: 210px;
            }
        </style>
    </head>
    <body>

        <div id="container">

            <header id="header">
            </header>

            <div id="main">
                <div id="content">
                    <tiles:insert attribute="formulario"/>
                </div>
                <div id="sidebar-first">
                    <tiles:insert attribute="navBar"/>               
                </div>
                <div id="sidebar-second">
                    <tiles:insert attribute="sidebar-second"/>
                </div>
            </div>

            <div id="footer">
                <tiles:insert attribute="footer"/>
            </div>

        </div>

    </body>
</html>