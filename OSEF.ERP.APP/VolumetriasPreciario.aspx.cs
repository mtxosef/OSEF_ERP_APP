using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class VolumetriasPreciario : System.Web.UI.Page
    {

        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Si no hay AjaxRequest
            if (!X.IsAjaxRequest)
            {
<<<<<<< HEAD
                //2. Checar ticket de autenticación
                UsuarioBusiness.checkValidSession(this);

                //3. Llenar Store de Revisiones, Preciarios y Usuarios
                sVolumetrias.DataSource = VolumetriaBusiness.ObtenerRevisiones();
=======
                sVolumetrias.DataSource = VolumetriaBusiness.ObtenerVolumetrias();
>>>>>>> 632b999aa3581ea8d17a6dbf79563564911e6339
                sVolumetrias.DataBind();

                sPreciarios.DataSource = PreciarioBusiness.ObtenerPreciarios();
                sPreciarios.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

                rmVolumetrias.RegisterIcon(Icon.Delete);

            }

        }
    }
}