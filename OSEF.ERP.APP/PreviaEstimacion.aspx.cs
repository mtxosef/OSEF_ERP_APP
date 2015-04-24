using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;

namespace OSEF.ERP.APP
{
    public partial class PreviaEstimacion : System.Web.UI.Page
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

            if (Session["eCroquis"].ToString() != "1")
            {
                imgbtnCroquis.Enabled = false;
            }

            if (Session["eEstimacion"].ToString() != "1")
            {
                imgbtnEstimacion.Enabled = false;
            }

            if (Session["eResumen"].ToString() != "1")
            {
                imgbtnResumen.Enabled = false;
            }
        }


        protected void imgbtnResumen_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte
            Session["ReportNameOE"] = Session["nResumen"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rResumen"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
        }

        protected void imgbtnEstimacion_click(object sender, EventArgs e)
        {
            //Nos traemos la variable de sesion que contiene al reporte
            Session["ReportNameOE"] = Session["nEstimacion"].ToString();
            ReportDocument reporte = (ReportDocument)Session["rEstimacion"];
            crvVisor.ToolPanelView = ToolPanelViewType.None;
            crvVisor.ReportSource = reporte;
            Session["rSeleccion"] = reporte;
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
            crvVisor.DisplayToolbar = false;
            crvVisor.EnableParameterPrompt = false;
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