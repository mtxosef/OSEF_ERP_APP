using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de OrdenEstimacion
    /// </summary>
    public class OrdenEstimacion
    {
        #region Campos

        int id;
        string mov;
        string movid;
        string sucursal;
        Nullable<DateTime> fechaemision;
        string observaciones;
        string estatus;
        string origen;
        string origenid;
        string usuario;
        Sucursal rsucursal;

        #endregion

        #region Propiedades

        public int Id
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

        public Nullable<DateTime> FechaEmision
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

        public string Origen
        {
            get { return origen; }
            set { origen = value; }
        }

        public string OrigenId
        {
            get { return origenid; }
            set { origenid = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }
        #endregion
    }
}
