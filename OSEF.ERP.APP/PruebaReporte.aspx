<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PruebaReporte.aspx.cs" Inherits="OSEF.ERP.APP.PruebaReporte" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager ID="ResourceManager1" runat="server">
        </ext:ResourceManager>


      <%--  <ext:Button ID="Button2" runat="server" Text="Submit">
        <DirectEvents>
        <Click OnEvent="generar"></Click>
        </DirectEvents>
        </ext:Button>--%>

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="generar" />
    
                      <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"  />--%>
         
        
    </div>
    </form>
</body>
</html>
