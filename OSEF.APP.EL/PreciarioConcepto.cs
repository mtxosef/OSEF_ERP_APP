using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de PreciarioConceptos
    /// </summary>
    public class PreciarioConcepto
    {
        #region Campos

        string id;
        string preciario;
        string descripcion;
        string categoria;
        string subcategoria;
        string subsubcategoria;
        string unidad;
        float costo;
        float importe;
        string estatus;
        DateTime fechaalta;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Preciario
        {
            get { return preciario; }
            set { preciario = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }

        public string SubCategoria
        {
            get { return subcategoria; }
            set { subcategoria = value; }
        }

        public string SubSubCategoria
        {
            get { return subsubcategoria; }
            set { subsubcategoria = value; }
        }

        public string Unidad
        {
            get { return unidad; }
            set { unidad = value; }
        }

        public float Costo
        {
            get { return costo; }
            set { costo = value; }
        }

        public float Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        #endregion
    }
}
