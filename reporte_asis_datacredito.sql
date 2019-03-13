SELECT 
		clientes.tipo_documento as tipo_doc,
        clientes.num_documento as num_doc,
        afiliaciones.id as afil_id,
        clientes.nombre as nombre,
        afiliaciones.created_at as f_apertura,
        afiliaciones.estado as estado,
        afiliaciones.periodo_pago as periodicidad,
        fecha_pagos.fecha_pago as fecha_pago,
        servicios.vlr_cuota as vlr_cuota,
        depto_reside.codigo as depto_reside,
        mun_reside.codigo as mun_reside,
        mun_reside.nombre as mun_reside_nombre,
        barrio_reside.nombre as barrio_reside,
        clientes.dir_reside as dir_reside,
        depto_cobro.codigo as depto_cobro,
        mun_cobro.codigo as mun_cobro,
        mun_cobro.nombre as mun_cobro_nombre,
        barrio_cobro.nombre as barrio_cobro,
        clientes.dir_cobro as dir_cobro,
        clientes.movil as movil,
        clientes.telefono as telefono,
        clientes.email as email,
        mun_radica.codigo as mun_radica
        
FROM afiliaciones
INNER JOIN clientes ON afiliaciones.cliente_id = clientes.id
INNER JOIN fecha_pagos ON afiliaciones.id = fecha_pagos.afiliacion_id
INNER JOIN servicios ON afiliaciones.servicio_id = servicios.id
INNER JOIN departamentos as depto_reside ON clientes.depto_reside_id = depto_reside.id
INNER JOIN municipios as mun_reside ON clientes.mun_reside_id = mun_reside.id
INNER JOIN barrios as barrio_reside ON clientes.barrio_reside_id = barrio_reside.id
INNER JOIN departamentos as depto_cobro ON clientes.depto_reside_id = depto_cobro.id
INNER JOIN municipios as mun_cobro ON clientes.mun_reside_id = mun_cobro.id
INNER JOIN barrios as barrio_cobro ON clientes.barrio_reside_id = barrio_cobro.id
INNER JOIN users ON afiliaciones.user_created_id = users.id 
INNER JOIN sucursales ON users.sucursal_id = sucursales.id
INNER JOIN municipios as mun_radica ON mun_radica.id = sucursales.municipio_id
WHERE afiliaciones.estado = 'Activo' or afiliaciones.estado = 'Mora'