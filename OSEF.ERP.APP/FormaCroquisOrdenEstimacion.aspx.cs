using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaCroquisOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
                string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
                List<CroquisOrdenEstimacionD> lCroquisOrdenEstimacionD = CroquisOrdenEstimacionBusiness.ObtenerCroquisOrdenEstimacionDPorMovPreciarioConcepto(iID, strConcepto);

                foreach (CroquisOrdenEstimacionD sd in lCroquisOrdenEstimacionD)
                {
                    sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
                }

                sImagenesOrdenEstimacionD.DataSource = lCroquisOrdenEstimacionD;
                sImagenesOrdenEstimacionD.DataBind();
            }
        }
    }
}