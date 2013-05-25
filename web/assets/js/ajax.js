/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var req;
//llama al servlet ContarCaracteres
function Habilitar(usuario){
    alert('Habilitando usuario. Recibirá un mensaje de confirmación en breves segundos');
    var url = "HabilitarUsuario?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = function() {
        callbackHabilitar(usuario);
    };
    req.open("POST", url, true);
    req.send(null);
}
//crear el objeto XMLHttpRequest
function iniciarPeticion() {
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
}
//funcion que obtiene la respuesta del servlet ContarCaracteres (asincronamente)
function callbackHabilitar(usuario) {
    if (req.readyState == 4) {
        if (req.status == 200) {
            if (document.getElementById("BotonHabilitar")!=null){
                document.getElementById("BotonHabilitar").onclick = function(){
                    Deshabilitar(usuario)
                };
                document.getElementById("BotonHabilitar").className = "btn btn-warning";
                document.getElementById("BotonHabilitar").setAttribute("value", "Deshabilitar");
            }
            if (document.getElementById("BotonDeshabilitar")!=null){
                document.getElementById("BotonDeshabilitar").onclick = function(){
                    Deshabilitar(usuario)
                };
                document.getElementById("BotonDeshabilitar").className = "btn btn-warning";            
                document.getElementById("BotonDeshabilitar").setAttribute("value", "Deshabilitar");
            }
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario Habilitado satisfactoriamente</label></center>";
            alert('Correo enviado satisfactoriamente');
        }
    }
}

function Deshabilitar(usuario){
    var url = "DeshabilitarUsuario?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = function() {
        callbackDeshabilitar(usuario)
    };
    req.open("POST", url, true);
    req.send(null);
}

function callbackDeshabilitar(usuario) {
    if (req.readyState == 4) {
        if (req.status == 200) {
            if (document.getElementById("BotonHabilitar")!=null){
                document.getElementById("BotonHabilitar").onclick = function(){
                    Habilitar(usuario)
                };
                document.getElementById("BotonHabilitar").className = "btn btn-success";
                document.getElementById("BotonHabilitar").setAttribute("value", "Habilitar");
            }
            if (document.getElementById("BotonDeshabilitar")!=null){
                document.getElementById("BotonDeshabilitar").onclick = function(){
                    Habilitar(usuario)
                };
                document.getElementById("BotonDeshabilitar").className = "btn btn-success";            
                document.getElementById("BotonDeshabilitar").setAttribute("value", "Habilitar");
            }
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario Deshabilitado satisfactoriamente</label></center>";
        }
    }
}

function serUsuario(usuario){
    var url = "CambiarAUsuario?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = callbackSerUsuario;
    req.open("POST", url, true);
    req.send(null);
}

function serInspector(usuario){
    var url = "CambiarAInspector?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = callbackSerInspector;
    req.open("POST", url, true);
    req.send(null);
}

function serSupervisor(usuario){
    var url = "CambiarASupervisor?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = callbackSerSupervisor;
    req.open("POST", url, true);
    req.send(null);
}

function serAdministrador(usuario){
    var url = "CambiarAAdministrador?usuario=" + usuario;
    iniciarPeticion();
    req.onreadystatechange = callbackSerAdministrador;
    req.open("POST", url, true);
    req.send(null);
}

function callbackSerUsuario() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            //document.getElementById("BotonUsuario").disabled = true;
            document.getElementById("BotonUsuario").selected = true;
            //document.getElementById("BotonSupervisor").disabled = false;
            //document.getElementById("BotonInspector").disabled = false;
            //document.getElementById("BotonAdministrador").disabled = false;
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario tiene permisos de usuario</label></center>";
        }
        
    }
}
function callbackSerSupervisor() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            //document.getElementById("BotonUsuario").disabled = false;
            //document.getElementById("BotonSupervisor").disabled = true;
            document.getElementById("BotonSupervisor").selected = true;
            //document.getElementById("BotonInspector").disabled = false;
            //document.getElementById("BotonAdministrador").disabled = false;
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario tiene permisos de Supervisor</label></center>";
        }
        
    }
}
function callbackSerInspector() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            //document.getElementById("BotonUsuario").disabled = false;
            //document.getElementById("BotonSupervisor").disabled = false;
            //document.getElementById("BotonInspector").disabled = true;
            document.getElementById("BotonInspector").selected = true;
            //document.getElementById("BotonAdministrador").disabled = false;
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario tiene permisos de Inspector</label></center>";
        }
        
    }
}
function callbackSerAdministrador() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            //document.getElementById("BotonUsuario").disabled = false;
            //document.getElementById("BotonSupervisor").disabled = false;
            //document.getElementById("BotonInspector").disabled = false;
            //document.getElementById("BotonAdministrador").disabled = true;
            document.getElementById("BotonAdministrador").selected = true;
            document.getElementById("MensajeHabilitacion").innerHTML = "<center><label style=\"color:blue\">Usuario tiene permisos de Administración</label></center>";
        }
        
    }
}

function Cerrar(periodo){
    var url = "CerrarPeriodo?periodo=" + periodo;
    iniciarPeticion();
    req.onreadystatechange = function() {
        callbackCerrarPeriodo(periodo)
    };
    req.open("POST", url, true);
    req.send(null);
}

function callbackCerrarPeriodo(periodo) {
    if (req.readyState == 4) {
        if (req.status == 200) {
            document.getElementById(periodo).className = "btn btn-success";
            document.getElementById(periodo).onclick = function(){
                ReAbrir(periodo)
            };  
            document.getElementById(periodo).setAttribute("value", "Reabrir");
            document.getElementById("MensajeCerrado").innerHTML = "<center><label style=\"color:blue\">El período ha sido cerrado satisfactoriamente</label></center>";
            document.getElementById("Estado"+periodo).innerHTML = "Cerrado";
            document.getElementById("Parrafo").innerHTML = "";
        } 
    }
}

function ReAbrir(periodo){
    var url = "ReAbrirPeriodo?periodo=" + periodo;
    iniciarPeticion();
    req.onreadystatechange = function() {
        callbackReAbrirPeriodo(periodo)
    };
    req.open("POST", url, true);
    req.send(null);
}

function callbackReAbrirPeriodo(periodo) {
    if (req.readyState == 4) {
        if (req.status == 200) {
            document.getElementById(periodo).className = "btn btn-warning";
            document.getElementById(periodo).onclick = function(){
                Cerrar(periodo)
            };   
            document.getElementById(periodo).setAttribute("value", "Cerrar");
            document.getElementById("MensajeCerrado").innerHTML = "<center><label style=\"color:blue\">El período ha sido reabierto para recibir nuevas solicitudes</label></center>";
            document.getElementById("Estado"+periodo).innerHTML = "Abierto";
            document.getElementById("Parrafo").innerHTML = "";
        } 
    }
}