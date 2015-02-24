<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="texfieldkey.aspx.cs" Inherits="OSEF.ERP.APP.texfieldkey" %>

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


         <ext:TextField 
                    ID="txtTest"
                    runat="server"
                    AutoFocus="true"
                    EnableKeyEvents="true">
                    <DirectEvents>
                        <SpecialKey
                            Before="return e.getKey() == Ext.EventObject.ENTER"
                            OnEvent="txtfEnviarCorreo_SpecialKey"
                            Delay="1">
                        </SpecialKey>
                    </DirectEvents>
                </ext:TextField>
        <ext:Label ID="lblTest" runat="server" Text="Here">
        </ext:Label>
    </div>
    </form>
</body>
</html>
