﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OSEF Technology</title>
    <link rel="shortcut icon" href="images/myApp2.ico" />
    <link rel="Stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
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
    <style type="text/css">
        #lLogin_Password-indicator {
            position: absolute;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <form id="form1" runat="server">
            <ext:ResourceManager ID="rmLogin" runat="server" HideInDesign="true" />

            <img src="images/logo-banco3.png" alt="logo" class="imgs logo-image" />

            <%--  Panel de Error--%>
            <ext:Container ID="cError" runat="server" Hidden="true">
                <Content>
                    <table>
                        <tr>
                            <td>
                                <img src="images/btnLogin_Adv.png" alt="img-error" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <ext:Label ID="lblError" runat="server" Text="Error, usuario incorrecto" />
                            </td>
                        </tr>
                    </table>
                </Content>
            </ext:Container>
            <%-- Fin panel de error --%>

        <%-- Inicio del cuerpo--%>
        <div id="center-panel-login">
            <asp:Login
                ID="lLogin"
                runat="server"
                OnAuthenticate="lLogin_Authenticate">
                <LayoutTemplate>
                    <ext:Panel 
                    ID="pDivisorColumnas" 
                    runat="server"
                    Width="400" 
                    BodyStyle="background-color:transparent;"
                    Layout="ColumnLayout">
                        <Items>
                            <ext:Panel 
                                ID="pImagen" 
                                runat="server"
                                BodyStyle="background-color:transparent;">
                                <Items>
                                    <ext:Image
                                        ID="imgLogin" 
                                        runat="server" 
                                        ImageUrl="images/user-login.png"
                                        Height="120" 
                                        Width="120">
                                    </ext:Image>
                                </Items>
                            </ext:Panel>
                            <ext:Panel 
                                ID="pLogin" 
                                runat="server"
                                BodyStyle="background-color:transparent;"
                                StyleSpec="margin-left: 20px;">
                                <Items>
                                    <ext:FieldContainer 
                                        ID="fcLoginbanner" 
                                        runat="server" 
                                        FieldLabel="Bienvenido" 
                                        AnchorHorizontal="100%"
                                        StyleSpec="margin-bottom: 18px;" 
                                        Cls="xCustomEncabezadoLogin"
                                        Layout="ColumnLayout">
                                    </ext:FieldContainer>
                                    <ext:FieldContainer 
                                        ID="fcUser" 
                                        runat="server" 
                                        AnchorHorizontal="100%" 
                                        Layout="ColumnLayout">
                                        <Items>
                                            <ext:TextField 
                                                ID="UserName" 
                                                runat="server" 
                                                AutoFocus="true" 
                                                EmptyText="Usuario"
                                                Width="250" 
                                                Height="30" 
                                                StyleSpec="margin-bottom: 8px;" 
                                                Cls="customTxtfield customFocus">
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>
                                    <ext:FieldContainer 
                                        ID="fcUserPassword" 
                                        runat="server" 
                                        AnchorHorizontal="100%" 
                                        Layout="ColumnLayout"
                                        StyleSpec="margin-bottom: 10px;" >
                                        <Items>
                                            <ext:TextField 
                                                ID="Password" 
                                                runat="server" 
                                                EmptyText="Contraseña" 
                                                InputType="Password"
                                                Width="250" 
                                                Height="30" 
                                                Cls="customTxtfield customFocus">
                                                <DirectEvents>
                                                    <SpecialKey
                                                        OnEvent="Password_SpecialKey"
                                                        Before="return e.getKey() == Ext.EventObject.ENTER"
                                                        Success="Password_SpecialKey_Success">
                                                        <EventMask ShowMask="true" MinDelay="1000" Msg="Ingresando..." />
                                                    </SpecialKey>
                                                </DirectEvents>
                                                <Plugins>
                                                    <ext:CapsLockDetector 
                                                        ID="cldPassword" 
                                                        runat="server">
                                                        <Listeners>
                                                            <CapsLockOn Handler="#{Password}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                                            <CapsLockOff Handler="#{Password}.hideIndicator();" />
                                                        </Listeners>
                                                    </ext:CapsLockDetector>
                                                </Plugins>
                                                <RightButtons>
                                                    <ext:ImageButton 
                                                        ID="imbtnLogin" 
                                                        runat="server" 
                                                        ImageUrl="assets/img/controles/login2.png"
                                                        OverImageUrl="assets/img/controles/login2hover.png" 
                                                        PressedImageUrl="assets/img/controles/login2pressed.png"
                                                        ToolTip="Entrar" 
                                                        Width="20">
                                                        <DirectEvents>
                                                            <Click OnEvent="imgbtnLogin_Click" Success="Password_SpecialKey_Success">
                                                                <EventMask ShowMask="true" MinDelay="1000" Msg="Ingresando..." />
                                                            </Click>
                                                        </DirectEvents>
                                                    </ext:ImageButton>
                                                </RightButtons>
                                            </ext:TextField>
                                        </Items>
                                    </ext:FieldContainer>
                                    <ext:HyperLink 
                                    ID="lnkOlvidoPsw" 
                                    runat="server" 
                                    Text="¿Olvidaste tu contraseña?"
                                    NavigateUrl="OlvidasteContrasena.aspx"
                                    Cls="customHiperlink">
                                    </ext:HyperLink>
                                </Items>
                            </ext:Panel>
                        </Items>
                    </ext:Panel>
                </LayoutTemplate>
            </asp:Login>
        </div>
        <%-- Fin cuerpo--%>

        <%--  Footer--%>
        <div id="footer">
            <div id="creditos" class="creditos" >
                <p>
                    © 2014 Osef Technology
                </p>
                <%-- Descomentar si se desean redes sociales e ir a login.css y despues 
                a la clase .footer y foter-menu y comentar las lineas de margin --%>
               
                <div id="social-login">
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
        <%--  Footer--%>

        </form>
    </div>
</body>
</html>
