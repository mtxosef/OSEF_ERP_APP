using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Ahorros
    /// </summary>
    public class Ahorro
    {
        #region Campos

        int id;
        string mov;
        string movid;
        DateTime fechaemision;
        string cliente;
        decimal importe;
        decimal saldo;
        string usuario;
        string estatus;

        List<AhorroD> rahorrod;

        #endregion

        #region Propiedades

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

        public string MovId
        {
            get { return movid; }
            set { movid = value; }
        }

        public DateTime FechaEmision
        {
            get { return fechaemision; }
            set { fechaemision = value; }
        }

        public string Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }

        public decimal Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        public decimal Saldo
        {
            get { return saldo; }
            set { saldo = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public List<AhorroD> RAhorroD
        {
            get { return rahorrod; }
            set { rahorrod = value; }
        }

        #endregion
    }
}
