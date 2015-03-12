using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using System.Configuration;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Socios : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sClientes.DataSource = ClienteBusiness.ObtenerClientes();
                sClientes.DataBind();
                rmClientes.RegisterIcon(Icon.Delete);
                Cookies.Set("osefTheme", ConfigurationManager.AppSettings["osefTheme"].ToString(), DateTime.Now.AddDays(30), "/", null, false);
           
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sClientes(object sender, StoreReadDataEventArgs e)
        {
            sClientes.DataSource = ClienteBusiness.ObtenerClientes();
            sClientes.DataBind();
        }
    }
}