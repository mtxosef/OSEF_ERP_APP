using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class SubEspecialidadesBusiness
    {
        public static List<SubEspecialidades> ObtenerSubEspecialidades()
        {
            return SubEspecialidadesDataAccess.ObtenerSubEspecialidades();
        }
        public static SubEspecialidades ObtenerSubEspecialidadesPorID(string ID)
        {
            return SubEspecialidadesDataAccess.ObtenerSubEspecialidadesPorID(ID);
        }
    }
}
