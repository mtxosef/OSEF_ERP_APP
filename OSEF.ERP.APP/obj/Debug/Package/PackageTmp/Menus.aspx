﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menus.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Menus" %>

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
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
    <script type='text/javascript' src="js/menus.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmMenus" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpMenus"
            runat="server"
            Height="420"
            Width="960"
            Title="MENÚS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;"
            Cls="xCustomTable">
            <TopBar>
                <ext:Toolbar ID="tbMenus" runat="server">
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
                            <Listeners>
                                <Click Fn="imgbtnBorrar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsMenu" runat="server" Width="500">
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
                                <Click Handler="#{sMenus}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtfBuscar_Change" />
                            </Listeners>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnActualizarGrupoMenu"
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
                    ID="sMenus"
                    runat="server"
                    OnReadData="OnReadData_sMenus">
                    <Model>
                        <ext:Model ID="mMenus" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="GrupoMenu" Type="String" />
                                <ext:ModelField Name="RGrupoMenu" Type="Object" />
                                <ext:ModelField Name="RGrupoMenuDescripcion" Type="String">
                                    <Convert Fn="RGrupoMenuDescripcion_Convert" />
                                </ext:ModelField>
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sMenus_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="100"
                        DataIndex="ID" />
                    <ext:Column
                        ID="cDescripcion"
                        runat="server"
                        Text="DESCRIPCIÓN"
                        Align="Left"
                        Width="658"
                        DataIndex="Descripcion" />
                    <ext:Column
                        ID="cGrupoMenu"
                        runat="server"
                        Text="GRUPO MENÚ"
                        Align="Left"
                        Width="200"
                        DataIndex="RGrupoMenuDescripcion">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbGrupoMenu"
                                runat="server"
                                ValueField="ID"
                                DisplayField="Descripcion"
                                Editable="false">
                                <Store>
                                    <ext:Store
                                        ID="sGruposMenu"
                                        runat="server">
                                        <Model>
                                            <ext:Model
                                                ID="mGruposMenu"
                                                runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="TODOS" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:Column>
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemClick Fn="gpMenus_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmMenus"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbMenus"
                    runat="server"
                    Text="4 MENUS"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </form>
</body>
</html>