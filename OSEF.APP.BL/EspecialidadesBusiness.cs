using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;
namespace OSEF.APP.BL
{
    public class EspecialidadesBusiness
    {
        public static List<Especialidades> ObtenerEspecialidades()
        {
            return EspecialidadesDataAccess.ObtenerEspecialidades();
        }

        public static Especialidades ObtenerEspecialidadesPorID(string ID)
        {
            return EspecialidadesDataAccess.ObtenerEspecialidadesPorID(ID);
        }
    }
}
