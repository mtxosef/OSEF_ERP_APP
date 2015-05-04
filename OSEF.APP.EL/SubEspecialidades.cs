using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class SubEspecialidades
    {
        #region Campos
        string id;
        string nombre;
        string familia;
        Familias rfamilia;
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

        public string Familia
        {
            get { return familia; }
            set { familia = value; }
        }

        public Familias RFamilia
        {
            get { return rfamilia; }
            set { rfamilia = value; }
        }
        #endregion
    }
}
