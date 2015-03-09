<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VistaPreliminar.aspx.cs"
    Inherits="OSEF.ERP.APP.VistaPreliminar" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vista Preliminar</title>
     <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" href="css/preliminar.css" />

  <%--  <script type="text/javascript">
        var myFunction = function (response, result) {
         var ruta=   result.extraParamsResponse.ruta;
         window.open(ruta, 'Reporte', 'status = 1,width=900, resizable = 1');

        }
 </script>--%>
</head>
<body style="">
    <form id="form1" runat="server">
    <div id="wrapper">
        <div id="header">
            <img src="images/logo.png" alt="logo" class="imgs logo-image" />
        </div>
        <ext:ResourceManager ID="rmVistaPreliminar" runat="server">
        </ext:ResourceManager>


        <ext:FieldContainer
                    ID="ContenedorID" 
                    runat="server" 
                    FieldLabel="EXPORTAR A" 
                    AnchorHorizontal="100%" 
                    StyleSpec="margin-left: 900px; margin-right: auto; margin-top:20px;"
                    Layout="ColumnLayout">                                       
                    <Items>
                          <ext:ImageButton
                                    ID="imgbtnRegresar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/pdfNormal.png"
                                    OverImageUrl="assets/img/controles/pdfOver.png"
                                    PressedImageUrl="assets/img/controles/pdfPressed.png" ToolTip="Exportar a PDF"
                                    Height="50"
                                     StyleSpec="margin-right: 10px;"
                                    Width="50"
                                    Hidden="false" >
                                    <DirectEvents>
                                    <Click OnEvent="toPDF" Success="myFunction"></Click>
                                    </DirectEvents>
                         </ext:ImageButton>
                           <ext:ImageButton
                                        ID="imgBtnExportarExcel"
                                        runat="server"
                                        ImageUrl="assets/img/controles/ExcelNormal.png"
                                        OverImageUrl="assets/img/controles/ExcelOver.png"
                                        PressedImageUrl="assets/img/controles/ExcelPressed.png" ToolTip="Exportar a Excel"
                                        Height="50"
                                        Width="50"
                                        Hidden="false" >
                                     <DirectEvents>
                                    <Click OnEvent="toXLS" ></Click> <%--Success="myFunction"--%>
                                    </DirectEvents>
                             </ext:ImageButton>
                    </Items>
                </ext:FieldContainer>


       

       

        <div id="body" align="center">
            <CR:CrystalReportViewer 
            ID="crvEstimaciones" 
            runat="server"
            Visible="true" 
            AutoDataBind="true" />
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
