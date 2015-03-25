using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class OrdenesCambio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
            sUsuarios.DataBind();

            sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
             sSucursales.DataBind();
        }
    }
}