using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaCambiarPass : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento de click en botón guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener parametros
            string strContrasenaActual = string.Empty;
            string strContrasena = string.Empty;
            string strID = e.ExtraParams["usuario"];
            string strRegistro = e.ExtraParams["registro"];
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);

            //2. Obtener los datos
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del usuario
                    case "txtfContrasenaActual":
                        strContrasenaActual = sd.Value;
                        break;
                    case "txtfContrasena":
                        strContrasena = sd.Value;
                        break;
                }
            }

            //4. Validar si es la contraseña actual
            if (UsuarioBusiness.ObtenerContrasenaPorID(strID).Equals(strContrasenaActual))
            {
                //5. Cambiar la contraseña
                UsuarioBusiness.CambiarContrasena(strID, strContrasena);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "true", ParameterMode.Raw));
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("actual", "true", ParameterMode.Raw));
            }
            else
            {
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("actual", "false", ParameterMode.Raw));
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("correcto", "false", ParameterMode.Raw));
            }
        }
    }
}