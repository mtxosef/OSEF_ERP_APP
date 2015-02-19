﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvidasteContrasena.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaOlvidoContrasena" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <link rel="stylesheet" href="css/xMask.css" />
    <link rel="stylesheet" href="css/xDatePicker.css" />
    <link rel="stylesheet" href="css/xSplitButton.css" />
    <link rel="stylesheet" href="css/xGridPanel.css" />
    <link rel="stylesheet" href="css/xWindowPopup.css" />
    <link rel="stylesheet" href="css/xTabPanel.css"/>
    <link rel="stylesheet" href="css/xComboBox.css"/>
    <link rel="stylesheet" href="css/xCustomChart.css"/>
    <link rel="stylesheet" href="css/xIcons.css"/>
    <link rel="stylesheet" href="css/xToolbar.css"/>
    <link rel="stylesheet" href="css/xLabel.css"/>
    <link rel="stylesheet" href="css/xTreePanel.css"/>
    <link rel="stylesheet" href="css/xHiperlink.css"/>
    <link rel="stylesheet" href="css/xTextField.css"/>
    <link rel="stylesheet" href="css/xFieldSet.css"/>
    <link rel="stylesheet" href="css/xPanel.css"/>
    <link rel="stylesheet" href="css/xButton.css"/>
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmOlvidoContraseña" runat="server" />

     <img src="images/logo-banco.png" alt="logo" class="imgs logo-image" />

      <ext:FormPanel 
        ID="FormPanel1" 
        runat="server"
        Title="Restablecer Contraseña"
        Width="450"
        StyleSpec="margin:0 auto; margin-top: 180px;"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
            <ext:FieldContainer 
            ID="ContenedorNombre" 
            runat="server" 
            FieldLabel="¿Olvidaste tu contraseña?" 
            AnchorHorizontal="100%"
            LabelWidth="180"
            Layout="HBoxLayout">
            </ext:FieldContainer>

            <ext:FieldSet ID="FieldSet1" 
                runat="server"
                Title="Instrucciones"
                Collapsible="False"
                DefaultAnchor="100%">
                <Items>
                    <ext:FieldContainer ID="FieldContainer2" 
                        runat="server"
                        LabelWidth="380"
                        FieldLabel="Ingresa tu usuario o dirección de correo para restablecer tu contraseña"
                        Layout="HBoxLayout">                        
                        </ext:FieldContainer>
                    <ext:FieldContainer ID="FieldContainer3" 
                        runat="server" 
                        FieldLabel=" Puede que tengas que ver en tu carpeta de spam o desbloquear no-reply@osef.com.mx" 
                        Layout="HBoxLayout"
                        LabelWidth="380">
                      </ext:FieldContainer>
                </Items>
                 </ext:FieldSet>

                    
                  <ext:TextField 
                  ID="txtEnviaCorreo" 
                  EmptyText="Usuario/Dirección E-mail" 
                  runat="server" />
        </Items>
        <Buttons>
                <ext:ImageButton 
                    ID="imbtnLogin" 
                    runat="server" 
                    ImageUrl="assets/img/controles/EnviarNormal.png"
                    OverImageUrl="assets/img/controles/EnviarOver.png" 
                    PressedImageUrl="assets/img/controles/EnviarPressed.png"
                    ToolTip="Enviar" 
                    Width="50"
                    Height="50">
                </ext:ImageButton>
        </Buttons>
    </ext:FormPanel>




     <div id="footer">
            <div id="creditos" class="creditos">
                <p>
                    © 2014 Osef Technology
                </p>
                <%-- Descomentar si se desean redes sociales e ir a login.css y despues 
                       a la clase .footer y foter-menu y comentar las lineas de margin
               
                       <div id="social-login">
                        <ul>
                            <li ><a href="#">
                    
                                <img src="img/social/fb.png" alt="Facebook" class="imgs"  />
                        
                                </a></li>
                            <li><a href="#">
                                <img src="img/social/twiter.png" alt="Twitter" class="imgs"  /></a></li>
                            <li><a href="#">
                                <img src="img/social/youtube.png" alt="YouTube" class="imgs"  /></a></li>
                            <li><a href="#">
                                <img src="img/social/linked.png" alt="LinkedIn" class="imgs"  /></a></li>
                        </ul>
                    </div>--%>
            </div>
        </div>

    </form>
</body>
</html>