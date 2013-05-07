<%-- 
    Document   : interfaz_registro
    Created on : 21/10/2012, 04:09:40 PM
    Author     : cheo
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
    <body>

        <div id="container">

            <header id="header">
            </header>

            <div id="main">
                <div id="content">
                    <tiles:insert attribute="formulario"/>


                    <ul id="navbar">                       
                        <tiles:insert attribute="navBar"/>
                    </ul>

                </div>

                <div id="footer">
                    <tiles:insert attribute="footer"/>
                </div>

            </div>
        </div>

    </body>
</html>