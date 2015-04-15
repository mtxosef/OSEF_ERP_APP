using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de Solicitudes De Prestamos
    /// </summary>
    public class SolicitudPrestamoDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Solicitudes de Prestamo
        /// </summary>
        /// <param name="iSolicitudPrestamo"></param>
        public static string Insertar(SolicitudPrestamo iSolicitudPrestamo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarSolicitudPrestamo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpCliente = new SqlParameter();
                sqlpCliente.ParameterName = "@Cliente";
                sqlpCliente.SqlDbType = SqlDbType.Char;
                sqlpCliente.Size = 8;
                sqlpCliente.Value = iSolicitudPrestamo.Cliente;

                SqlParameter sqlpNacionalidad = new SqlParameter();
                sqlpNacionalidad.ParameterName = "@Nacionalidad";
                sqlpNacionalidad.SqlDbType = SqlDbType.VarChar;
                sqlpNacionalidad.Value = iSolicitudPrestamo.Nacionalidad;

                SqlParameter sqlpNumeroDependientes = new SqlParameter();
                sqlpNumeroDependientes.ParameterName = "@NumeroDependientes";
                sqlpNumeroDependientes.SqlDbType = SqlDbType.TinyInt;
                sqlpNumeroDependientes.Value = iSolicitudPrestamo.NumeroDependientes;

                SqlParameter sqlpEdades = new SqlParameter();
                sqlpEdades.ParameterName = "@Edades";
                sqlpEdades.SqlDbType = SqlDbType.VarChar;
                sqlpEdades.Value = iSolicitudPrestamo.Edades;

                SqlParameter sqlpRegistroMatrimonial = new SqlParameter();
                sqlpRegistroMatrimonial.ParameterName = "@RegistroMatrimonial";
                sqlpRegistroMatrimonial.SqlDbType = SqlDbType.VarChar;
                sqlpRegistroMatrimonial.Value = iSolicitudPrestamo.RegistroMatrimonial;

                SqlParameter sqlpTipoCasa = new SqlParameter();
                sqlpTipoCasa.ParameterName = "@TipoCasa";
                sqlpTipoCasa.SqlDbType = SqlDbType.VarChar;
                sqlpTipoCasa.Value = iSolicitudPrestamo.TipoCasa;

                SqlParameter sqlpAniosDomicilio = new SqlParameter();
                sqlpAniosDomicilio.ParameterName = "@AniosDomicilio";
                sqlpAniosDomicilio.SqlDbType = SqlDbType.TinyInt;
                sqlpAniosDomicilio.Value = iSolicitudPrestamo.AniosDomicilio;

                SqlParameter sqlpCalleAnterior = new SqlParameter();
                sqlpCalleAnterior.ParameterName = "@CalleAnterior";
                sqlpCalleAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpCalleAnterior.Value = iSolicitudPrestamo.CalleAnterior;

                SqlParameter sqlpNoExteriorAnterior = new SqlParameter();
                sqlpNoExteriorAnterior.ParameterName = "@NoExteriorAnterior";
                sqlpNoExteriorAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExteriorAnterior.Value = iSolicitudPrestamo.NoExteriorAnterior;

                SqlParameter sqlpNoInteriorAnterior = new SqlParameter();
                sqlpNoInteriorAnterior.ParameterName = "@NoInteriorAnterior";
                sqlpNoInteriorAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInteriorAnterior.Value = iSolicitudPrestamo.NoInteriorAnterior;

                SqlParameter sqlpEntreCallesAnterior = new SqlParameter();
                sqlpEntreCallesAnterior.ParameterName = "@EntreCallesAnterior";
                sqlpEntreCallesAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCallesAnterior.Value = iSolicitudPrestamo.EntreCallesAnterior;

                SqlParameter sqlpEstadoAnterior = new SqlParameter();
                sqlpEstadoAnterior.ParameterName = "@EstadoAnterior";
                sqlpEstadoAnterior.SqlDbType = SqlDbType.Char;
                sqlpEstadoAnterior.Size = 2;
                sqlpEstadoAnterior.Value = iSolicitudPrestamo.EstadoAnterior;

                SqlParameter sqlpMunicipioAnterior = new SqlParameter();
                sqlpMunicipioAnterior.ParameterName = "@MunicipioAnterior";
                sqlpMunicipioAnterior.SqlDbType = SqlDbType.Char;
                sqlpMunicipioAnterior.Size = 4;
                sqlpMunicipioAnterior.Value = iSolicitudPrestamo.MunicipioAnterior;

                SqlParameter sqlpColoniaAnterior = new SqlParameter();
                sqlpColoniaAnterior.ParameterName = "@ColoniaAnterior";
                sqlpColoniaAnterior.SqlDbType = SqlDbType.Char;
                sqlpColoniaAnterior.Size = 10;
                sqlpColoniaAnterior.Value = iSolicitudPrestamo.ColoniaAnterior;

                SqlParameter sqlpCodigoPostalAnterior = new SqlParameter();
                sqlpCodigoPostalAnterior.ParameterName = "@CodigoPostalAnterior";
                sqlpCodigoPostalAnterior.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostalAnterior.Value = iSolicitudPrestamo.CodigoPostalAnterior;

                SqlParameter sqlpAntiguedad = new SqlParameter();
                sqlpAntiguedad.ParameterName = "@Antiguedad";
                sqlpAntiguedad.SqlDbType = SqlDbType.TinyInt;
                sqlpAntiguedad.Value = iSolicitudPrestamo.Antiguedad;

                SqlParameter sqlpIngresos = new SqlParameter();
                sqlpIngresos.ParameterName = "@Ingresos";
                sqlpIngresos.SqlDbType = SqlDbType.SmallInt;
                sqlpIngresos.Value = iSolicitudPrestamo.Ingresos;

                SqlParameter sqlpOtrosIngresos = new SqlParameter();
                sqlpOtrosIngresos.ParameterName = "@OtrosIngresos";
                sqlpOtrosIngresos.SqlDbType = SqlDbType.SmallInt;
                sqlpOtrosIngresos.Value = iSolicitudPrestamo.OtrosIngresos;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.VarChar;
                sqlpConcepto.Value = iSolicitudPrestamo.Concepto;

                SqlParameter sqlpJefeNombre = new SqlParameter();
                sqlpJefeNombre.ParameterName = "@JefeNombre";
                sqlpJefeNombre.SqlDbType = SqlDbType.VarChar;
                sqlpJefeNombre.Value = iSolicitudPrestamo.JefeNombre;

                SqlParameter sqlpJefeAPAterno = new SqlParameter();
                sqlpJefeAPAterno.ParameterName = "@JefeAPAterno";
                sqlpJefeAPAterno.SqlDbType = SqlDbType.VarChar;
                sqlpJefeAPAterno.Value = iSolicitudPrestamo.JefeAPaterno;

                SqlParameter sqlpJefeAMaterno = new SqlParameter();
                sqlpJefeAMaterno.ParameterName = "@JefeAMaterno";
                sqlpJefeAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpJefeAMaterno.Value = iSolicitudPrestamo.JefeAMaterno;

                SqlParameter sqlpEmpresaAnterior = new SqlParameter();
                sqlpEmpresaAnterior.ParameterName = "@EmpresaAnterior";
                sqlpEmpresaAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaAnterior.Value = iSolicitudPrestamo.EmpresaAnterior;

                SqlParameter sqlpConyugeNombre = new SqlParameter();
                sqlpConyugeNombre.ParameterName = "@ConyugeNombre";
                sqlpConyugeNombre.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeNombre.Value = iSolicitudPrestamo.ConyugeNombre;

                SqlParameter sqlpConyugeAPaterno = new SqlParameter();
                sqlpConyugeAPaterno.ParameterName = "@ConyugeAPaterno";
                sqlpConyugeAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeAPaterno.Value = iSolicitudPrestamo.ConyugeAPaterno;

                SqlParameter sqlpConyugeAMaterno = new SqlParameter();
                sqlpConyugeAMaterno.ParameterName = "@ConyugeAMaterno";
                sqlpConyugeAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeAMaterno.Value = iSolicitudPrestamo.ConyugeAMaterno;

                SqlParameter sqlpConyugeFechaNacimiento = new SqlParameter();
                sqlpConyugeFechaNacimiento.ParameterName = "@ConyugeFechaNacimiento";
                sqlpConyugeFechaNacimiento.SqlDbType = SqlDbType.Date;
                sqlpConyugeFechaNacimiento.Value = iSolicitudPrestamo.ConyugeFechaNacimiento;

                SqlParameter sqlpConyugeRFC = new SqlParameter();
                sqlpConyugeRFC.ParameterName = "@ConyugeRFC";
                sqlpConyugeRFC.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeRFC.Value = iSolicitudPrestamo.ConyugeRFC;

                SqlParameter sqlpConyugeTelefono = new SqlParameter();
                sqlpConyugeTelefono.ParameterName = "@ConyugeTelefono";
                sqlpConyugeTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeTelefono.Value = iSolicitudPrestamo.ConyugeTelefono;

                SqlParameter sqlpConyugeTelefonoMovil = new SqlParameter();
                sqlpConyugeTelefonoMovil.ParameterName = "@ConyugeTelefonoMovil";
                sqlpConyugeTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeTelefonoMovil.Value = iSolicitudPrestamo.ConyugeTelefonoMovil;

                SqlParameter sqlpConyugeCalle = new SqlParameter();
                sqlpConyugeCalle.ParameterName = "@ConyugeCalle";
                sqlpConyugeCalle.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeCalle.Value = iSolicitudPrestamo.ConyugeCalle;

                SqlParameter sqlpConyugeEntreCalles = new SqlParameter();
                sqlpConyugeEntreCalles.ParameterName = "@ConyugeEntreCalles";
                sqlpConyugeEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEntreCalles.Value = iSolicitudPrestamo.ConyugeEntreCalles;

                SqlParameter sqlpConyugeNoExterior = new SqlParameter();
                sqlpConyugeNoExterior.ParameterName = "@ConyugeNoExterior";
                sqlpConyugeNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeNoExterior.Value = iSolicitudPrestamo.ConyugeNoExterior;

                SqlParameter sqlpConyugeNoInterior = new SqlParameter();
                sqlpConyugeNoInterior.ParameterName = "@ConyugeNoInterior";
                sqlpConyugeNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeNoInterior.Value = iSolicitudPrestamo.ConyugeNoInterior;

                SqlParameter sqlpConyugeColonia = new SqlParameter();
                sqlpConyugeColonia.ParameterName = "@ConyugeColonia";
                sqlpConyugeColonia.SqlDbType = SqlDbType.Char;
                sqlpConyugeColonia.Size = 10;
                sqlpConyugeColonia.Value = iSolicitudPrestamo.ConyugeColonia;

                SqlParameter sqlpConyugeCodigoPostal = new SqlParameter();
                sqlpConyugeCodigoPostal.ParameterName = "@ConyugeCodigoPostal";
                sqlpConyugeCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpConyugeCodigoPostal.Value = iSolicitudPrestamo.ConyugeCodigoPostal;

                SqlParameter sqlpConyugeEstado = new SqlParameter();
                sqlpConyugeEstado.ParameterName = "@ConyugeEstado";
                sqlpConyugeEstado.SqlDbType = SqlDbType.Char;
                sqlpConyugeEstado.Size = 2;
                sqlpConyugeEstado.Value = iSolicitudPrestamo.ConyugeEstado;

                SqlParameter sqlpConyugeMunicipio = new SqlParameter();
                sqlpConyugeMunicipio.ParameterName = "@ConyugeMunicipio";
                sqlpConyugeMunicipio.SqlDbType = SqlDbType.Char;
                sqlpConyugeMunicipio.Size = 4;
                sqlpConyugeMunicipio.Value = iSolicitudPrestamo.ConyugeMunicipio;

                SqlParameter sqlpConyugeAntiguedad = new SqlParameter();
                sqlpConyugeAntiguedad.ParameterName = "@ConyugeAntiguedad";
                sqlpConyugeAntiguedad.SqlDbType = SqlDbType.TinyInt;
                sqlpConyugeAntiguedad.Value = iSolicitudPrestamo.ConyugeAntiguedad;

                SqlParameter sqlpConyugeIngresos = new SqlParameter();
                sqlpConyugeIngresos.ParameterName = "@ConyugeIngresos";
                sqlpConyugeIngresos.SqlDbType = SqlDbType.SmallInt;
                sqlpConyugeIngresos.Value = iSolicitudPrestamo.ConyugeIngresos;

                SqlParameter sqlpConyugeOtrosIngresos = new SqlParameter();
                sqlpConyugeOtrosIngresos.ParameterName = "@ConyugeOtrosIngresos";
                sqlpConyugeOtrosIngresos.SqlDbType = SqlDbType.SmallInt;
                sqlpConyugeOtrosIngresos.Value = iSolicitudPrestamo.ConyugeOtrosIngresos;

                SqlParameter sqlpConyugeConcepto = new SqlParameter();
                sqlpConyugeConcepto.ParameterName = "@ConyugeConcepto";
                sqlpConyugeConcepto.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeConcepto.Value = iSolicitudPrestamo.ConyugeConcepto;

                SqlParameter sqlpConyugeEmpresa = new SqlParameter();
                sqlpConyugeEmpresa.ParameterName = "@ConyugeEmpresa";
                sqlpConyugeEmpresa.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresa.Value = iSolicitudPrestamo.ConyugeEmpresa;

                SqlParameter sqlpConyugePuesto = new SqlParameter();
                sqlpConyugePuesto.ParameterName = "@ConyugePuesto";
                sqlpConyugePuesto.SqlDbType = SqlDbType.VarChar;
                sqlpConyugePuesto.Value = iSolicitudPrestamo.ConyugePuesto;

                SqlParameter sqlpConyugeEmpresaCalle = new SqlParameter();
                sqlpConyugeEmpresaCalle.ParameterName = "@ConyugeEmpresaCalle";
                sqlpConyugeEmpresaCalle.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaCalle.Value = iSolicitudPrestamo.ConyugeEmpresaCalle;

                SqlParameter sqlpConyugeEmpresaNoExterior = new SqlParameter();
                sqlpConyugeEmpresaNoExterior.ParameterName = "@ConyugeEmpresaNoExterior";
                sqlpConyugeEmpresaNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaNoExterior.Value = iSolicitudPrestamo.ConyugeEmpresaNoExterior;

                SqlParameter sqlpConyugeEmpresaNoInterior = new SqlParameter();
                sqlpConyugeEmpresaNoInterior.ParameterName = "@ConyugeEmpresaNoInterior";
                sqlpConyugeEmpresaNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaNoInterior.Value = iSolicitudPrestamo.ConyugeEmpresaNoInterior;

                SqlParameter sqlpConyugeEmpresaColonia = new SqlParameter();
                sqlpConyugeEmpresaColonia.ParameterName = "@ConyugeEmpresaColonia";
                sqlpConyugeEmpresaColonia.SqlDbType = SqlDbType.Char;
                sqlpConyugeEmpresaColonia.Size = 10;
                sqlpConyugeEmpresaColonia.Value = iSolicitudPrestamo.ConyugeEmpresaColonia;

                SqlParameter sqlpConyugeEmpresaCodigoPostal = new SqlParameter();
                sqlpConyugeEmpresaCodigoPostal.ParameterName = "@ConyugeEmpresaCodigoPostal";
                sqlpConyugeEmpresaCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpConyugeEmpresaCodigoPostal.Value = iSolicitudPrestamo.ConyugeEmpresaCodigoPostal;

                SqlParameter sqlpConyugeEmpresaEntreCalles = new SqlParameter();
                sqlpConyugeEmpresaEntreCalles.ParameterName = "@ConyugeEmpresaEntreCalles";
                sqlpConyugeEmpresaEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaEntreCalles.Value = iSolicitudPrestamo.ConyugeEmpresaEntreCalles;

                SqlParameter sqlpConyugeEmpresaEstado = new SqlParameter();
                sqlpConyugeEmpresaEstado.ParameterName = "@ConyugeEmpresaEstado";
                sqlpConyugeEmpresaEstado.SqlDbType = SqlDbType.Char;
                sqlpConyugeEmpresaEstado.Size = 2;
                sqlpConyugeEmpresaEstado.Value = iSolicitudPrestamo.ConyugeEmpresaEstado;

                SqlParameter sqlpConyugeEmpresaMunicipio = new SqlParameter();
                sqlpConyugeEmpresaMunicipio.ParameterName = "@ConyugeEmpresaMunicipio";
                sqlpConyugeEmpresaMunicipio.SqlDbType = SqlDbType.Char;
                sqlpConyugeEmpresaMunicipio.Size = 4;
                sqlpConyugeEmpresaMunicipio.Value = iSolicitudPrestamo.ConyugeEmpresaMunicipio;

                SqlParameter sqlpConyugeEmpresaJefeNombre = new SqlParameter();
                sqlpConyugeEmpresaJefeNombre.ParameterName = "@ConyugeEmpresaJefeNombre";
                sqlpConyugeEmpresaJefeNombre.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaJefeNombre.Value = iSolicitudPrestamo.ConyugeEmpresaJefeNombre;

                SqlParameter sqlpConyugeEmpresaJefeAPaterno = new SqlParameter();
                sqlpConyugeEmpresaJefeAPaterno.ParameterName = "@ConyugeEmpresaJefeAPAterno";
                sqlpConyugeEmpresaJefeAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaJefeAPaterno.Value = iSolicitudPrestamo.ConyugeEmpresaJefeAPaterno;

                SqlParameter sqlpConyugeEmpresaJefeAMaterno = new SqlParameter();
                sqlpConyugeEmpresaJefeAMaterno.ParameterName = "@ConyugeEmpresaJefeAMaterno";
                sqlpConyugeEmpresaJefeAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpConyugeEmpresaJefeAMaterno.Value = iSolicitudPrestamo.ConyugeEmpresaJefeAMaterno;

                SqlParameter sqlpAvalNombre = new SqlParameter();
                sqlpAvalNombre.ParameterName = "@AvalNombre";
                sqlpAvalNombre.SqlDbType = SqlDbType.VarChar;
                sqlpAvalNombre.Value = iSolicitudPrestamo.AvalNombre;

                SqlParameter sqlpAvalAPaterno = new SqlParameter();
                sqlpAvalAPaterno.ParameterName = "@AvalAPaterno";
                sqlpAvalAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAvalAPaterno.Value = iSolicitudPrestamo.AvalAPaterno;

                SqlParameter sqlpAvalAMaterno = new SqlParameter();
                sqlpAvalAMaterno.ParameterName = "@AvalAMaterno";
                sqlpAvalAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAvalAMaterno.Value = iSolicitudPrestamo.AvalAMaterno;

                SqlParameter sqlpAvalSocio = new SqlParameter();
                sqlpAvalSocio.ParameterName = "@AvalSocio";
                sqlpAvalSocio.SqlDbType = SqlDbType.Bit;
                sqlpAvalSocio.Value = iSolicitudPrestamo.AvalSocio;

                SqlParameter sqlpAvalEstadoCivil = new SqlParameter();
                sqlpAvalEstadoCivil.ParameterName = "@AvalEstadoCivil";
                sqlpAvalEstadoCivil.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEstadoCivil.Value = iSolicitudPrestamo.AvalEstadoCivil;

                SqlParameter sqlpAvalRegistroMatrimonial = new SqlParameter();
                sqlpAvalRegistroMatrimonial.ParameterName = "@AvalRegistroMatrimonial";
                sqlpAvalRegistroMatrimonial.SqlDbType = SqlDbType.VarChar;
                sqlpAvalRegistroMatrimonial.Value = iSolicitudPrestamo.AvalRegistroMatrimonial;

                SqlParameter sqlpAvalTelefono = new SqlParameter();
                sqlpAvalTelefono.ParameterName = "@AvalTelefono";
                sqlpAvalTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpAvalTelefono.Value = iSolicitudPrestamo.AvalTelefono;

                SqlParameter sqlpAvalTelefonoMovil = new SqlParameter();
                sqlpAvalTelefonoMovil.ParameterName = "@AvalTelefonoMovil";
                sqlpAvalTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpAvalTelefonoMovil.Value = iSolicitudPrestamo.AvalTelefonoMovil;

                SqlParameter sqlpAvalCalle = new SqlParameter();
                sqlpAvalCalle.ParameterName = "@AvalCalle";
                sqlpAvalCalle.SqlDbType = SqlDbType.VarChar;
                sqlpAvalCalle.Value = iSolicitudPrestamo.AvalCalle;

                SqlParameter sqlpAvalEntreCalles = new SqlParameter();
                sqlpAvalEntreCalles.ParameterName = "@AvalEntreCalles";
                sqlpAvalEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEntreCalles.Value = iSolicitudPrestamo.AvalEntreCalles;

                SqlParameter sqlpAvalNoExterior = new SqlParameter();
                sqlpAvalNoExterior.ParameterName = "@AvalNoExterior";
                sqlpAvalNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpAvalNoExterior.Value = iSolicitudPrestamo.AvalNoExterior;

                SqlParameter sqlpAvalNoInterior = new SqlParameter();
                sqlpAvalNoInterior.ParameterName = "@AvalNoInterior";
                sqlpAvalNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpAvalNoInterior.Value = iSolicitudPrestamo.AvalNoInterior;

                SqlParameter sqlpAvalColonia = new SqlParameter();
                sqlpAvalColonia.ParameterName = "@AvalColonia";
                sqlpAvalColonia.SqlDbType = SqlDbType.Char;
                sqlpAvalColonia.Size = 10;
                sqlpAvalColonia.Value = iSolicitudPrestamo.AvalColonia;

                SqlParameter sqlpAvalCodigoPostal = new SqlParameter();
                sqlpAvalCodigoPostal.ParameterName = "@AvalCodigoPostal";
                sqlpAvalCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpAvalCodigoPostal.Value = iSolicitudPrestamo.AvalCodigoPostal;

                SqlParameter sqlpAvalEstado = new SqlParameter();
                sqlpAvalEstado.ParameterName = "@AvalEstado";
                sqlpAvalEstado.SqlDbType = SqlDbType.Char;
                sqlpAvalEstado.Size = 2;
                sqlpAvalEstado.Value = iSolicitudPrestamo.AvalEstado;

                SqlParameter sqlpAvalMunicipio = new SqlParameter();
                sqlpAvalMunicipio.ParameterName = "@AvalMunicipio";
                sqlpAvalMunicipio.SqlDbType = SqlDbType.Char;
                sqlpAvalMunicipio.Size = 4;
                sqlpAvalMunicipio.Value = iSolicitudPrestamo.AvalMunicipio;

                SqlParameter sqlpAvalTipoCasa = new SqlParameter();
                sqlpAvalTipoCasa.ParameterName = "@AvalTipoCasa";
                sqlpAvalTipoCasa.SqlDbType = SqlDbType.VarChar;
                sqlpAvalTipoCasa.Value = iSolicitudPrestamo.AvalTipoCasa;

                SqlParameter sqlpAvalAntiguedad = new SqlParameter();
                sqlpAvalAntiguedad.ParameterName = "@AvalAntiguedad";
                sqlpAvalAntiguedad.SqlDbType = SqlDbType.TinyInt;
                sqlpAvalAntiguedad.Value = iSolicitudPrestamo.AvalAntiguedad;

                SqlParameter sqlpAvalEmpresa = new SqlParameter();
                sqlpAvalEmpresa.ParameterName = "@AvalEmpresa";
                sqlpAvalEmpresa.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresa.Value = iSolicitudPrestamo.AvalEmpresa;

                SqlParameter sqlpAvalEmpresaPuesto = new SqlParameter();
                sqlpAvalEmpresaPuesto.ParameterName = "@AvalEmpresaPuesto";
                sqlpAvalEmpresaPuesto.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaPuesto.Value = iSolicitudPrestamo.AvalEmpresaPuesto;

                SqlParameter sqlpAvalEmpresaJefeNombre = new SqlParameter();
                sqlpAvalEmpresaJefeNombre.ParameterName = "@AvalEmpresaJefeNombre";
                sqlpAvalEmpresaJefeNombre.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaJefeNombre.Value = iSolicitudPrestamo.AvalEmpresaJefeNombre;

                SqlParameter sqlpAvalEmpresaJefeAPaterno = new SqlParameter();
                sqlpAvalEmpresaJefeAPaterno.ParameterName = "@AvalEmpresaJefeAPaterno";
                sqlpAvalEmpresaJefeAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaJefeAPaterno.Value = iSolicitudPrestamo.AvalEmpresaJefeAPaterno;

                SqlParameter sqlpAvalEmpresaJefeAMaterno = new SqlParameter();
                sqlpAvalEmpresaJefeAMaterno.ParameterName = "@AvalEmpresaJefeAMaterno";
                sqlpAvalEmpresaJefeAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaJefeAMaterno.Value = iSolicitudPrestamo.AvalEmpresaJefeAMaterno;

                SqlParameter sqlpAvalEmpresaAntiguedad = new SqlParameter();
                sqlpAvalEmpresaAntiguedad.ParameterName = "@AvalEmpresaAntiguedad";
                sqlpAvalEmpresaAntiguedad.SqlDbType = SqlDbType.TinyInt;
                sqlpAvalEmpresaAntiguedad.Value = iSolicitudPrestamo.AvalEmpresaAntiguedad;

                SqlParameter sqlpAvalEmpresaIngresos = new SqlParameter();
                sqlpAvalEmpresaIngresos.ParameterName = "@AvalEmpresaIngresos";
                sqlpAvalEmpresaIngresos.SqlDbType = SqlDbType.Int;
                sqlpAvalEmpresaIngresos.Value = iSolicitudPrestamo.AvalEmpresaIngresos;

                SqlParameter sqlpAvalEmpresaOtrosIngresos = new SqlParameter();
                sqlpAvalEmpresaOtrosIngresos.ParameterName = "@AvalEmpresaOtrosIngresos";
                sqlpAvalEmpresaOtrosIngresos.SqlDbType = SqlDbType.Int;
                sqlpAvalEmpresaOtrosIngresos.Value = iSolicitudPrestamo.AvalEmpresaOtrosIngresos;

                SqlParameter sqlpAvalEmpresaConcepto = new SqlParameter();
                sqlpAvalEmpresaConcepto.ParameterName = "@AvalEmpresaConcepto";
                sqlpAvalEmpresaConcepto.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaConcepto.Value = iSolicitudPrestamo.AvalEmpresaConcepto;

                SqlParameter sqlpAvalEmpresaPropietario = new SqlParameter();
                sqlpAvalEmpresaPropietario.ParameterName = "@AvalEmpresaPropietario";
                sqlpAvalEmpresaPropietario.SqlDbType = SqlDbType.Bit;
                sqlpAvalEmpresaPropietario.Value = iSolicitudPrestamo.AvalEmpresaPropietario;

                SqlParameter sqlpAvalEmpresaTipo = new SqlParameter();
                sqlpAvalEmpresaTipo.ParameterName = "@AvalEmpresaTipo";
                sqlpAvalEmpresaTipo.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaTipo.Value = iSolicitudPrestamo.AvalEmpresaTipo;

                SqlParameter sqlpAvalEmpresaTelefono = new SqlParameter();
                sqlpAvalEmpresaTelefono.ParameterName = "@AvalEmpresaTelefono";
                sqlpAvalEmpresaTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaTelefono.Value = iSolicitudPrestamo.AvalEmpresaTelefono;

                SqlParameter sqlpAvalEmpresaTelefonoExt = new SqlParameter();
                sqlpAvalEmpresaTelefonoExt.ParameterName = "@AvalEmpresaTelefonoExt";
                sqlpAvalEmpresaTelefonoExt.SqlDbType = SqlDbType.SmallInt;
                sqlpAvalEmpresaTelefonoExt.Value = iSolicitudPrestamo.AvalEmpresaTelefonoExt;

                SqlParameter sqlpAvalEmpresaAnterior = new SqlParameter();
                sqlpAvalEmpresaAnterior.ParameterName = "@AvalEmpresaAnterior";
                sqlpAvalEmpresaAnterior.SqlDbType = SqlDbType.VarChar;
                sqlpAvalEmpresaAnterior.Value = iSolicitudPrestamo.AvalEmpresaAnterior;

                SqlParameter sqlpCantidad = new SqlParameter();
                sqlpCantidad.ParameterName = "@Cantidad";
                sqlpCantidad.SqlDbType = SqlDbType.Int;
                sqlpCantidad.Value = iSolicitudPrestamo.Cantidad;

                SqlParameter sqlpPlazo = new SqlParameter();
                sqlpPlazo.ParameterName = "@Plazo";
                sqlpPlazo.SqlDbType = SqlDbType.SmallInt;
                sqlpPlazo.Value = iSolicitudPrestamo.Plazo;

                SqlParameter sqlpFormaPago = new SqlParameter();
                sqlpFormaPago.ParameterName = "@FormaPago";
                sqlpFormaPago.SqlDbType = SqlDbType.VarChar;
                sqlpFormaPago.Value = iSolicitudPrestamo.FormaPago;

                SqlParameter sqlpDestinoPrestamo = new SqlParameter();
                sqlpDestinoPrestamo.ParameterName = "@DestinoPrestamo";
                sqlpDestinoPrestamo.SqlDbType = SqlDbType.VarChar;
                sqlpDestinoPrestamo.Value = iSolicitudPrestamo.DetinoPrestamo;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = iSolicitudPrestamo.Tipo;

                SqlParameter sqlpTablaAmortizacion = new SqlParameter();
                sqlpTablaAmortizacion.ParameterName = "@TablaAmortizacion";
                sqlpTablaAmortizacion.SqlDbType = SqlDbType.VarChar;
                sqlpTablaAmortizacion.Value = iSolicitudPrestamo.TablaAmortizacion;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iSolicitudPrestamo.Estatus;

                SqlParameter sqlpUsuarioAlta = new SqlParameter();
                sqlpUsuarioAlta.ParameterName = "@UsuarioAlta";
                sqlpUsuarioAlta.SqlDbType = SqlDbType.VarChar;
                sqlpUsuarioAlta.Value = iSolicitudPrestamo.UsuarioAlta;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iSolicitudPrestamo.FechaAlta;

                SqlParameter sqlpUsuarioModificacion = new SqlParameter();
                sqlpUsuarioModificacion.ParameterName = "@UsuarioModificacion";
                sqlpUsuarioModificacion.SqlDbType = SqlDbType.VarChar;
                sqlpUsuarioModificacion.Value = iSolicitudPrestamo.UsuarioModificacion;

                SqlParameter sqlpFechaModificacion = new SqlParameter();
                sqlpFechaModificacion.ParameterName = "@FechaModificacion";
                sqlpFechaModificacion.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaModificacion.Value = iSolicitudPrestamo.FechaModificacion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCliente);
                sqlcComando.Parameters.Add(sqlpNacionalidad);
                sqlcComando.Parameters.Add(sqlpNumeroDependientes);
                sqlcComando.Parameters.Add(sqlpEdades);
                sqlcComando.Parameters.Add(sqlpRegistroMatrimonial);
                sqlcComando.Parameters.Add(sqlpTipoCasa);
                sqlcComando.Parameters.Add(sqlpAniosDomicilio);
                sqlcComando.Parameters.Add(sqlpCalleAnterior);
                sqlcComando.Parameters.Add(sqlpEntreCallesAnterior);
                sqlcComando.Parameters.Add(sqlpNoExteriorAnterior);
                sqlcComando.Parameters.Add(sqlpNoInteriorAnterior);
                sqlcComando.Parameters.Add(sqlpEstadoAnterior);
                sqlcComando.Parameters.Add(sqlpMunicipioAnterior);
                sqlcComando.Parameters.Add(sqlpColoniaAnterior);
                sqlcComando.Parameters.Add(sqlpCodigoPostalAnterior);
                sqlcComando.Parameters.Add(sqlpAntiguedad);
                sqlcComando.Parameters.Add(sqlpIngresos);
                sqlcComando.Parameters.Add(sqlpOtrosIngresos);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpJefeNombre);
                sqlcComando.Parameters.Add(sqlpJefeAPAterno);
                sqlcComando.Parameters.Add(sqlpJefeAMaterno);
                sqlcComando.Parameters.Add(sqlpEmpresaAnterior);
                sqlcComando.Parameters.Add(sqlpConyugeNombre);
                sqlcComando.Parameters.Add(sqlpConyugeAPaterno);
                sqlcComando.Parameters.Add(sqlpConyugeAMaterno);
                sqlcComando.Parameters.Add(sqlpConyugeFechaNacimiento);
                sqlcComando.Parameters.Add(sqlpConyugeRFC);
                sqlcComando.Parameters.Add(sqlpConyugeTelefono);
                sqlcComando.Parameters.Add(sqlpConyugeTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpConyugeCalle);
                sqlcComando.Parameters.Add(sqlpConyugeEntreCalles);
                sqlcComando.Parameters.Add(sqlpConyugeNoExterior);
                sqlcComando.Parameters.Add(sqlpConyugeNoInterior);
                sqlcComando.Parameters.Add(sqlpConyugeColonia);
                sqlcComando.Parameters.Add(sqlpConyugeCodigoPostal);
                sqlcComando.Parameters.Add(sqlpConyugeEstado);
                sqlcComando.Parameters.Add(sqlpConyugeMunicipio);
                sqlcComando.Parameters.Add(sqlpConyugeAntiguedad);
                sqlcComando.Parameters.Add(sqlpConyugeIngresos);
                sqlcComando.Parameters.Add(sqlpConyugeOtrosIngresos);
                sqlcComando.Parameters.Add(sqlpConyugeConcepto);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresa);
                sqlcComando.Parameters.Add(sqlpConyugePuesto);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaCalle);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaNoExterior);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaNoInterior);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaColonia);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaCodigoPostal);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaEntreCalles);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaEstado);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaMunicipio);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaJefeNombre);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaJefeAPaterno);
                sqlcComando.Parameters.Add(sqlpConyugeEmpresaJefeAMaterno);
                sqlcComando.Parameters.Add(sqlpAvalNombre);
                sqlcComando.Parameters.Add(sqlpAvalAPaterno);
                sqlcComando.Parameters.Add(sqlpAvalAMaterno);
                sqlcComando.Parameters.Add(sqlpAvalSocio);
                sqlcComando.Parameters.Add(sqlpAvalEstadoCivil);
                sqlcComando.Parameters.Add(sqlpAvalRegistroMatrimonial);
                sqlcComando.Parameters.Add(sqlpAvalTelefono);
                sqlcComando.Parameters.Add(sqlpAvalTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpAvalCalle);
                sqlcComando.Parameters.Add(sqlpAvalEntreCalles);
                sqlcComando.Parameters.Add(sqlpAvalNoExterior);
                sqlcComando.Parameters.Add(sqlpAvalNoInterior);
                sqlcComando.Parameters.Add(sqlpAvalColonia);
                sqlcComando.Parameters.Add(sqlpAvalCodigoPostal);
                sqlcComando.Parameters.Add(sqlpAvalEstado);
                sqlcComando.Parameters.Add(sqlpAvalMunicipio);
                sqlcComando.Parameters.Add(sqlpAvalTipoCasa);
                sqlcComando.Parameters.Add(sqlpAvalAntiguedad);
                sqlcComando.Parameters.Add(sqlpAvalEmpresa);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaPuesto);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaJefeNombre);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaJefeAPaterno);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaJefeAMaterno);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaAntiguedad);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaIngresos);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaOtrosIngresos);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaConcepto);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaPropietario);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaTipo);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaTelefono);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaTelefonoExt);
                sqlcComando.Parameters.Add(sqlpAvalEmpresaAnterior);
                sqlcComando.Parameters.Add(sqlpCantidad);
                sqlcComando.Parameters.Add(sqlpPlazo);
                sqlcComando.Parameters.Add(sqlpFormaPago);
                sqlcComando.Parameters.Add(sqlpDestinoPrestamo);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpTablaAmortizacion);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuarioAlta);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpUsuarioModificacion);
                sqlcComando.Parameters.Add(sqlpFechaModificacion);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(SolicitudPrestamo " + iSolicitudPrestamo.ID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
