using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class FamiliasBusiness
    {
        public static List<Familias> ObtenerFamilias()
        {
            return FamiliasDataAccess.ObtenerFamilias();
        }
        public static Familias ObtenerFamiliasPorID(string ID)
        {
            return FamiliasDataAccess.ObtenerFamiliasPorID(ID);
        }
    }
}
