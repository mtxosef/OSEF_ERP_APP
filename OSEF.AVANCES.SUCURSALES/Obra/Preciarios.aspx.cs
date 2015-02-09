using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES.Obra
{
    public partial class Preciarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciarios();
                sPreciarios.DataSource = lPreciarios;
                sPreciarios.DataBind();

                rmPreciarios.RegisterIcon(Icon.Delete);
            }
        }

        protected void OnReadData_sPreciarios(object sender, StoreReadDataEventArgs e)
        {
            List<Preciario> lPreciarios = PreciarioBusiness.ObtenerPreciarios();
            sPreciarios.DataSource = lPreciarios;
            sPreciarios.DataBind();
        }


        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarPreciario(string strID)
        {
            
            PreciarioConceptoBusiness.Borrar(strID);
            PreciarioSubSubCategoriaBusiness.Borrar(strID);
            PreciarioSubCategoriaBusiness.Borrar(strID);
            PreciarioCategoriaBuisness.Borrar(strID);
            PreciarioBusiness.Borrar(strID);
            
        }
    }
}