<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="OSEF.ERP.APP.Reportes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <script type="text/javascript" src="js/reportes.js"></script>

</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmReportes" runat="server" HideInDesign="true" />


     <ext:GridPanel
            ID="gpReportes"
            runat="server"
            Height="400"
            Width="960"
            Title="REPORTES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;"
            Cls="x-CustomTreePanel">
            <LeftBar>
                <ext:Toolbar ID="tReportes" runat="server">
                    <Items>            
                           <ext:TreePanel 
                            ID="tpReportes" 
                            runat="server" 
                            Width="950" 
                            Height="270" 
                            Icon="BookOpen" 
                            AutoScroll="true"
                            Header="false">           
                            <Root>
                                <ext:Node Text="Reportes" Expanded="true">
                                    <Children>
                                          
                                        <ext:Node Text="Preciarios">
                                            <Children>
                                            <ext:Node Text="Reporte Evidencia Concepto" NodeID="P1"   Leaf="true" />
                                            <ext:Node Text="Reporte Administracion de Inmuebles" NodeID="P2"   Leaf="true" />
                                            <ext:Node Text="Reporte Resumen de Partidas" NodeID="P3"   Leaf="true" />
                                            <ext:Node Text="Reporte Presupuesto" NodeID="P4"   Leaf="true" />
                                            <ext:Node Text="Reporte 5(Aún no hay)" NodeID="P5"   Leaf="true" />
                                            
                                            </Children>
                                        </ext:Node>
                                        

                                    </Children>
                                </ext:Node>
                            </Root>
                            <ColumnModel>
                                <Columns>
                                    <ext:TreeColumn 
                                    ID="tcReportes" 
                                    runat="server" 
                                    Flex="1" 
                                    DataIndex="text" />
                                    <ext:CommandColumn 
                                    ID="ccReportes" 
                                    runat="server" 
                                    Align="Left"
                                    Width="620">
                                        <Commands>
                                            <ext:GridCommand 
                                            CommandName="VerReporte" 
                                            Icon="PageWhiteExcel" 
                                            ToolTip-Text="Ver Reporte" />
                                        </Commands>
                                        <PrepareToolbar Handler="return record.data.leaf;" />
                                        <Listeners>
                                            <Command Fn="ccAcciones_Command" />
                                        </Listeners>
                                    </ext:CommandColumn>
                                </Columns>
                            </ColumnModel>
                        </ext:TreePanel>            
                    </Items>
                </ext:Toolbar>
            </LeftBar>
            <TopBar>
                <ext:Toolbar ID="tbReportes" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            Disabled="true"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit-normal.png"
                            DisabledImageUrl="assets/img/controles/edit-disable.png"
                            OverImageUrl="assets/img/controles/edit-over.png"
                            PressedImageUrl="assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsReportes" runat="server" Width="500">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            ToolTip="Actualizar códigos postales"
                            Height="50"
                            Disabled="true"
                            Width="50">
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            Disabled="true"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/search.png"
                                    OverImageUrl=""
                                    Disabled="true"
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">                                              
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <FooterBar>
                <ext:StatusBar
                    ID="sbCodigosPostales"
                    runat="server"
                    Text="Selecciona el reporte que desees visualizar"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>


    </form>
</body>
</html>
