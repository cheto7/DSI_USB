<%-- 
    Document   : interfaz_pag_principal
    Created on : 21/10/2012, 03:54:29 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><tiles:getAsString name="titulo" ignore="true" /></title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/magia.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div id="container">

            <header id="header">
            </header>
            <div id="main">
                <div id="content">
                    <tiles:insert attribute="noticias"/>
                </div>
                <div id="sidebar-first">
                    <tiles:insert attribute="navBarGeneral"/>
                </div>
                <div id="sidebar-second">
                    <tiles:insert attribute="sidebar"/>
                </div>
            </div>
            <div id="footer">
                <tiles:insert attribute="footer"/>
            </div>
        </div>


        <!-- Esto va oculto, Lugar para el Login-->

        <div id="box" class="popup">
            <center>
                <div class="form-horizontal">
                    <html:form action="/Login" onsubmit="return (this)">
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">USB-ID</label>
                            <div class="controls">
                                <html:text name="Usuario" property="usuario"></html:text><br>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">Contraseña</label>
                            <div class="controls">
                                <html:password name="Usuario" property="password"></html:password>
                            </div>
                        </div>
                        <div class="control-group">

                        <html:submit styleClass="btn btn-primary"> Iniciar Sesión </html:submit>


                        </div>
                    </html:form>
                    <html:form action="/Contrasena" onsubmit="return (this)">
                        <div class="control-group">
                            <html:submit styleClass="btn btn-primary"> ¿Olvidó su Contraseña? </html:submit>
                        </div>
                    </html:form>
                </div>
            </center>
        </div>





    </body>
</html>
