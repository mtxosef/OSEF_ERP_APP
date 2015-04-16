using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using Ext.Net;
using System.Configuration;
using System.Data.SqlClient;

namespace OSEF.ERP.APP
{
    public partial class PreviaOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["eGenerador"].ToString() != "1")
            {
                imgbtnGenerador.Enabled = false;
            }
            if (Session["eFotos"].ToString() != "1")
            {
                imgbtnFotos.Enabled = false;
            }
            if (Session["eFactura"].ToString() != "1")
            {
                imgbtnFacturas.Enabled = false;
            }
            if (Session["eCroquis"].ToString() != "1")
            {
                imgbtnCroquis.Enabled = false;
            }
            //ReportDocument reporte = (ReportDocument)Session["rGenerador"];
            //crvVisor.ToolPanelView = ToolPanelViewType.None;
            //crvVisor.ReportSource = reporte;
            

        }
    

        protected void imgbtnGenerador_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte
            Session["ReportNameOE"] = Session["nGenerador"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rGenerador"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
        }

        protected void imgbtnCroquis_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte
            Session["ReportNameOE"] = Session["nCroquis"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rCroquis"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
        }

        protected void imgbtnFotos_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte
            Session["ReportNameOE"] = Session["nFotos"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rFotos"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
        }

        protected void imgbtnFactura_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte

            Session["ReportNameOE"] = Session["nFactura"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rFactura"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
        }


        //Metodo que exporta a un documento de PDF
        protected void toPDF(object sender, EventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["rSeleccion"];
            string namereport = Session["ReportNameOE"].ToString();
            reporte.Load(Server.MapPath("reports/" + namereport + ".rpt"));
            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, namereport);

        }
        //Metodo que exporta a un documento de excel
        protected void toXls(object sender, EventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["rSeleccion"];
            string namereport = Session["ReportNameOE"].ToString();
            reporte.Load(Server.MapPath("reports/" + namereport + ".rpt"));
            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, namereport);

        }
    }
}