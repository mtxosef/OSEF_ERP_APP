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
    public partial class FormaImagenesOrdenEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                int iID = Convert.ToInt32(Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
                string strConcepto = Cookies.GetCookie("cookieConceptoOrdenEstimacion").Value;
                List<ImagenOrdenEstimacionD> lImagenOrdenEstimacionD = ImagenOrdenEstimacionBusiness.ObtenerImagenOrdenEstimacionDPorMovPreciarioConcepto(iID, strConcepto);

                foreach (ImagenOrdenEstimacionD sd in lImagenOrdenEstimacionD)
                {
                    sd.Direccion = Request.Url.GetLeftPart(UriPartial.Authority) + Request.ApplicationPath + sd.Direccion;
                }

                sImagenesOrdenEstimacionD.DataSource = lImagenOrdenEstimacionD;
                sImagenesOrdenEstimacionD.DataBind();
            }
        }
    }
}