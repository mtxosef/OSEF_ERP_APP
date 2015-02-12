using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES.Obra
{
    public partial class VolumetriasPreciario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /// <summary>
            /// Evento que se lanza al cargar la página
            /// </summary>
            /// <param name="sender"></param>
            /// <param name="e"></param>
            /// if (!X.IsAjaxRequest)
            {
                sVolumetrias.DataSource = VolumetriaBusiness.ObtenerRevisiones();
                sVolumetrias.DataBind();
                rmVolumetrias.RegisterIcon(Icon.Delete);
            }

        }
    }
}