<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VolumetriasPreciario.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Obra.VolumetriasPreciario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="../css/login.css" />
    <link rel="Stylesheet" href="../css/customControls.css" />
    <link rel="stylesheet" href="../css/xMask.css" />
    <link rel="stylesheet" href="../css/xDatePicker.css" />
    <link rel="stylesheet" href="../css/xSplitButton.css" />
    <link rel="stylesheet" href="../css/xGridPanel.css" />
    <link rel="stylesheet" href="../css/xWindowPopup.css" />
    <link rel="stylesheet" href="../css/xTabPanel.css"/>
    <link rel="stylesheet" href="../css/xComboBox.css"/>
    <link rel="stylesheet" href="../css/xCustomChart.css"/>
    <link rel="stylesheet" href="../css/xIcons.css"/>
    <link rel="stylesheet" href="../css/xToolbar.css"/>
    <link rel="stylesheet" href="../css/xLabel.css"/>
    <link rel="stylesheet" href="../css/xTreePanel.css"/>
    <link rel="stylesheet" href="../css/xHiperlink.css"/>
    <link rel="stylesheet" href="../css/xTextField.css"/>
    <link rel="stylesheet" href="../css/xFieldSet.css"/>
    <link rel="stylesheet" href="../css/xPanel.css"/>
    <link rel="stylesheet" href="../css/xButton.css"/>

    <script type='text/javascript' src="../js/obra/volumetrias.js"></script>
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
                            ImageUrl="../assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="../assets/img/controles/nuevo-disable.png"
                            OverImageUrl="../assets/img/controles/nuevo-over.png"
                            PressedImageUrl="../assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="../assets/img/controles/edit-normal.png"
                            DisabledImageUrl="../assets/img/controles/edit-disable.png"
                            OverImageUrl="../assets/img/controles/edit-over.png"
                            PressedImageUrl="../assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="../assets/img/controles/delete-normal.png"
                            DisabledImageUrl="../assets/img/controles/delete-disable.png"
                            OverImageUrl="../assets/img/controles/delete-over.png"
                            PressedImageUrl="../assets/img/controles/delete-pressed.png"
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
                                    <ext:ListItem Index="1" Text="(Todo)" />
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
                                    <ext:ListItem Index="1" Text="(Todo)" />
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
                            ImageUrl="../assets/img/controles/update-normal.png"
                            DisabledImageUrl="../assets/img/controles/update-disable.png"
                            OverImageUrl="../assets/img/controles/update-hover.png"
                            PressedImageUrl="../assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
                        </ext:ImageButton>


                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="../assets/img/controles/search.png"
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
                                <ext:ModelField Name="Movimiento" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="String" />
                                <ext:ModelField Name="Fotos" Type="Boolean" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="100"
                        DataIndex="Movimiento">
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="120"
                        DataIndex="Nombre">
                    </ext:Column>
                    <ext:Column
                        ID="cFechaEmision"
                        runat="server"
                        Text="FECHA EMISIÓN"
                        Align="Left"
                        Width="280"
                        DataIndex="FechaEmision">
                    </ext:Column>
                    <ext:Column
                        ID="cFotos"
                        runat="server"
                        Text="FOTOS"
                        Align="Left"
                        Width="280"
                        DataIndex="Fotos">
                    </ext:Column>
                </Columns>
            </ColumnModel>
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
