<%-- 
    Document   : plantilla-formulario-editar
    Created on : Nov 4, 2012, 3:15:03 AM
    Author     : sibs
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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

                        <tiles:insert attribute="content"/>
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

        </body>
    </html>