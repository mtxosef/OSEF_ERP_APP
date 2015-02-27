using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class PruebaReporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void generar(object sender, EventArgs e)
        {
            try
            {
                var reporte = new ReportDocument();
                reporte.Load(Server.MapPath("uno.rpt"));
               
                Session["imprimir"] = reporte;
                Server.Transfer("VistaPreliminar.aspx", true);

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }


        }

    }
}