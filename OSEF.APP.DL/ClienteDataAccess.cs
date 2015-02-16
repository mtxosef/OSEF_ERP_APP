﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de Clientes
    /// </summary>
    public class ClienteDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Clientes
        /// </summary>
        /// <param name="iCliente"></param>
        public static string Insertar(Cliente iCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iCliente.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = iCliente.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = iCliente.AMaterno;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = iCliente.RFC;

                SqlParameter sqlpCURP = new SqlParameter();
                sqlpCURP.ParameterName = "@CURP";
                sqlpCURP.SqlDbType = SqlDbType.VarChar;
                sqlpCURP.Value = iCliente.CURP;

                SqlParameter sqlpFechaNacimiento = new SqlParameter();
                sqlpFechaNacimiento.ParameterName = "@FechaNacimiento";
                sqlpFechaNacimiento.SqlDbType = SqlDbType.Date;
                sqlpFechaNacimiento.Value = iCliente.FechaNacimiento;

                SqlParameter sqlpEdad = new SqlParameter();
                sqlpEdad.ParameterName = "@Edad";
                sqlpEdad.SqlDbType = SqlDbType.TinyInt;
                sqlpEdad.Value = iCliente.Edad;

                SqlParameter sqlpSexo = new SqlParameter();
                sqlpSexo.ParameterName = "@Sexo";
                sqlpSexo.SqlDbType = SqlDbType.VarChar;
                sqlpSexo.Value = iCliente.Sexo;

                SqlParameter sqlpEstadoCivil = new SqlParameter();
                sqlpEstadoCivil.ParameterName = "@EstadoCivil";
                sqlpEstadoCivil.SqlDbType = SqlDbType.VarChar;
                sqlpEstadoCivil.Value = iCliente.EstadoCivil;

                SqlParameter sqlpProfesion = new SqlParameter();
                sqlpProfesion.ParameterName = "@Profesion";
                sqlpProfesion.SqlDbType = SqlDbType.Char;
                sqlpProfesion.Size = 7;
                sqlpProfesion.Value = iCliente.Profesion;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = iCliente.Correo;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = iCliente.Telefono;

                SqlParameter sqlpTelefonoMovil = new SqlParameter();
                sqlpTelefonoMovil.ParameterName = "@TelefonoMovil";
                sqlpTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpTelefonoMovil.Value = iCliente.TelefonoMovil;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = iCliente.Calle;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = iCliente.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = iCliente.NoInterior;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = iCliente.Colonia;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = iCliente.CodigoPostal;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = iCliente.EntreCalles;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = iCliente.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = iCliente.Municipio;

                SqlParameter sqlpEmpresa = new SqlParameter();
                sqlpEmpresa.ParameterName = "@Empresa";
                sqlpEmpresa.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresa.Value = iCliente.Empresa;

                SqlParameter sqlpEmpresaCalle = new SqlParameter();
                sqlpEmpresaCalle.ParameterName = "@EmpresaCalle";
                sqlpEmpresaCalle.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaCalle.Value = iCliente.EmpresaCalle;

                SqlParameter sqlpEmpresaNoExterior = new SqlParameter();
                sqlpEmpresaNoExterior.ParameterName = "@EmpresaNoExterior";
                sqlpEmpresaNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaNoExterior.Value = iCliente.EmpresaNoExterior;

                SqlParameter sqlpEmpresaNoInterior = new SqlParameter();
                sqlpEmpresaNoInterior.ParameterName = "@EmpresaNoInterior";
                sqlpEmpresaNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaNoInterior.Value = iCliente.EmpresaNoInterior;

                SqlParameter sqlpEmpresaColonia = new SqlParameter();
                sqlpEmpresaColonia.ParameterName = "@EmpresaColonia";
                sqlpEmpresaColonia.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaColonia.Value = iCliente.EmpresaColonia;

                SqlParameter sqlpEmpresaCodigoPostal = new SqlParameter();
                sqlpEmpresaCodigoPostal.ParameterName = "@EmpresaCodigoPostal";
                sqlpEmpresaCodigoPostal.SqlDbType = SqlDbType.Int;
                if (iCliente.EmpresaCodigoPostal == null)
                    sqlpEmpresaCodigoPostal.Value = DBNull.Value;
                else
                    sqlpEmpresaCodigoPostal.Value = iCliente.EmpresaCodigoPostal;

                SqlParameter sqlpEmpresaEntreCalles = new SqlParameter();
                sqlpEmpresaEntreCalles.ParameterName = "@EmpresaEntreCalles";
                sqlpEmpresaEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaEntreCalles.Value = iCliente.EmpresaEntreCalles;

                SqlParameter sqlpEmpresaEstado = new SqlParameter();
                sqlpEmpresaEstado.ParameterName = "@EmpresaEstado";
                sqlpEmpresaEstado.SqlDbType = SqlDbType.Char;
                sqlpEmpresaEstado.Size = 2;
                if (iCliente.EmpresaEstado == null)
                    sqlpEmpresaEstado.Value = DBNull.Value;
                else
                    sqlpEmpresaEstado.Value = iCliente.EmpresaEstado;

                SqlParameter sqlpEmpresaMunicipio = new SqlParameter();
                sqlpEmpresaMunicipio.ParameterName = "@EmpresaMunicipio";
                sqlpEmpresaMunicipio.SqlDbType = SqlDbType.Char;
                sqlpEmpresaMunicipio.Size = 4;
                if (iCliente.EmpresaMunicipio == null)
                    sqlpEmpresaMunicipio.Value = DBNull.Value;
                else
                    sqlpEmpresaMunicipio.Value = iCliente.EmpresaMunicipio;

                SqlParameter sqlpEmpresaTelefono = new SqlParameter();
                sqlpEmpresaTelefono.ParameterName = "@EmpresaTelefono";
                sqlpEmpresaTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaTelefono.Value = iCliente.EmpresaTelefono;

                SqlParameter sqlpEmpresaTelefonoExt = new SqlParameter();
                sqlpEmpresaTelefonoExt.ParameterName = "@EmpresaTelefonoExt";
                sqlpEmpresaTelefonoExt.SqlDbType = SqlDbType.Int;
                if (iCliente.EmpresaTelefonoExt == null)
                    sqlpEmpresaTelefonoExt.Value = DBNull.Value;
                else
                    sqlpEmpresaTelefonoExt.Value = iCliente.EmpresaTelefonoExt;

                SqlParameter sqlpPuesto = new SqlParameter();
                sqlpPuesto.ParameterName = "@Puesto";
                sqlpPuesto.SqlDbType = SqlDbType.VarChar;
                sqlpPuesto.Value = iCliente.Puesto;

                SqlParameter sqlpTipoSocio = new SqlParameter();
                sqlpTipoSocio.ParameterName = "@TipoSocio";
                sqlpTipoSocio.SqlDbType = SqlDbType.VarChar;
                sqlpTipoSocio.Value = iCliente.TipoSocio;

                SqlParameter sqlpNumeroSocio = new SqlParameter();
                sqlpNumeroSocio.ParameterName = "@NumeroSocio";
                sqlpNumeroSocio.SqlDbType = SqlDbType.VarChar;
                sqlpNumeroSocio.Value = iCliente.NumeroSocio;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iCliente.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iCliente.Estatus;

                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = iCliente.Usuario;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpCURP);
                sqlcComando.Parameters.Add(sqlpFechaNacimiento);
                sqlcComando.Parameters.Add(sqlpEdad);
                sqlcComando.Parameters.Add(sqlpSexo);
                sqlcComando.Parameters.Add(sqlpEstadoCivil);
                sqlcComando.Parameters.Add(sqlpProfesion);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpEmpresa);
                sqlcComando.Parameters.Add(sqlpEmpresaCalle);
                sqlcComando.Parameters.Add(sqlpEmpresaNoExterior);
                sqlcComando.Parameters.Add(sqlpEmpresaNoInterior);
                sqlcComando.Parameters.Add(sqlpEmpresaColonia);
                sqlcComando.Parameters.Add(sqlpEmpresaCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEmpresaEntreCalles);
                sqlcComando.Parameters.Add(sqlpEmpresaEstado);
                sqlcComando.Parameters.Add(sqlpEmpresaMunicipio);
                sqlcComando.Parameters.Add(sqlpEmpresaTelefono);
                sqlcComando.Parameters.Add(sqlpEmpresaTelefonoExt);
                sqlcComando.Parameters.Add(sqlpPuesto);
                sqlcComando.Parameters.Add(sqlpTipoSocio);
                sqlcComando.Parameters.Add(sqlpNumeroSocio);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpUsuario);

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
                throw new Exception("Error capa de datos (public static int Insertar(Cliente " + iCliente.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Clientes
        /// </summary>
        /// <param name="uCliente"></param>
        public static int Actualizar(Cliente uCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = uCliente.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uCliente.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = uCliente.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = uCliente.AMaterno;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = uCliente.RFC;

                SqlParameter sqlpCURP = new SqlParameter();
                sqlpCURP.ParameterName = "@CURP";
                sqlpCURP.SqlDbType = SqlDbType.VarChar;
                sqlpCURP.Value = uCliente.CURP;

                SqlParameter sqlpFechaNacimiento = new SqlParameter();
                sqlpFechaNacimiento.ParameterName = "@FechaNacimiento";
                sqlpFechaNacimiento.SqlDbType = SqlDbType.Date;
                sqlpFechaNacimiento.Value = uCliente.FechaNacimiento;

                SqlParameter sqlpEdad = new SqlParameter();
                sqlpEdad.ParameterName = "@Edad";
                sqlpEdad.SqlDbType = SqlDbType.TinyInt;
                sqlpEdad.Value = uCliente.Edad;

                SqlParameter sqlpSexo = new SqlParameter();
                sqlpSexo.ParameterName = "@Sexo";
                sqlpSexo.SqlDbType = SqlDbType.VarChar;
                sqlpSexo.Value = uCliente.Sexo;

                SqlParameter sqlpEstadoCivil = new SqlParameter();
                sqlpEstadoCivil.ParameterName = "@EstadoCivil";
                sqlpEstadoCivil.SqlDbType = SqlDbType.VarChar;
                sqlpEstadoCivil.Value = uCliente.EstadoCivil;

                SqlParameter sqlpProfesion = new SqlParameter();
                sqlpProfesion.ParameterName = "@Profesion";
                sqlpProfesion.SqlDbType = SqlDbType.Char;
                sqlpProfesion.Size = 7;
                sqlpProfesion.Value = uCliente.Profesion;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = uCliente.Correo;

                SqlParameter sqlpTelefono = new SqlParameter();
                sqlpTelefono.ParameterName = "@Telefono";
                sqlpTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpTelefono.Value = uCliente.Telefono;

                SqlParameter sqlpTelefonoMovil = new SqlParameter();
                sqlpTelefonoMovil.ParameterName = "@TelefonoMovil";
                sqlpTelefonoMovil.SqlDbType = SqlDbType.VarChar;
                sqlpTelefonoMovil.Value = uCliente.TelefonoMovil;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = uCliente.Calle;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = uCliente.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = uCliente.NoInterior;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = uCliente.Colonia;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = uCliente.CodigoPostal;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = uCliente.EntreCalles;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = uCliente.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = uCliente.Municipio;

                SqlParameter sqlpEmpresa = new SqlParameter();
                sqlpEmpresa.ParameterName = "@Empresa";
                sqlpEmpresa.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresa.Value = uCliente.Empresa;

                SqlParameter sqlpEmpresaCalle = new SqlParameter();
                sqlpEmpresaCalle.ParameterName = "@EmpresaCalle";
                sqlpEmpresaCalle.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaCalle.Value = uCliente.EmpresaCalle;

                SqlParameter sqlpEmpresaNoExterior = new SqlParameter();
                sqlpEmpresaNoExterior.ParameterName = "@EmpresaNoExterior";
                sqlpEmpresaNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaNoExterior.Value = uCliente.EmpresaNoExterior;

                SqlParameter sqlpEmpresaNoInterior = new SqlParameter();
                sqlpEmpresaNoInterior.ParameterName = "@EmpresaNoInterior";
                sqlpEmpresaNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaNoInterior.Value = uCliente.EmpresaNoInterior;

                SqlParameter sqlpEmpresaColonia = new SqlParameter();
                sqlpEmpresaColonia.ParameterName = "@EmpresaColonia";
                sqlpEmpresaColonia.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaColonia.Value = uCliente.EmpresaColonia;

                SqlParameter sqlpEmpresaCodigoPostal = new SqlParameter();
                sqlpEmpresaCodigoPostal.ParameterName = "@EmpresaCodigoPostal";
                sqlpEmpresaCodigoPostal.SqlDbType = SqlDbType.Int;
                if (uCliente.EmpresaCodigoPostal == null)
                    sqlpEmpresaCodigoPostal.Value = DBNull.Value;
                else
                    sqlpEmpresaCodigoPostal.Value = uCliente.EmpresaCodigoPostal;

                SqlParameter sqlpEmpresaEntreCalles = new SqlParameter();
                sqlpEmpresaEntreCalles.ParameterName = "@EmpresaEntreCalles";
                sqlpEmpresaEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaEntreCalles.Value = uCliente.EmpresaEntreCalles;

                SqlParameter sqlpEmpresaEstado = new SqlParameter();
                sqlpEmpresaEstado.ParameterName = "@EmpresaEstado";
                sqlpEmpresaEstado.SqlDbType = SqlDbType.Char;
                sqlpEmpresaEstado.Size = 2;
                if (uCliente.EmpresaEstado == null)
                    sqlpEmpresaEstado.Value = DBNull.Value;
                else
                    sqlpEmpresaEstado.Value = uCliente.EmpresaEstado;

                SqlParameter sqlpEmpresaMunicipio = new SqlParameter();
                sqlpEmpresaMunicipio.ParameterName = "@EmpresaMunicipio";
                sqlpEmpresaMunicipio.SqlDbType = SqlDbType.Char;
                sqlpEmpresaMunicipio.Size = 4;
                if (uCliente.EmpresaMunicipio == null)
                    sqlpEmpresaMunicipio.Value = DBNull.Value;
                else
                    sqlpEmpresaMunicipio.Value = uCliente.EmpresaMunicipio;

                SqlParameter sqlpEmpresaTelefono = new SqlParameter();
                sqlpEmpresaTelefono.ParameterName = "@EmpresaTelefono";
                sqlpEmpresaTelefono.SqlDbType = SqlDbType.VarChar;
                sqlpEmpresaTelefono.Value = uCliente.EmpresaTelefono;

                SqlParameter sqlpEmpresaTelefonoExt = new SqlParameter();
                sqlpEmpresaTelefonoExt.ParameterName = "@EmpresaTelefonoExt";
                sqlpEmpresaTelefonoExt.SqlDbType = SqlDbType.Int;
                if (uCliente.EmpresaTelefonoExt == null)
                    sqlpEmpresaTelefonoExt.Value = DBNull.Value;
                else
                    sqlpEmpresaTelefonoExt.Value = uCliente.EmpresaTelefonoExt;

                SqlParameter sqlpPuesto = new SqlParameter();
                sqlpPuesto.ParameterName = "@Puesto";
                sqlpPuesto.SqlDbType = SqlDbType.VarChar;
                sqlpPuesto.Value = uCliente.Puesto;

                SqlParameter sqlpTipoSocio = new SqlParameter();
                sqlpTipoSocio.ParameterName = "@TipoSocio";
                sqlpTipoSocio.SqlDbType = SqlDbType.VarChar;
                sqlpTipoSocio.Value = uCliente.TipoSocio;

                SqlParameter sqlpNumeroSocio = new SqlParameter();
                sqlpNumeroSocio.ParameterName = "@NumeroSocio";
                sqlpNumeroSocio.SqlDbType = SqlDbType.VarChar;
                sqlpNumeroSocio.Value = uCliente.NumeroSocio;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uCliente.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpCURP);
                sqlcComando.Parameters.Add(sqlpFechaNacimiento);
                sqlcComando.Parameters.Add(sqlpEdad);
                sqlcComando.Parameters.Add(sqlpSexo);
                sqlcComando.Parameters.Add(sqlpEstadoCivil);
                sqlcComando.Parameters.Add(sqlpProfesion);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpTelefono);
                sqlcComando.Parameters.Add(sqlpTelefonoMovil);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpEmpresa);
                sqlcComando.Parameters.Add(sqlpEmpresaCalle);
                sqlcComando.Parameters.Add(sqlpEmpresaNoExterior);
                sqlcComando.Parameters.Add(sqlpEmpresaNoInterior);
                sqlcComando.Parameters.Add(sqlpEmpresaColonia);
                sqlcComando.Parameters.Add(sqlpEmpresaCodigoPostal);
                sqlcComando.Parameters.Add(sqlpEmpresaEntreCalles);
                sqlcComando.Parameters.Add(sqlpEmpresaEstado);
                sqlcComando.Parameters.Add(sqlpEmpresaMunicipio);
                sqlcComando.Parameters.Add(sqlpEmpresaTelefono);
                sqlcComando.Parameters.Add(sqlpEmpresaTelefonoExt);
                sqlcComando.Parameters.Add(sqlpPuesto);
                sqlcComando.Parameters.Add(sqlpTipoSocio);
                sqlcComando.Parameters.Add(sqlpNumeroSocio);
                sqlcComando.Parameters.Add(sqlpEstatus);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Actualizar(Cliente " + uCliente.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Articulo por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarArticulo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 2;
                sqlpID.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción DELETE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Borrar(Articulo " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Clientes
        /// </summary>
        /// <returns></returns>
        public static List<Cliente> ObtenerClientes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerClientes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Cliente> result = LibraryGenerics<Cliente>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Cliente> ObtenerClientes()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Cliente por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Cliente ObtenerClientePorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerClientePorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Cliente result = LibraryGenerics<Cliente>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Cliente ObtenerClientePorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
