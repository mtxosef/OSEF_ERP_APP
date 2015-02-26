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
     <ext:ResourceManager ID="rmCodigosPostales" runat="server" HideInDesign="true" />


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
                            Width="270" 
                            Height="310" 
                            Icon="BookOpen" 
                            AutoScroll="true"
                            Header="false">           
                            <Root>
                                <ext:Node Text="Reportes" Expanded="true">
                                    <Children>
                                                <ext:Node Text="Avances" >
                                                    <Children>
                                                        <ext:Node Text="Hijo">
                                                            <Children>
                                                            <ext:Node Text="No. 1 - C"  Leaf="true" />
                                                            <ext:Node Text="No. 2 - B-Flat Major"  Leaf="true" />
                                                            <ext:Node Text="No. 3 - C Minor"  Leaf="true" />
                                                            <ext:Node Text="No. 4 - G Major"  Leaf="true" />
                                                            <ext:Node Text="No. 5 - E-Flat Major" Leaf="true" />
                                                            </Children>
                                                     </ext:Node>
                                                    </Children>
                                                </ext:Node>
                                                <ext:Node Text="Volumetrías" >
                                                    <Children>
                                                        <ext:Node Text="Hijo">
                                                            <Children>
                                                            <ext:Node Text="No. 1 - C"  Leaf="true" />
                                                            <ext:Node Text="No. 2 - B-Flat Major"  Leaf="true" />
                                                            <ext:Node Text="No. 3 - C Minor"  Leaf="true" />
                                                            <ext:Node Text="No. 4 - G Major"  Leaf="true" />
                                                            <ext:Node Text="No. 5 - E-Flat Major" Leaf="true" />
                                                            </Children>
                                                     </ext:Node>
                                                    </Children>
                                                </ext:Node>
                                                <ext:Node Text="Preciarios" >
                                                    <Children>
                                                        <ext:Node Text="Hijo">
                                                            <Children>
                                                            <ext:Node Text="No. 1 - C"  Leaf="true" />
                                                            <ext:Node Text="No. 2 - B-Flat Major"  Leaf="true" />
                                                            <ext:Node Text="No. 3 - C Minor"  Leaf="true" />
                                                            <ext:Node Text="No. 4 - G Major"  Leaf="true" />
                                                            <ext:Node Text="No. 5 - E-Flat Major" Leaf="true" />
                                                            </Children>
                                                     </ext:Node>
                                                    </Children>
                                                </ext:Node>
                                           </Children>
                                       </ext:Node>

                            </Root>
                            <BottomBar>
                                <ext:StatusBar ID="StatusBar1" runat="server" AutoClear="1500" />
                            </BottomBar>
                            <Listeners>
                                <ItemClick 
                                    Handler="#{StatusBar1}.setStatus({text: 'Node Selected: <b>' + record.data.text + '<br />', clear: false});"                     
                                    />
                                <ItemExpand 
                                    Handler="#{StatusBar1}.setStatus({text: 'Node Expanded: <b>' + item.data.text + '<br />', clear: false});" 
                                    Buffer="30"
                                    />
                                <ItemCollapse 
                                    Handler="#{StatusBar1}.setStatus({text: 'Node Collapsed: <b>' + item.data.text + '<br />', clear: false});" 
                                    Buffer="30"
                                    />
                            </Listeners>
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
                            Width="50">
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/search.png"
                                    OverImageUrl=""
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">                                              
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <ColumnModel>
                <Columns>
                    <ext:Column
                        ID="cEstado"
                        runat="server"
                        Text="ESTADO"
                        Align="Left"
                        Width="137"
                        DataIndex="Estado" />
                    <ext:Column 
                        ID="cMunicipio"
                        runat="server"
                        Text="MUNICIPIO"
                        Align="Center"
                        Width="148"
                        DataIndex="Municipio" />
                    <ext:Column
                        ID="cColonia"
                        runat="server"
                        Text="COLONIA"
                        Align="Left"
                        Width="198"
                        DataIndex="Colonia" />
                    <ext:NumberColumn
                        ID="ncCodigoPostal"
                        runat="server"
                        Text="CÓDIGO POSTAL"
                        Align="Left"
                        Width="138"
                        DataIndex="CodigoPostal" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmCodigosPostales"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbCodigosPostales"
                    runat="server"
                    Text="ESTATUS"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>


    </form>
</body>
</html>
