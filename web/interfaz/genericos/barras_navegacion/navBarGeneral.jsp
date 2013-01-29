<%-- 
    Document   : navBarGeneral
    Created on : 24/10/2012, 05:42:30 PM
    Author     : Alfred
--%>       
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>



<ul id="nav-registro">
    <li><a href="#box" class ="window">Inciar Sesión</a></li>  
         
        
            <html:form action = "/Registro" onsubmit="return (this)">
                <html:submit style=" padding:10px 20px 40px 20px"> Registro </html:submit>
            </html:form> 
        
    
</ul>
<ul id="navbar">                                                 
</ul>
