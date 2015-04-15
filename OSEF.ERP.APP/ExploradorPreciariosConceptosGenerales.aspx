<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploradorPreciariosConceptosGenerales.aspx.cs" Inherits="OSEF.ERP.APP.ExploradorPreciariosGenerales" %>

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
    <script type='text/javascript' src="js/exploradorConceptoPreciarioGeneral.js"></script>

</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    
       <ext:ResourceManager ID="rmExploradorConceptosPreciario" runat="server" HideInDesign="true">
        </ext:ResourceManager>

      <ext:Hidden ID="GridData" runat="server" />
        <ext:GridPanel
            ID="gpExploradorConceptosPreciarioGeneral"
            runat="server"
            Height="420"
            Width="1000"
           
            Title="EXPLORADOR CONCEPTOS PRECIARIOS GENERALES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbPreciarios" runat="server">
                    <Items>

                   
                            
                            
                            <ext:ComboBox
                                ID="cmbUsuario"
                                runat="server"
                                LabelWidth="70"
                                Width="230"
                                FieldLabel="USUARIO"
                                DisplayField="Nombre"
                                ValueField="ID"
                                Editable="true"
                                MatchFieldWidth="true"
                                ForceSelection="true"
                                QueryMode="Local"
                                TypeAhead="true"
                                EnforceMaxLength="true"
                                >
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Store>
                                <ext:Store ID="sUsuarios" runat="server">
                                    <Model>
                                        <ext:Model ID="mUsuarios" runat="server" IDProperty="ID">
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
                                </ext:Store>
                                </Store>
                                 <Listeners>
                                    <Select Fn="cmbUsuarioFiltro_Select" />
                                </Listeners>
                            </ext:ComboBox>


                             <ext:ComboBox
                                ID="cmbSucursal"
                                runat="server"
                                LabelWidth="70"
                                Width="350"
                                FieldLabel="SUCURSAL"
                                ValueField="ID"
                                Cls="spanCustomCombo xEspacioCmbxCustom"
                                PageSize="10"
                                DisplayField="Nombre"
                                StyleSpec="margin-right: 6px;"
                                Editable="true"
                                MatchFieldWidth="true"
                                ForceSelection="true"
                                QueryMode="Local"
                                TypeAhead="true"
                                EnforceMaxLength="true">
                                 <ListConfig ID="lcPreciario" runat="server" Width="400" Cls="xEspacioCmbxCustom">
                                    <ItemTpl ID="itPreciario" runat="server">
                                        <Html>
                                            <div class="search-item">
							                    <h3>{CR}</h3>
                                                <span>{Nombre}</span>
						                    </div>
                                        </Html>
                                    </ItemTpl>
                                </ListConfig>
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos"  />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbSucursalFiltro_Select" />
                                </Listeners>
                                <Store>
                                    <ext:Store
                                        ID="sSucursales"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mSucursales" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                    <ext:ModelField Name="CR" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                            </ext:ComboBox>
 
                        
                        <ext:ToolbarSpacer 
                        runat="server" 
                        ID="tsExploradorGeneralOrdenesEstimaciones" 
                        Width="150">
                        
                        </ext:ToolbarSpacer>

                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="BUSCAR CLAVE/CONCEPTO"
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
                <ext:Store ID="sPreciarioConcepto" runat="server">
                    <Model>
                        <ext:Model ID="mPreciarioConcepto" runat="server">
                            <Fields>

                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Renglon" Type="Int" />
                                <ext:ModelField Name="ConceptoID" Type="String" />
                                <ext:ModelField Name="Cantidad" Type="Float" />
                                <ext:ModelField Name="Unidad" Type="String"/>
                                <ext:ModelField Name="Precio" Type="Float"/>
                                <ext:ModelField Name="Importe" Type="Float" />
                                <ext:ModelField Name="RMovimiento" Type="Object" />
                                <ext:ModelField Name="RPreciarioConceptos" Type="Object" />

                            </Fields>
                        </ext:Model>
                    </Model>
                   <%-- <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>--%>
                    <Listeners>
                        <DataChanged Fn="sExploradorPConcepto_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>

            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cClave"
                        runat="server"
                        Text="CLAVE"
                        Align="Center"
                        Width="80"
                        DataIndex="ConceptoID">
                         <Renderer Fn="cClave_Renderer" />
                    </ext:Column>
                    <ext:Column 
                        ID="ccConcepto"
                        runat="server"
                        Text="CONCEPTO"
                        Align="Center"
                        Width="260"
                        DataIndex="ConceptoID">
                         <Renderer Fn="cConcepto_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cCantidad"
                        runat="server"
                        Text="CANTIDAD"
                        Align="Center"
                        Width="90"
                        DataIndex="Cantidad">
                         <Renderer Fn="cCantidad_Renderer" />
                    </ext:Column>
                   <ext:Column
                        ID="cUnidad"
                        runat="server"
                        Text="UNIDAD"
                        Align="Center"
                        Width="90"
                        DataIndex="Unidad">
                    </ext:Column>
                     <ext:Column
                        ID="ccPrecio"
                        runat="server"
                        Text="PRECIO"
                        Align="Center"
                        Width="100"
                        DataIndex="Precio">
                        <Renderer Fn="txtCosto_renderer" />
                    </ext:Column>
                     <ext:Column
                        ID="cImporte"
                        runat="server"
                        Text="IMPORTE"
                        Align="Center"
                        Width="100"
                        DataIndex="Importe">
                        <Renderer Fn="cImporte_renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cMov"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Left"
                        Width="150"
                        DataIndex="ConceptoID">
                        <Renderer Fn="cMov_renderer" />

                          <HeaderItems>
                             <ext:TextField
                                    ID="txtFiltroMovimiento"
                                    runat="server"
                                    EmptyText="MOVIMIENTO">
                                            <Listeners>
                                                <Change Fn="txtMov_Change" />
                                            </Listeners>
                                </ext:TextField>
                        </HeaderItems>

                       <%-- <HeaderItems>
                             <ext:ComboBox
                        ID="cmbPreciario"
                        runat="server"
                        EmptyText="MOVIMIENTO"
                        Margins="0 3 0 0"
                        Cls="spanCustomCombo xEspacioCmbxCustom"
                        AllowBlank="false"
                        ForceSelection="true"
                        QueryMode="Local"
                        TypeAhead="true">
                            <Items>
                                <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                <ext:ListItem Index="1" Text="Mesa de reporte" Value="Mesa de reporte" />
                                <ext:ListItem Index="2" Text="Orden de Cambio" Value="Orden de Cambio" />
                            </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbMovimientoFiltro_Select" />
                                </Listeners>
                                                                   
                    </ext:ComboBox>
                        </HeaderItems>--%>
                    </ext:Column>
                    <ext:DateColumn
                        ID="cFechaEmision"
                        runat="server"
                        Text="FECHA EMISIÓN"
                        Align="Left"
                       Format="dd/MM/yyyy"
                        Width="120"
                        DataIndex="ConceptoID">
                        <Renderer Fn="cFecha_renderer" />
                         <HeaderItems>
                            <ext:ComboBox
                                ID="cmbFechaRevision"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todo)" />
                                    <ext:ListItem Index="1" Text="Hoy" />
                                    <ext:ListItem Index="2" Text="Ayer" />
                                    <ext:ListItem Index="3" Text="Mañana" />
                                    <ext:ListItem Index="4" Text="Esta semana" />
                                    <ext:ListItem Index="5" Text="Semana pasada" />
                                    <ext:ListItem Index="6" Text="Este mes" />
                                    <ext:ListItem Index="7" Text="Mes móvil" />
                                    <ext:ListItem Index="8" Text="Mes pasado" />
                                    <ext:ListItem Index="9" Text="Este año" />
                                    <ext:ListItem Index="10" Text="Año móvil" />
                                    <ext:ListItem Index="11" Text="Año pasado" />
                                    <ext:ListItem Index="12" Text="Enero" />
                                    <ext:ListItem Index="13" Text="Febrero" />
                                    <ext:ListItem Index="14" Text="Marzo" />
                                    <ext:ListItem Index="15" Text="Abril" />
                                    <ext:ListItem Index="16" Text="Mayo" />
                                    <ext:ListItem Index="17" Text="Junio" />
                                    <ext:ListItem Index="18" Text="Julio" />
                                    <ext:ListItem Index="19" Text="Agosto" />
                                    <ext:ListItem Index="20" Text="Septiembre" />
                                    <ext:ListItem Index="21" Text="Octubre" />
                                    <ext:ListItem Index="22" Text="Noviembre" />
                                    <ext:ListItem Index="23" Text="Diciembre" />
                                    <ext:ListItem Index="24" Text="Especifica..." />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:DateColumn>
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemDblClick Fn="gpExploradorConceptos_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvExploradorPreciarioConcepto"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmExploradorPreciarioConcepto"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbExploradorPreciarioConcepto"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>
