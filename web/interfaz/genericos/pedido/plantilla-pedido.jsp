<%-- 
    Document   : interfaz_pedido
    Created on : 22/10/2012, 03:36:59 PM
    Author     : cheo
--%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <!--<meta http-equiv="Content-Type" content="text/html;  />-->
        <title>Direcci�n de Seguridad Integral</title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/magia.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />        
        <tiles:insert attribute="script"/>
    </head>
    <body onLoad="setTimeout('scroll(0,0)',50)">

        <div id="container">

            <header id="header">
            </header>
            <div id="main">
                <div id="sidebar-first1">
                    <tiles:insert attribute="navBar"/>
                </div>
                <div id="content1">
                    <tiles:insert attribute="formulario"/>             
                </div>
                
            </div>

            <div id="footer">
                <tiles:insert attribute="footer"/>
            </div>

        </div>

    </body>
</html>