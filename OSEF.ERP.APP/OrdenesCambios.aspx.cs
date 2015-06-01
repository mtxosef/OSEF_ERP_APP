using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class OrdenesCambios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Si no hay AjaxRequest
            if (!X.IsAjaxRequest)
            {
                //2. Checar ticket de autenticación
                //UsuarioBusiness.checkValidSession(this);
                //3. Llenar Store de OrdenesEstimaciones, Preciarios y Usuarios
                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnOrdenesDeCambio();
                sSucursales.DataBind();


                sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesCambios();
                sOrdenesEstimaciones.DataBind();

              

                rmOrdenesEstimaciones.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sOrdenesEstimaciones(object sender, StoreReadDataEventArgs e)
        {
            sOrdenesEstimaciones.DataSource = OrdenEstimacionBusiness.ObtenerOrdenesCambios();
            sOrdenesEstimaciones.DataBind();
        }
    }
}