// Crear un estilo DataTable para la tabla con id=tablausuarios
$('#tablausuario').DataTable({
    // Configuracion del idioma
    language: {
        // traduccion a español
        url: 'https://cdn.datatables.net/plug-ins/2.0.7/i18n/es-MX.json',
    },
    responsive: true,   // activar diseño responsive a la tabla
    // configurar las columnas que se mostraran en pantallas pequeñas
    columnDefs: [
        { responsivePriority: 1, targets: 2 }, // columna nombre / prioridad alta
        { responsivePriority: 2, targets: 3 }  // columna apellido
    ],
    // configuracion de visibilidad de columnas
    // layout: {
    //     topStart: {
    //         buttons: ['colvis']
    //     }
    // }
});