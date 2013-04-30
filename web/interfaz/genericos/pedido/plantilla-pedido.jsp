<%-- 
    Document   : interfaz_pedido
    Created on : 22/10/2012, 03:36:59 PM
    Author     : cheo
--%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <tiles:insert attribute="script"/>
    </head>
    <body onLoad="setTimeout('scroll(0,0)',50)">

        <div id="container">

            <header id="header">
            </header>

            <div id="main">
                <div id="content1">
                    <tiles:insert attribute="formulario"/>             
                </div>
                <div id="sidebar-first1">
                    <tiles:insert attribute="navBar"/>               
                </div>
            </div>

            <div id="footer">
                <tiles:insert attribute="footer"/>
            </div>

        </div>

    </body>
</html>