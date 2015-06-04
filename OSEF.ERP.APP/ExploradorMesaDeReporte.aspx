﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploradorMesaDeReporte.aspx.cs" Inherits="OSEF.ERP.APP.ExploradorMesaDeReporte" %>

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
    <script type='text/javascript' src="js/exploradorMesaDeReporte.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    
       <ext:ResourceManager ID="rmExploradorMesaDeReporte" runat="server" HideInDesign="true">
        </ext:ResourceManager>
        <ext:GridPanel
            ID="gpExploradorMesaDeReporte"
            runat="server"
            Height="420"
            Width="1000"           
            Title="EXPLORADOR MESA DE REPORTE"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbPreciarios" runat="server">
                    <Items>
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
                                StyleSpec="margin-right: 3px;"
                                Editable="true"
                                MatchFieldWidth="true"
                                ForceSelection="true"
                                QueryMode="Local"
                                TypeAhead="true"
                                EnforceMaxLength="true">
                                 <ListConfig ID="lcPreciario" runat="server" Width="400"                                                                Cls="xEspacioCmbxCustom">
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
                             <%--   <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>--%>
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
                                <Listeners>
                                <Change Fn="cmbSucursal_Change" />
                                </Listeners>
                            </ext:ComboBox>

                      
                            <ext:ComboBox
                                ID="cmbClasificacion"
                                runat="server"
                                FieldLabel="CLASIFICACIÓN"
                                ForceSelection="true"
                                Width="220"
                                Editable="false">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                    <ext:ListItem Index="1" Text="MOBILIARIO" Value="MOBILIARIO"/>
                                    <ext:ListItem Index="2" Text="CERRAJERIA" Value="CERRAJERIA"/>
                                    <ext:ListItem Index="3" Text="INMUEBLE" Value="INMUEBLE"/>
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbClasificacion_Select" />
                                </Listeners>
                            </ext:ComboBox>
                  

                        <ext:ToolbarSpacer 
                        runat="server" 
                        ID="tsExploradorMesaDeReporte" 
                        Width="20"> 
                        </ext:ToolbarSpacer>
                          

                         <ext:Container
                                ID="cMantenimientos"
                                runat="server">
                                 <Content>
                                     <asp:ImageButton 
                                        ID="imgbtnMantenimientos" 
                                        runat="server" 
                                        Height="22"
                                        Width="22"
                                        OnClick="ExportEt"
                                        class="imgs" 
                                        ImageUrl="assets/img/controles/ExcelNormal.png"/>
                                </Content>
                            </ext:Container>
                              
                        <ext:ImageButton
                                    ID="imgbtnFacturar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/fact.png"
                                    OverImageUrl=""
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">    
                                    <DirectEvents>
                                        <Click OnEvent="getUpdatedRecords">
                                            <EventMask ShowMask="true" />
                                            <ExtraParams> 
                                                <ext:Parameter Name="registrosactualizados" Value="getUpdatedRecords()" Mode="Raw" />
                                            </ExtraParams>
                                        </Click>
                                    </DirectEvents>                                          
                                </ext:ImageButton>

                        <ext:ToolbarSpacer 
                        runat="server" 
                        ID="ToolbarSpacer1" 
                        Width="5"> 
                        </ext:ToolbarSpacer>

                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="BUSCAR POR ASUNTO"
                            StyleSpec="margin-top: 0px;"
                            Width="290">
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
                    ID="sMesaDeReporte"
                    runat="server"
                   OnReadData="OnReadData_sMesaDeReporte">
                    <Model>
                        <ext:Model ID="mMesaDeReporte" runat="server">
                            <Fields>
                                <ext:ModelField Name="Id" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                <ext:ModelField Name="Reporte" Type="String" />
                                 <ext:ModelField Name="RSucursal" Type="Object" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="FechaOrigen" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="ImporteTotal" Type="Float" />
                                <ext:ModelField Name="Usuario" Type="String" />
                                <ext:ModelField Name="TrabajoRequerido" Type="String" />
                                <ext:ModelField Name="TrabajoRealizado" Type="String" /> 
                                <ext:ModelField Name="Facturado" Type="Boolean" />
                                <ext:ModelField Name="Clasificacion" Type="String" />
                                <ext:ModelField Name="Revisado" Type="Boolean" />
                            </Fields>
                        </ext:Model>
                    </Model>
                      <Sorters>
                        <ext:DataSorter Property="Reporte" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sMesaDeReportes_DataChanged" />
                        <Load Fn="sMesaDeReporte_Load" />
                    </Listeners>
                </ext:Store>
            </Store>

           <Plugins>
            <ext:CellEditing ID="CellEditing1" runat="server" ClicksToEdit="1" />
        </Plugins> 
            <ColumnModel>
                <Columns>
                
                   <ext:CheckColumn ID="ckFacturado"
                        runat="server"
                        Text="Facturado?" 
                        Align="Left"
                        DataIndex="Facturado"    
                        StopSelection="false"
                        Editable="true"                     
                        Width="60"> 
                    </ext:CheckColumn>

                     
                   <ext:CheckColumn ID="cRevisado"
                        runat="server"
                        Text="Revisado?" 
                        Align="Left"
                        DataIndex="Revisado"    
                        StopSelection="false"
                        Editable="true"                     
                        Width="60"> 
                    </ext:CheckColumn>

                   <ext:Column 
                        ID="cMovimiento"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="150"
                        DataIndex="Mov">
                         <HeaderItems>
                            <ext:TextField
                                ID="txtMovID"
                                runat="server"
                                EmptyText="Fitrar por MovID"
                                Editable="false">
                              <Listeners>
                                    <Change Fn="txtMovID_Change" />
                                </Listeners>
                            </ext:TextField>
                        </HeaderItems>
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    
                   <ext:Column 
                        ID="cReporte"
                        runat="server"
                        Text="REPORTE"
                        Align="Center"
                        Width="80"
                        DataIndex="Reporte">
                         <HeaderItems>
                            <ext:TextField
                                ID="txtFiltroReporte"
                                runat="server">
                              <Listeners>
                                    <Change Fn="txtReporteFiltro_Change" />
                                </Listeners>
                            </ext:TextField>
                        </HeaderItems>
                    </ext:Column>
                    
                   <ext:DateColumn
                        ID="dcFechaEmision"
                        runat="server"
                        Text="FECHA ORIGEN"
                        Align="Center"
                        Width="100"
                        DataIndex="FechaOrigen"
                        Format="dd/MM/yyyy">
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

                   <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Center"
                        Width="170"
                        DataIndex="Sucursal">
                      <Renderer Fn="cSucursal_Renderer" />
                    </ext:Column>
                    
                   <ext:Column
                        ID="cTrabajoRequerido"
                        runat="server"
                        Text="TRABAJO REQUERIDO"
                        Align="Center"
                        Width="170"
                        DataIndex="TrabajoRequerido">
                    </ext:Column> 

                   <ext:Column
                        ID="cTrabajoRealizado"
                        runat="server"
                        Text="TRABAJO REALIZADO"
                        Align="Center"
                        Width="170"

                        DataIndex="Observaciones">
                    </ext:Column> 



                   <ext:Column
                        ID="cAsunto"
                        runat="server"
                        Text="ASUNTO"
                        Align="Center"
                        Width="300"
                        DataIndex="Observaciones">
                    </ext:Column>
                    
                   <ext:Column
                        ID="cTotal"
                        runat="server"
                        Text="Importe"
                        Align="Center"
                        Width="95"
                        DataIndex="ImporteTotal">
                        <Renderer Fn="cImporte_renderer"></Renderer>
                    </ext:Column>

                   <ext:Column
                        ID="cUsuario"
                        runat="server"
                        Text="USUARIO"
                        Align="Center"
                        Width="150"
                        DataIndex="Usuario">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbUsuario"
                                runat="server"
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
                        
                        </HeaderItems>
                    
                    </ext:Column>

                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemDblClick Fn="gpExploradorConceptos_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvExploradorMesaDeReporte"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
             
            <FooterBar>
                <ext:StatusBar ID="sbMesaDeReporte" runat="server" Text="">
                    <Items>
                        <ext:ToolbarTextItem ID="ToolBarTotal" runat="server"  Text="TOTAL: " />  
                    </Items>
                </ext:StatusBar> 
            </FooterBar> 
        </ext:GridPanel>
    </form>
</body>
</html>
