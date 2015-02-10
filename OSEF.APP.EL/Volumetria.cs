using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Volumetria
    /// </summary>
    public class Volumetria
    {
        #region campos
        int id;
        string mov;
        string movid;
        string sucursal;
        DateTime fechaemision;
        string observaciones;
        string estatus;
        Sucursal rsucursal;

        #endregion

        #region propiedades


        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Mov
        {
            get { return mov; }
            set { mov = value; }
        }

        public string MovID
        {
            get { return movid; }
            set { movid = value; }
        }

        public string Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }

        public DateTime FechaEmision
        {
            get { return fechaemision; }
            set { fechaemision = value; }
        }

        public string Observaciones
        {
            get { return observaciones; }
            set { observaciones = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }



        #endregion




    }
}
