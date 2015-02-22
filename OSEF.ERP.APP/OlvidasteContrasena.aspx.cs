using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaOlvidoContrasena : System.Web.UI.Page
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento del TextField que detecta teclas especiales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtfEnviarCorreo_SpecialKey(object sender, DirectEventArgs e)
        {
            Usuario oUsuario = UsuarioBusiness.ObtenerUsuarioPorIDCorreo("osef@hotmail.com");
        }
    }
}