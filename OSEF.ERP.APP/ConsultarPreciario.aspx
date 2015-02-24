<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultarPreciario.aspx.cs" Inherits="OSEF.ERP.APP.ConsultarPreciario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/consultarPreciario.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmConsultarPreciario" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sConsultarPreciario"
            runat="server">
            <Model>
                <ext:Model
                    ID="mConsultarPreciario"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="Sucursal" Type="String" />
                        <ext:ModelField Name="Archivo" Type="String" />
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="RSucursal" Type="Object" />
                    </Fields>
                    <Associations>
                        <ext:HasManyAssociation Model="RPreciarioCategorias" Name="PreciarioCategorias" AssociationKey="RPreciarioCategorias"/>
                    </Associations>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Model ID="mPreciarioCategorias" runat="server" Name="RPreciarioCategorias" IDProperty="ID">
            <Fields>
                <ext:ModelField Name="ID" Type="String" />
                <ext:ModelField Name="Clave" Type="String" />
                <ext:ModelField Name="Preciario" Type="String" />
                <ext:ModelField Name="Descripcion" Type="String" />
                <ext:ModelField Name="Usuario" Type="String" />
                <ext:ModelField Name="Estatus" Type="String" />
                <ext:ModelField Name="FechaAlta" Type="Date" />
            </Fields>
        </ext:Model>

        <ext:TabPanel
            ID="tpConsultarPreciario"
            runat="server"
            Height="300"
            Width="600">
            <Listeners>
                <BeforeRender Fn="tpConsultarPreciario_BeforeRender" />
            </Listeners>
        </ext:TabPanel>

    </form>
</body>
</html>
