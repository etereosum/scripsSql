update municipios 
inner join mun_old
on municipios.nombre = mun_old.nombre
set municipios.codigo = mun_old.codigo


update municipios 
inner join mun
on municipios.nombre = mun.nombre
set municipios.codigo = mun.codigo_municipio


update municipios 
inner join mun
on municipios.nombre = mun.nombre
set municipios.codigo = mun.codigo_municipio

update departamentos 
inner join mun
on departamentos.nombre = mun.departamento
set departamentos.codigo = mun.codigo_departamento