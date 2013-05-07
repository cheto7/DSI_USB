<%-- 
    Document   : navbar-registro
    Created on : Nov 4, 2012, 12:09:19 AM
    Author     : sibs
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul id="navbar">
    <a>
        <li>
            <html:form action = "/VolverPagInicio" onsubmit="return (this)">
                <html:submit style="padding:10px 20px 40px 20px"> Inicio </html:submit>
            </html:form> 
        </li>
    </a>
</ul>