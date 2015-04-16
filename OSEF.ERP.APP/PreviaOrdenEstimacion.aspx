﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviaOrdenEstimacion.aspx.cs" Inherits="OSEF.ERP.APP.PreviaOrdenEstimacion" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vista Preliminar</title>
     <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" href="css/preliminar.css" />

</head>
<body>
    <form id="form1" runat="server">
   
     <div id="wrapper">
        <div id="header">
            <img src="images/Ibuho.png" alt="logo" class="imgs logo-image" />
        </div>


        <div class="BotonesReportes">
     
          SELECCIONA REPORTE:
            <asp:ImageButton 
            ID="imgbtnGenerador" 
            runat="server" 
            OnClick="imgbtnGenerador_click"
            Height="50"
            Width="50"
            class="imgs" 
            ImageUrl="assets/img/controles/generador.png"/>

            <asp:ImageButton 
            ID="imgbtnCroquis" 
            runat="server" 
            class="imgs" 
            OnClick="imgbtnCroquis_click"
             Height="50"
             Width="50"
            ImageUrl="assets/img/controles/croquis.png"/>

              <asp:ImageButton 
            ID="imgbtnFacturas" 
            runat="server"
            OnClick="imgbtnFactura_click"
             Height="50"
             Width="50"
            class="imgs" 
            ImageUrl="assets/img/controles/facturas.png"/>

            <asp:ImageButton 
            ID="imgbtnFotos" 
            runat="server" 
            class="imgs" 
            OnClick="imgbtnFotos_click"
             Height="50"
             Width="50"
            ImageUrl="assets/img/controles/imagenes.png"/>

        EXPORTAR A:
            <asp:ImageButton 
            ID="imgbtnPdf" 
            runat="server" 
           OnClick="toPDF"
             Height="50"
             Width="50"
            class="imgs" 
            ImageUrl="assets/img/controles/pdfNormal.png"/>

            <asp:ImageButton 
            ID="imgbtnXls" 
            runat="server" 
            class="imgs" 
         OnClick="toXls"
             Height="50"
             Width="50"
            ImageUrl="assets/img/controles/ExcelNormal.png"/>
        </div>

        
        <div id="body" align="center">
          
            <CR:CrystalReportViewer ID="crvVisor" runat="server" AutoDataBind="false"  />

        </div>


        <div id="footer">
            <div id="creditos" class="creditos">
                <p>
                    © 2014 Osef Technology
                </p>
            </div>
        </div>
        
    </div>

    </form>
</body>
</html>