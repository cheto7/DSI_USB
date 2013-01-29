<%-- 
    Document   : script-pedido
    Created on : Nov 4, 2012, 2:27:44 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Dirección de Seguridad Integral</title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="assets/js/scroll-startstop.events.jquery.js"></script>
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

        <!--Script para activar los tabs y las flechas para movimiento -->
        <script>

            $(function() {
                $( "#tabs" ).tabs();

                    var $elem = $('#content');

                $('#nav_up').fadeIn('slow');
                $('#nav_down').fadeIn('slow');  

                $(window).bind('scrollstart', function(){
                    $('#nav_up,#nav_down').stop().animate({'opacity':'0.2'});
                });

                $(window).bind('scrollstop', function(){
                    $('#nav_up,#nav_down').stop().animate({'opacity':'1'});
                });

                $('#nav_down').click(
                    function (e) {
                        $('html, body').animate({scrollTop: $elem.height()}, 800);
                    }
                );

                $('#nav_up').click(
                    function (e) {
                        $('html, body').animate({scrollTop: '0px'}, 800);
                    }
                );
             });
        </script>
 
 <!--       
        <script>
 $(function() {
        $( "#spinner" ).spinner({
            spin: function( event, ui ) {
                if ( ui.value > 100 ) {
                    $( this ).spinner( "value", 0 );
                    return false;
                } else if ( ui.value < 0 ) {
                    $( this ).spinner( "value", 100 );
                    return false;
                }
            }
        });
    });
    </script> --!>