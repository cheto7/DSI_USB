<%-- 
    Document   : plantilla-lista-usuarios
    Created on : 06/03/2013, 07:09:45 PM
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
        <tiles:insert attribute="script"/>
    </head>
    <body onLoad="setTimeout('scroll(0,0)',50)">

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
            </div>

            <div id="footer">
                <tiles:insert attribute="footer"/>
            </div>

        </div>

    </body>
</html>