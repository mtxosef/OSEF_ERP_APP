﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title>OSEF Technology</title>
    <link rel="shortcut icon" href="images/myApp2.ico" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro2.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <link rel="stylesheet" href="css/login2.css" />
    <script type="text/javascript" src="js/default.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmDefault" runat="server" HideInDesign="true" />

        <ext:Store ID="sUsuario" runat="server">
            <Model>
                <ext:Model ID="mUsuario" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Bloqueado" Type="Boolean" />
                        <ext:ModelField Name="EnLinea" Type="Boolean" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="FechaBloqueo" Type="Date" />
                        <ext:ModelField Name="UltimoAcceso" Type="Date" />
                        <ext:ModelField Name="CambioContrasena" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
            <DirectEvents>
                <Load OnEvent="sUsuario_Load" Success="sUsuario_Load_Success" />
            </DirectEvents>
        </ext:Store>

        <div id="wrap">
            <!-- Header -->
            <div id="nav-bar" class="">
                <div class="pull-left">
                    <div id="header-container">
                        <a href="Default.aspx"><img src="images/logo-banco3.png" class="imgs" alt="logo" /></a>
                    </div>
                </div>
                <div class="pull-right">
                    <div id="top-info" class="pull-right">
                        <a id="settings" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <a id="logged-user" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <div class="pull-left">
                            <ext:Button 
                                ID="btnUsuario"
                                runat="server"
                                Width="290"
                                Text=""
                                Cls="xBtnCustomDesplegable">
                                <Menu>
                                    <ext:Menu ID="mOpciones" runat="server">
                                        <Items>
                                            <ext:MenuItem ID="miConfiguracion" runat="server" Text="Configuración">
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="miCambiarContrasena" runat="server" Text="Cambiar contraseña">
                                                <Listeners>
                                                    <Click Fn="miCambiarContrasena_Click" />
                                                </Listeners>
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="miCerrarSesion" runat="server" Text="Cerrar sesión">
                                                   <DirectEvents>
                                                        <Click  OnEvent="miCerrarSesionClick"></Click>
                                                   </DirectEvents>
                                            </ext:MenuItem>
                                        </Items>
                                    </ext:Menu>
                                </Menu>
                            </ext:Button>
                        </div>
                    </div>
                </div>
                <!--Boton Regresar-->
                <ext:ImageButton
                    ID="imgbtnRegresar"
                    runat="server"
                    ImageUrl="assets/img/controles/btnRegresar.png"
                    OverImageUrl="assets/img/controles/btnRegresarOver.png"
                    PressedImageUrl="assets/img/controles/btnRegresarPressed.png" ToolTip="Regresar"
                    Height="50"
                    Width="50"
                    Hidden="true" 
                    StyleSpec="margin-left: 900px; margin-right: auto; margin-top:20px;">
                    <Listeners>
                        <Click Handler="
                            App.imgbtnRegresar.hide();
                            parent.App.pCentro.getLoader().load('Menu.aspx');">
                        </Click>
                    </Listeners>
               </ext:ImageButton>
                 <!--Fin Boton Regresar-->
               
            </div>
            <ext:Panel 
                ID="pCentro"
                runat="server"
                Height="480"
                Width="1280"
                Region="Center"
                StyleSpec="margin-left: 30px; margin-right: auto; margin-top:20px;"
                BodyStyle="background-color:transparent;"
                AutoRender="true"
                Cls="visible">
                <Loader
                    ID="lCentro"
                    runat="server"
                    Mode="Frame"
                    AutoLoad="true"
                    Scripts="true"
                    Url="Menu2.aspx">
                    <LoadMask ShowMask="True" Msg="Cargando...">
                    </LoadMask>
                </Loader>
            </ext:Panel>
        </div>
        <%-- Footer--%>
        <div id="footer-menu">
            <div id="creditos" class="creditos-menu" >
                <p>© 2014 Osef Technology</p>
                <div id="social">
                    <ul>
                        <li ><a href="#">
                    
                            <img src="images/fb.png" alt="Facebook" class="imgs"  />
                        
                            </a></li>
                        <li><a href="#">
                            <img src="images/twiter.png" alt="Twitter" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="images/youtube.png" alt="YouTube" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="images/linked.png" alt="LinkedIn" class="imgs"  /></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <%-- Footer--%>

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Cls="xEstiloCaja"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="true"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
            <Listeners>
                <Show Handler="this.resizer.disable();" Single="true" />
            </Listeners>
        </ext:Window>

    </form>
</body>
</html>
