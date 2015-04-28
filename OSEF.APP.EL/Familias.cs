using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class Familias
    {
        #region Campos
        string id;
        string nombre;
        #endregion

        #region Propiedades
        public string ID
        {
            get { return id; }
            set { id = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        #endregion
    }
}
