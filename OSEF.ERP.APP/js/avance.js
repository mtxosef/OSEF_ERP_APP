//Boton de nuevo
var imgbtnNuevo_Click = function () {
//    //Limpiar controles del encabezado
//    App.cmbMov.clearValue();
//    App.txtfMovID.setValue(null);
//    App.nfSemana.setValue(null);
//    App.cmbSucursal.clearValue();
//    App.txtfSucursalNombre.setValue(null);
//    App.dfFechaEmision.setValue(null); cmbCuadrilla_Select
//    App.dfFechaRevision.setValue(null);
//    App.txtfObservaciones.setValue(null);
//    App.txtfComentarios.setValue(null);

//    //Borrar el GridPanel del Detalle y Encabezado
//    App.sObraCivil.removeAll();
//    App.sRevision.removeAll();
//    Ext.util.Cookies.set('cookieEditarRevision', 'Nuevo');
//    window.parent.App.wEmergente.setTitle('Nuevo Avance');
};

//Boton de abrir o cerrar
var imgbtnAbrir_Click = function () {
//    window.parent.App.wEmergente.hide();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
//    window.parent.App.pCentro.getBody().App.sAvances.reload();
//    if (result.extraParamsResponse.accion == 'insertar') {
//        Ext.Msg.show({
//            id: 'msgAvance',
//            title: 'GUARDAR',
//            msg: '<p align="center">Movimiento registrado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
//            buttons: Ext.MessageBox.OK,
//            onEsc: Ext.emptyFn,
//            closable: false,
//            icon: Ext.MessageBox.INFO
//        });
//        App.imgbtnBorrar.setDisabled(false);
//    }
//    else {
//        Ext.Msg.show({
//            id: 'msgAvance',
//            title: 'ACTUALIZAR',
//            msg: '<p align="center">Movimiento actualizado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
//            buttons: Ext.MessageBox.OK,
//            onEsc: Ext.emptyFn,
//            closable: false,
//            icon: Ext.MessageBox.INFO
//        });
//    }
};

//Mostrar información de la sucursal seleccionada
var imgbtnInfo_Click = function () {
//    window.parent.App.wEmergenteGraficas.load('FormaInfoGraficas.aspx');
//    window.parent.App.wEmergenteGraficas.setHeight(545);
//    window.parent.App.wEmergenteGraficas.setWidth(960);
//    window.parent.App.wEmergenteGraficas.center();
//    window.parent.App.wEmergenteGraficas.setTitle('Gráficas');
//    window.parent.App.wEmergenteGraficas.show();
};

//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
//    if (App.sRevision.getCount() != 0) {
//        if (App.sRevision.getAt(0).get('Estatus') == 'PENDIENTE') {
//            App.wEmergente.load('FormaAvanzarMovimiento.aspx');
//            App.wEmergente.setHeight(170);
//            App.wEmergente.setWidth(220);
//            App.wEmergente.center();
//            App.wEmergente.setTitle('Avanzar Movimiento');
//            App.wEmergente.show();
//            return false;
//        }
//        else {
//            return true;
//        }
//    }
//    else {
//        return true;
//    }
};

//Afectar el movimiento
var imgbtnAfectar_Click_Success = function (response, result) {
//    //1. Actualizar el store del tablero
//    window.parent.App.pCentro.getBody().App.sAvances.reload();

//    //2. Lanzar ventana de movimiento afectado
//    Ext.Msg.show({
//        id: 'msgAvance',
//        title: 'AFECTAR',
//        msg: '<p align="center">Movimiento afectado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
//        buttons: Ext.MessageBox.OK,
//        onEsc: Ext.emptyFn,
//        closable: false,
//        icon: Ext.MessageBox.INFO
//    });

//    //Actualizar campos afetados
//    App.txtfMovID.setValue(App.sRevision.getAt(0).get('MovID'));
//    App.sbFormaAvance.setText(App.sRevision.getAt(0).get('Estatus'));

//    //3. Remover la útima fila
//    var ultimoRegistro = App.sObraCivil.getAt(App.sObraCivil.getCount() - 1);
//    if (ultimoRegistro.get('Concepto').length == 0 && ultimoRegistro.get('Proveedor').length == 0 && ultimoRegistro.get('Programado') == 0 && ultimoRegistro.get('Real') == 0) {
//        App.sObraCivil.removeAt(App.sObraCivil.getCount() - 1);
//    }

//    //4. Deseleccionar datos del GridPanel y deshabilitar los controles
//    App.gpObraCivil.getSelectionModel().deselectAll();
//    DeshabilitarControlesAfectar();
//    Ext.util.Cookies.set('cookieEditarRevision', App.sRevision.getAt(0).get('ID'));
};

//Para autorizar un movimiento a afectar
var imgbtnAutorizar_Click = function () {
};

//Mandar a imprimir en una vista previa
var imgbtnImprimir_Click = function () {
};

//Borrar un movimiento que no ha sido afectado
var imgbtnBorrar_Click = function () {
};

//Cancelar un movimiento ya afectado
var imgbtnCancelar_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el primero seleccionado
var imgbtnPrimero_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el anterior seleccionado
var imgbtnAnterior_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el siguiente seleccionado
var imgbtnSiguiente_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el último seleccionado
var imgbtnUltimo_Click = function () {
};

//Lanzar ventana de la galería de imagenes
var imgbtnGaleria_Click = function () {
//    App.wFormaGaleria.load('FormaGaleria.aspx');
//    App.wFormaGaleria.setHeight(386);
//    App.wFormaGaleria.setWidth(900);
//    App.wFormaGaleria.center();
//    App.wFormaGaleria.setTitle('Galeria de imágenes');
//    App.wFormaGaleria.show();
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
//    //Asignar Fecha en el control Fecha de emisión
//    var d = new Date();
//    if (App.dfFechaEmision.getValue() == null) {
//        App.dfFechaEmision.setValue(d);
//    }

//    //Validar si se asigna el primer renglon del detalle
//    PrimerRenglonDetalle();
//    //Validar si se habilita Guardar
//    HabilitarGuardar();
//    //Validar si se habilita Afectar
//    HabilitarAfectar();
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
//    var d = new Date();

//    //Validar si es nuevo, se asigna el movimieno Iniciar Proyecto y Semana número 1
//    if (registros[0].get('ID') == 'Iniciar proyecto' && Ext.util.Cookies.get('cookieEditarRevision') == 'Nuevo') {
//        App.cmbMov.select(registros[0].get('ID'));
//        App.cmbMov.setReadOnly(true);
//        App.nfSemana.setValue(1);
//        App.nfSemana.setReadOnly(true);
//        App.dfFechaEmision.setValue(d);
//        App.cmbSucursal.focus();
//    }
};

//Evento que se lanza al cambiar el valor de la Semana
var nfSemana_Change = function () {
//    //Validar si se asigna el primer renglon del detalle
//    PrimerRenglonDetalle();
//    //Validar si se habilita Afectar
//    HabilitarAfectar();
};

//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbSucursal_Select = function (combobox, registro) {
//    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);
//    //Validar si se asigna el primer renglon del detalle
//    PrimerRenglonDetalle();    
//    //Validar si se habilita Guardar
//    HabilitarGuardar();    
//    //Validar si se habilita Información
//    HabilitarInformacion();
//    //Validar si se habilita Afectar
//    HabilitarAfectar();
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
//    App.sSucursales.clearFilter();
//    if (App.cmbSucursal.getValue() != null) {
//        App.sSucursales.filter([{ filterFn: function (item) {
//            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
//            else { return false; }
//        }
//        }]);
//    }
//    else {
//        App.txtfSucursalNombre.setValue('');
//    }
    //Validar si se habilita Guardar
    //HabilitarGuardar();
    //Validar si se habilita Información
    //HabilitarInformacion();
    //Validar si se habilita Afectar
    //HabilitarAfectar();
};

//Evento que se lanza al poner alguna fecha valida en el control de FechaRevision
var dfFechaRevision_Change = function () {
    //Validar si se asigna el primer renglon del detalle
    //PrimerRenglonDetalle();
    //Validar si se habilita Afectar
    //HabilitarAfectar();
};

//Evento que se lanza al cargar datos al Store
var sCategorias_Load = function (store, registros, transaccion, opciones) {

};

//Evento que se lanza al cargar datos al Store
var sSubCategorias_Load = function (store, registros, transaccion, opciones) {

};

var updateTotal = function (grid, container) {
    if (!grid.view.rendered) {
        return;
    }

    var field,
                value,
                width,
                c,
                cs = grid.headerCt.getVisibleGridColumns(),
                group = {
                    records: grid.store.getRange()
                };

    container.suspendLayout = true;
    for (var i = 0; i < cs.length; i++) {
        c = cs[i];

        if (c.dataIndex !== 'Name') {
            if (c.summaryType) {
                value = App.Group1.getSummary(grid.store, c.summaryType, c.dataIndex, group);
            }
            else {
                value = "-";
            }

            field = container.down('component[name="' + c.dataIndex + '"]');

            container.remove(field, false);
            container.insert(i, field);
            width = c.getWidth();
            field.setWidth(width - 1);
            var r = c.summaryRenderer || simpleRenderer;
            field.setValue(r(value, {}, c.dataIndex));
        }
    }

    container.items.each(function (field) {
        var column = grid.headerCt.down('component[dataIndex="' + field.name + '"]');
        field.setVisible(column.isVisible());
    });

    container.suspendLayout = false;
    container.doLayout();
};

var simpleRenderer = function (v) {
    return v;
};

var totalCost = function (records) {
    var i = 0,
                length = records.length,
                total = 0,
                record;

    for (; i < length; ++i) {
        record = records[i];
        total += record.get('Estimate') * record.get('Rate');
    }
    return total;
};

//Evento que se lanza al cargar datos al Store
var sConceptos_Load = function (store, registros, transaccion, opciones) {

//        Ext.create("Ext.grid.Panel", {
//            store: {
//                model: Ext.define(Ext.id(), {
//                    extend: "Ext.data.Model",
//                    fields: [{ name: "ProjectID" }, { name: "Name" }, { name: "TaskID" }, { name: "Description" }, { name: "Estimate", type: "int" }, { name: "Rate", type: "float" }, { name: "Due", type: "date", dateFormat: "Y-m-d\\TH:i:s"}],
//                    idProperty: "TaskID" }),
//                storeId: "Store1",
//                autoLoad: true,
//                sorters: [{ direction: "DESC", property: "Due"}],
//                groupField: "Name",
//                proxy: {
//                    data: [
//                        { "ProjectID": 100, "Name": "Ext Forms: Field Anchoring", "TaskID": 112, "Description": "Integrate 2.0 Forms with 2.0 Layouts", "Estimate": 6, "Rate": 150.0, "Due": "2007-06-24T00:00:00" },
//                        { "ProjectID": 100, "Name": "Ext Forms: Field Anchoring", "TaskID": 113, "Description": "Implement AnchorLayout", "Estimate": 4, "Rate": 150.0, "Due": "2007-06-25T00:00:00" },
//                        { "ProjectID": 100, "Name": "Ext Forms: Field Anchoring", "TaskID": 114, "Description": "Add support for multiple types of anchors", "Estimate": 4, "Rate": 150.0, "Due": "2007-06-27T00:00:00" },
//                        { "ProjectID": 100, "Name": "Ext Forms: Field Anchoring", "TaskID": 115, "Description": "Testing and debugging", "Estimate": 8, "Rate": 0.0, "Due": "2007-06-29T00:00:00" },
//                        { "ProjectID": 101, "Name": "Ext Grid: Single-level Grouping", "TaskID": 101, "Description": "Add required rendering \"hooks\" to GridView", "Estimate": 6, "Rate": 100.0, "Due": "2007-07-01T00:00:00" },
//                        { "ProjectID": 101, "Name": "Ext Grid: Single-level Grouping", "TaskID": 102, "Description": "Extend GridView and override rendering functions", "Estimate": 6, "Rate": 100.0, "Due": "2007-07-03T00:00:00" },
//                        { "ProjectID": 101, "Name": "Ext Grid: Single-level Grouping", "TaskID": 103, "Description": "Extend Store with grouping functionality", "Estimate": 4, "Rate": 100.0, "Due": "2007-07-04T00:00:00" },
//                        { "ProjectID": 101, "Name": "Ext Grid: Single-level Grouping", "TaskID": 121, "Description": "Default CSS Styling", "Estimate": 2, "Rate": 100.0, "Due": "2007-07-05T00:00:00" },
//                        { "ProjectID": 101, "Name": "Ext Grid: Single-level Grouping", "TaskID": 104, "Description": "Testing and debugging", "Estimate": 6, "Rate": 100.0, "Due": "2007-07-06T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 105, "Description": "Ext Grid plugin integration", "Estimate": 4, "Rate": 125.0, "Due": "2007-07-01T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 106, "Description": "Summary creation during rendering phase", "Estimate": 4, "Rate": 125.0, "Due": "2007-07-02T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 107, "Description": "Dynamic summary updates in editor grids", "Estimate": 6, "Rate": 125.0, "Due": "2007-07-05T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 108, "Description": "Remote summary integration", "Estimate": 4, "Rate": 125.0, "Due": "2007-07-05T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 109, "Description": "Summary renderers and calculators", "Estimate": 4, "Rate": 125.0, "Due": "2007-07-06T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 110, "Description": "Integrate summaries with GroupingView", "Estimate": 10, "Rate": 125.0, "Due": "2007-07-11T00:00:00" },
//                        { "ProjectID": 102, "Name": "Ext Grid: Summary Rows", "TaskID": 111, "Description": "Testing and debugging", "Estimate": 8, "Rate": 125.0, "Due": "2007-07-15T00:00:00"}],
//                    type: 'memory'
//                }
//            },
//            id: "GridPanel1",
//            frame: true,
//            height: 450,
//            plugins: [{ ptype: "cellediting", clicksToEdit: 1, listeners: { edit: { fn: function (item, e) { this.view.refresh(); } }}}],
//            renderTo: document.body,
//            width: 800,
//            dockedItems: [{
//                id: "Container1",
//                dock: "bottom",
//                style: "margin-top:2px;",
//                xtype: "container",
//                defaults: { "height": 22 },
//                items: [
//                    { id: "ColumnField1", cls: "total-field", xtype: "displayfield", name: "Description", value: "-" },
//                    { id: "ColumnField2", cls: "total-field", xtype: "displayfield", name: "Due", value: "-" },
//                    { id: "ColumnField3", cls: "total-field", xtype: "displayfield", name: "Estimate", value: "-" },
//                    { id: "ColumnField4", cls: "total-field", xtype: "displayfield", name: "Rate", value: "-" },
//                    { id: "ColumnField5", cls: "total-field", xtype: "displayfield", name: "Cost", value: "-"}],
//                layout: "hbox"
//            }],
//            tbar: {
//                xtype: "toolbar",
//                items: [
//                    { id: "ctl29", text: "Toggle Summary", tooltip: "Toggle the visibility of summary row", listeners: {
//                        click: {
//                            fn: function (item, e) {
//                                App.Group1.toggleSummaryRow(!App.Group1.showSummaryRow);
//                                App.Group1.view.refresh();
//                            }
//                        }
//                    }
//                }]
//            },
//            title: "Sponsored Projects",
//            iconCls: "#ApplicationViewColumns",
//            columns: { items: [
//                { flex: 1, dataIndex: "Description", hideable: false, sortable: true, tdCls: "task", text: "Task", summaryType: "count", summaryRenderer: function (value, metadata, record, rowIndex, colIndex, store, view) { return ((value === 0 || value > 1) ? '(' + value + ' Tasks)' : '(1 Task)'); } },
//                { width: 20, dataIndex: "Name", text: "Project" },
//                { width: 85, dataIndex: "Due", editor: new Ext.grid.CellEditor(Ext.apply({ field: { id: "ctl13", xtype: "datefield", format: "m/d/Y", submitFormat: "d/m/Y"} }, {})), renderer: function (value) { return Ext.util.Format.date(value, 'm/d/Y'); }, sortable: true, text: "Due Date", summaryType: "max", summaryRenderer: Ext.util.Format.dateRenderer('m/d/Y') },
//                { width: 75, dataIndex: "Estimate", editor: new Ext.grid.CellEditor(Ext.apply({ field: { id: "ctl17", allowNegative: false, style: "text-align:left", xtype: "numberfield", allowBlank: false, decimalSeparator: "."} }, {})), renderer: function (value, metadata, record, rowIndex, colIndex, store, view) { return value + ' hours'; }, sortable: true, text: "Estimate", summaryType: "sum", summaryRenderer: function (value, metadata, record, rowIndex, colIndex, store, view) { return value + ' hours'; } },
//                { width: 75, dataIndex: "Rate", editor: new Ext.grid.CellEditor(Ext.apply({ field: { id: "ctl21", allowNegative: false, style: "text-align:left", xtype: "numberfield", allowBlank: false, decimalSeparator: "."} }, {})), renderer: Ext.util.Format.usMoney, sortable: true, text: "Rate", summaryType: "average", summaryRenderer: Ext.util.Format.usMoney },
//                { id: "Cost", width: 75, dataIndex: "Cost", groupable: false, renderer: function (value, metadata, record, rowIndex, colIndex, store, view) { return Ext.util.Format.usMoney(record.data.Estimate * record.data.Rate); }, sortable: false, text: "Cost", summaryType: totalCost, summaryRenderer: Ext.util.Format.usMoney}]
//            },
//            viewConfig: { xtype: "gridview", listeners: { refresh: { fn: function (item) { updateTotal(this.panel, App.Container1); } }} },
//            features: [window.App.Group1 = Ext.create("Ext.grid.feature.GroupingSummary", { proxyId: "Group1", ftype: "groupingsummary", enableGroupingMenu: false, groupHeaderTpl: "{name}", hideGroupedHeader: true })],
//            listeners: { columnhide: { fn: function (item, column) { updateTotal(this, App.Container1); } }, columnmove: { fn: function (item, column, fromIdx, toIdx) { updateTotal(this, App.Container1); } }, columnresize: { fn: function (item, column, width) { updateTotal(this, App.Container1); } }}
//        });

        //1. Recorrer el Store de Categorias
        App.sCategorias.each(function (registro) {

            //2. Crear el Panel que contrendra un TabPanel
            var pCategoria = Ext.create('Ext.panel.Panel', {
                id: 'p' + registro.get('ID'),
                title: registro.get('Descripcion')
            });

            //3. Agregar el Panel al control TabPanel
            App.tpDetalle.addTab(pCategoria);

            //2. Crear el modelo de Conceptos para la Categoria
            Ext.define('mConcepto' + registro.get('ID'), {
                extend: 'Ext.data.Model',
                idProperty: 'ID',
                fields: [
                    { name: 'ID', type: 'string' },
                    { name: 'Modulo', type: 'string' },
                    { name: 'Orden', type: 'int' },
                    { name: 'Descripcion', type: 'string' },
                    { name: 'Categoria', type: 'string' },
                    { name: 'SubCategoria', type: 'string' }
                ]
            });

            //3. Crear el Store para los Conceptos
            var sConceptos = Ext.create('Ext.data.Store', {
                storeId: 'sConceptos' + registro.get('ID'),
                model: 'mConcepto' + registro.get('ID'),
                sorters: [{
                    property: 'ID',
                    direction: 'ASC'
                }],
            });

            //4. Filtrar el store de Conceptos por su Categoria
            store.each(function (record, index) {
                if (record.get('Categoria') == registro.get('ID')) {
                    sConceptos.add(record);
                }
            });

            //5. Construir el Modelo del Store para el GridPanel
            Ext.define('mCategoria' + registro.get('ID'), {
                extend: 'Ext.data.Model',
                idProperty: 'Renglon',
                fields: [
                            { name: 'Revision', type: 'int' },
                            { name: 'Renglon', type: 'int' },
                            { name: 'Concepto', type: 'string' },
                            { name: 'SubCategoria', type: 'string' },
                            { name: 'Proveedor', type: 'string' },
                            { name: 'Programado', type: 'float' },
                            { name: 'Real', type: 'float' }
                        ]
            });

            //6. Contriur el Store del GridPanel
            var sCategoria = Ext.create('Ext.data.Store', {
                storeId: 's' + registro.get('ID'),
                model: 'mCategoria' + registro.get('ID'),
                groupField: 'SubCategoria',
                sorters: [{
                    property: 'SubCategoria',
                    direction: 'ASC'
                }],
                proxy: {
                    type: 'memory',
                    reader: {
                        type: 'json',
                        root: 'items'
                    }
                }
            });

            //7. Agregar los conceptos al store del GridPanel
            var cont = 1;
            sConceptos.each(function (record, index) {
                var registro = App.sSubCategorias.findRecord('ID', record.get('SubCategoria'));
                if (registro !== null) {
                    sCategoria.add({ Revision: 1, Renglon: cont, Concepto: record.get('ID'), SubCategoria: registro.get('Descripcion'), Proveedor: '', Programado: 0, Real: 0 });
                }
                else {
                    sCategoria.add({ Revision: 1, Renglon: cont, Concepto: record.get('ID'), SubCategoria: '', Proveedor: '', Programado: 0, Real: 0 });
                }
                cont++;
            });

            //8. Construir el gridPanel
            var gpCategoria = Ext.create('Ext.grid.Panel', {
                id: 'gpCategoria' + registro.get('ID'),
                store: Ext.data.StoreManager.lookup('s' + registro.get('ID')),
                columns: [
                    { id: 'ccEliminar' + registro.get('ID'), width: 25, xtype: "commandcolumn", commands: [{ xtype: "button", command: "Borrar", tooltip: { text: "Borrar" }, iconCls: "#Delete"}], prepareToolbar: ccAcciones_PrepareToolbar, listeners: { command: { fn: ccAcciones_Command}} },
                    { id: 'cConcepto' + registro.get('ID'), text: 'Concepto', dataIndex: 'Concepto', flex: 1, renderer: cConcepto_Renderer, editor: { id: 'cmbConceptos' + registro.get('ID'), xtype: 'combobox', displayField: 'Descripcion', valueField: 'ID', queryMode: 'local', store: sConceptos} },
                    { id: 'cSubCategoria' + registro.get('ID'), text: 'SubCategoria', dataIndex: 'SubCategoria' },
                    { id: 'cProveedor' + registro.get('ID'), text: 'Proveedor', dataIndex: 'Proveedor', flex: 1, renderer: cProveedor_Renderer, editor: { id: 'cmbProveedores' + registro.get('ID'), xtype: 'combobox', displayField: 'Nombre', valueField: 'ID', queryMode: 'local', store: App.sProveedores} },
                    { id: 'cProgramado' + registro.get('ID'), text: 'Programado', dataIndex: 'Programado', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cProgramado_Renderer, editor: { id: 'nfProgramado' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
                    { id: 'cReal' + registro.get('ID'), text: 'Real', dataIndex: 'Real', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cReal_Renderer, editor: { id: 'nfReal' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} }
                ],
                height: 210,
                width: 870,
                enableColumnHide: false,
                enableColumnMove: false,
                enableColumnResize: false,
                header: false,
                sortableColumns: false,
                selType: 'cellmodel',
                selModel: {
                    mode: 'SINGLE'
                },
                plugins: {
                    id: 'ceCategoria' + registro.get('ID'),
                    ptype: 'cellediting',
                    clicksToEdit: 1,
                    listeners: {
                        edit: ceCategorias_Edit
                    }
                },
                viewConfig: {
                    id: 'gvCategoria' + registro.get('ID'),
                    stripeRows: true
                },
                features: [{ ftype: 'groupingsummary', hideGroupedHeader: true }]
            });

            //9. Agregar el GridPanel al Panel correspondiente
            pCategoria.add(gpCategoria);
        });
};

//Evento que crea el mejor GridPanel, segun caracteristicas
function ConstruirGridPanel(registro, sConceptos){        
    return Ext.create('Ext.grid.Panel', {
        id: 'gpCategoria' + registro.get('ID'),
        store: Ext.data.StoreManager.lookup('s' + registro.get('ID')),
        columns: [
            { id: 'ccEliminar' + registro.get('ID'), width: 25, xtype: "commandcolumn", commands: [{ xtype: "button", command: "Borrar", tooltip: { text: "Borrar" }, iconCls: "#Delete"}], prepareToolbar: ccAcciones_PrepareToolbar, listeners: { command: { fn: ccAcciones_Command}} },
            { id: 'cConcepto' + registro.get('ID'), text: 'Concepto', dataIndex: 'Concepto', flex: 1, renderer: cConcepto_Renderer, editor: { id: 'cmbConceptos' + registro.get('ID'), xtype: 'combobox', displayField: 'Descripcion', valueField: 'ID', queryMode: 'local', store: sConceptos} },
            { id: 'cSubCategoria' + registro.get('ID'), text: 'SubCategoria', dataIndex: 'SubCategoria' },
            { id: 'cProveedor' + registro.get('ID'), text: 'Proveedor', dataIndex: 'Proveedor', flex: 1, renderer: cProveedor_Renderer, editor: { id: 'cmbProveedores' + registro.get('ID'), xtype: 'combobox', displayField: 'Nombre', valueField: 'ID', queryMode: 'local', store: App.sProveedores} },
            { id: 'cProgramado' + registro.get('ID'), text: 'Programado', dataIndex: 'Programado', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cProgramado_Renderer, editor: { id: 'nfProgramado' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} },
            { id: 'cReal' + registro.get('ID'), text: 'Real', dataIndex: 'Real', xtype: 'numbercolumn', align: 'center', summaryType: 'sum', renderer: cReal_Renderer, editor: { id: 'nfReal' + registro.get('ID'), xtype: 'numberfield', allowDecimals: true, allowExponential: false, decimalPrecision: 2, decimalSeparator: '.', step: 0.01, maxValue: 100, minValue: 0} }
        ],
        height: 210,
        width: 870,
        enableColumnHide: false,
        enableColumnMove: false,
        enableColumnResize: false,
        header: false,
        sortableColumns: false,
        selType: 'cellmodel',
        selModel: {
            mode: 'SINGLE'
        },
        plugins: {
            id: 'ceCategoria' + registro.get('ID'),
            ptype: 'cellediting',
            clicksToEdit: 1,
            listeners: {
                edit: ceCategorias_Edit
            }
        },
        viewConfig: {
            id: 'gvCategoria' + registro.get('ID'),
            stripeRows: true
        },
        features: [{ ftype: 'groupingsummary', hideGroupedHeader: true }]
    });
};

//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
var cConcepto_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sConceptos.findRecord('ID', valor);
        return registro.get('Descripcion');
    }
};

//Evento que renderiza el valor de la columna SubCategoria
var cSubCategoria_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sSubCategorias.findRecord('ID', valor);
        return registro.get('Descripcion');
    }
};

//Evento que muestra el valor de la columna Proveedor por su nombre y no por su ID
var cProveedor_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sProveedores.findRecord('ID', valor);
        return registro.get('Nombre');
    }
};

//Darle formato a la columna de Programado
var cProgramado_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Darle formato a la columna de Real
var cReal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';    
    return F.number(valor, "000.00%");
};

//Evento que se lanza despues de editar una columna en ObraCivil
var ceCategorias_Edit = function (cellediting, columna) {
    var grid = Ext.getCmp('gpCategoria' + cellediting.id.substring(11, 16));
    var store = grid.getStore();
    //Verificar si abajo de esta columna existe otra
    if (store.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = store.getAt(columna.rowIdx);
        if (registro.get('Concepto').length != 0 && registro.get('Proveedor').length != 0 && registro.get('Programado') != 0 && registro.get('Real') != 0) {
            //Obtener el Renglon anterior
            var renglonAnterior = store.getAt(columna.rowIdx).get('Renglon') + 1;
            //Insertar un nuevo registro
            store.insert(store.getCount(), { Renglon: renglonAnterior });
            //Actualiza el renglon anterior pintando el botón de borrar
            grid.getView().refreshNode(store.getCount() - 2);
            //Validar si se habilita Afectar
            HabilitarAfectar();
        }
    }
};

//Evento lanzado al cargar el store de avance encabezado
var sRevision_Load = function () {
    //App.direct.sRevision_Load();
    //store = window.parent.App.pCentro.getBody().App.sAvances;
};

//Evento lanzado al agregar un registro al store
var sRevision_Add = function (avance, registro) {
//    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo') {
//        App.cmbMov.setValue(registro[0].get('Mov'));
//        App.txtfMovID.setValue(registro[0].get('MovID'));
//        App.nfSemana.setValue(registro[0].get('Semana'));
//        App.cmbSucursal.setValue(registro[0].get('Sucursal'));
//        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
//        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
//        App.dfFechaRevision.setValue(registro[0].get('FechaRevision'));
//        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
//        App.txtfComentarios.setValue(registro[0].get('Comentarios'));
//        App.sbFormaAvance.setText(registro[0].get('Estatus'));

//        //Agregar una fila para seguir capturando
//        var renglonAnterior = App.sObraCivil.getAt(App.sObraCivil.getCount() - 1).get('Renglon') + 1;
//        App.sObraCivil.insert(App.sObraCivil.getCount(), { Renglon: renglonAnterior });
//    }
};

//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
//    //Eliminar registro
//    App.sObraCivil.removeAt(fila);

//    //Asignar renglones
//    var renglon = 0;
//    App.sObraCivil.each(function (dato) {
//        dato.set('Renglon', renglon);
//        renglon = renglon + 1;
//    });

//    //Validar si se habilita Afectar
//    HabilitarAfectar();
};

//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
//    if (grid.getStore().getCount() - 1 == rowIndex) {
//        toolbar.items.get(0).hide();
//    }
};

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
//    if (App.cmbMov.getValue() != null && App.cmbSucursal.getValue() != null) {
//        App.imgbtnGuardar.setDisabled(false);
//    }
//    else {
//        App.imgbtnGuardar.setDisabled(true);
//    }
}

//Validar si se habilita el botón de Información
function HabilitarInformacion() {
//    if (App.cmbSucursal.getValue() != null) {
//        App.imgbtnInfo.setDisabled(false);
//    }
//    else {
//        App.imgbtnInfo.setDisabled(true);
//    }
}

//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {
//    
//    if (App.cmbMov.getValue() != null && App.nfSemana.getValue() != null && App.cmbSucursal.getValue() != null && App.dfFechaRevision.getValue() != null && App.dfFechaEmision.getValue() != null) {
//        if (App.nfSemana.isValid() && App.cmbSucursal.isValid() && App.dfFechaRevision.isValid()) {
//            if (App.gpObraCivil.getStore().getCount() != 0) {
//                if (App.sObraCivil.getAt(0).get('Concepto').length != 0 && App.sObraCivil.getAt(0).get('Proveedor').length != 0 && App.sObraCivil.getAt(0).get('Programado') != 0 && App.sObraCivil.getAt(0).get('Real') != 0) {
//                    App.imgbtnAfectar.setDisabled(false);
//                }
//                else {
//                    App.imgbtnAfectar.setDisabled(true);
//                }
//            }
//            else {
//                App.imgbtnAfectar.setDisabled(true);
//            }
//        }
//        else {
//            App.imgbtnAfectar.setDisabled(true);
//        }
//    }
//    else {
//        App.imgbtnAfectar.setDisabled(true);
//    }
}

//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
//    //Validar si se asigna el primer renglon del concepto
//    if (App.cmbMov.getValue() != null && App.nfSemana.getValue() != null && App.cmbSucursal.getValue() != null && App.dfFechaRevision.getValue() != null) {
//        if (App.nfSemana.isValid() && App.cmbSucursal.isValid() && App.dfFechaRevision.isValid()) {
//            var store = App.gpObraCivil.getStore();
//            if (store.getCount() == 0) {
//                //Insertar el primer registro
//                store.insert(0, { Renglon: 0 });
//            }
//        }
//    }
}

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
//    App.cmbMov.setDisabled(true);
//    App.nfSemana.setDisabled(true);
//    App.cmbSucursal.setDisabled(true);
//    App.dfFechaEmision.setDisabled(true);
//    App.dfFechaRevision.setDisabled(true);
//    App.txtfObservaciones.setDisabled(true);
//    App.txtfComentarios.setDisabled(true);
//    App.gpObraCivil.setDisabled(true);
//    App.imgbtnGuardar.setDisabled(true);
//    App.imgbtnBorrar.setDisabled(true);
}