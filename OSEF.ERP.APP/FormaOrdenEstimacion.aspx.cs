using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaOrdenesEstimaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sSucursal.DataSource = SucursalBusiness.ObtenerSucursales();
            sSucursal.DataBind();
        }
    }
}