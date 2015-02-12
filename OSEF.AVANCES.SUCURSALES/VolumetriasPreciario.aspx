<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VolumetriasPreciario.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Obra.VolumetriasPreciario" %>

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
    <script type='text/javascript' src="js/volumetrias.js"></script>

</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmVolumetrias" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpVolumetrias"
            runat="server"
            Height="420"
            Width="960"
            Title="VOLUMETRIAS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbVolumetrias" runat="server">
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
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
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
                            <Listeners>
                                <Click Fn="imgbtnEditar_Click" />
                            </Listeners>
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

                        <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="50">
                        </ext:ToolbarSpacer> 
                          
                      
                            <ext:ComboBox
                                ID="cmbEstatus"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="Estatus" />
                                    <ext:ListItem Index="1" Text="PENDIENTE" />
                                    <ext:ListItem Index="2" Text="BORRADOR" />
                                    <ext:ListItem Index="3" Text="CONCLUIDO" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>
                             <ext:ComboBox
                                ID="cmbUsuario"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="Usuario" />
                                    <ext:ListItem Index="1" Text="(Todos)" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>

                        <ext:ToolbarSpacer ID="tbsVolumetrias" runat="server" Width="103">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
                              <Listeners>
                                <Click Handler="#{sVolumetrias}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                                </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscar_Change" />
                            </Listeners>
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
            <Store>
                <ext:Store
                    ID="sVolumetrias"
                    runat="server">
                    <Model>
                        <ext:Model ID="mVolumetrias" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Preciario" Type="String" />
                                <ext:ModelField Name="RSucursal" Type="Object" />
                                <ext:ModelField Name="RPreciario" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sVolumetrias_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="150"
                        DataIndex="Mov">
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="280"
                        DataIndex="Sucursal">
                        <Renderer Fn="cSucursal_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cFechaEmision"
                        runat="server"
                        Text="FECHA EMISIÓN"
                        Align="Left"
                        Width="180"
                        Format="dd/MM/yyyy"
                        DataIndex="FechaEmision">
                    </ext:Column>
                    <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Center"
                        Width="150"
                        DataIndex="Estatus">
                    </ext:Column>
                     <ext:Column
                        ID="cPreciario"
                        runat="server"
                        Text="PRECIARIO"
                        Align="Center"
                        Width="175"
                        DataIndex="Preciario">
                        <Renderer Fn="cPreciario_Renderer" />
                    </ext:Column>
                   
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemClick Fn="gpVolumetrias_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvVolumetrias"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmVolumetrias"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbVolumetrias"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </form>
</body>
</html>
