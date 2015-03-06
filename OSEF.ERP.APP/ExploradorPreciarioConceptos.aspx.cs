using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class ExploradorVolumetrias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sPreciarios.DataSource = PreciarioBusiness.ObtenerPreciarios();
            sPreciarios.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al escoger un elemento de Preciarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbPreciarios_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strPreciarios = e.ExtraParams["valor"];
            //sPreciarioConcepto.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoPorPreciario(strPreciarios);
            //sPreciarioConcepto.DataBind();

            sCategoria.DataSource = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(strPreciarios);
            sCategoria.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al escoger una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbCategoria_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el estado seleccionado y obtener los Municipios
            string strCategoria = e.ExtraParams["categoria"];
            sSubCategoria.DataSource = PreciarioSubCategoriaBusiness.ObtenerPreciarioSubCategoriaPorCategoria(strCategoria);
            sSubCategoria.DataBind();
        }


        /// <summary>
        /// Evento que se lanza al seleccionar una subcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strSubCategoria = e.ExtraParams["subcategoria"];
            sSubSubCategorias.DataSource = PreciarioSubSubCategoriaBusiness.ObtenerPreciarioSubSubCategoriaPorSubCategoria(strSubCategoria);
            sSubSubCategorias.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al seleccionar una subbsubcategoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbSubSubCategoria_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado 
            string strPreciario = e.ExtraParams["preciario"].Equals("null") ? string.Empty : e.ExtraParams["preciario"];
            string strCategoria = e.ExtraParams["categoria"].Equals("null") ? string.Empty : e.ExtraParams["categoria"];
            string strSubCategoria = e.ExtraParams["subcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subcategoria"];
            string strSubSubCategoria = e.ExtraParams["subsubcategoria"].Equals("null") ? string.Empty : e.ExtraParams["subsubcategoria"];   

            sPreciarioConcepto.DataSource = PreciarioConceptoBusiness.ObtenerPreciarioConceptoFiltro(strPreciario, strCategoria, strSubCategoria, strSubSubCategoria);
            sPreciarioConcepto.DataBind();
        }
    }
}