-- 1 --GUIA*3--
create table  cliente( -- ya
idCliente int  primary key auto_increment,
nombreCliente  varchar(150) not null,
apellidoCliente varchar(150) not null,
DUICliente  varchar(10),
correoCliente varchar(150) not null,
FechaNacimientoCliente  date  not null,
telefonoCliente  int not null,
idDireccion int not null
);
-- 2 --
create table direccion( -- ya estuvo--
idDireccion int primary key,
linea1 varchar(150) not null,
linea2 varchar(150) not null,
codigoPostal   int not null,
idDistrito  int not null
);

-- 3 --
create table   distrito(  -- ya
idDistrito int primary key  auto_increment,
distrito varchar(50) not null,
idMunicipio int not null
);
-- 4 --
create   table municipio( -- ya estuvo
idMunicipio int  primary key auto_increment,
Municipio varchar(50) not null,
idDepartamento int  not null
);
-- 5 -- 
create table departamento(  -- ya --
idDepartamento int primary key auto_increment,
Departamento varchar (25)not null,
pais varchar (25) not null
);
-- 6 --
create table cargos ( -- ya
idCargos int primary key auto_increment,
Cargo varchar(100) not null,
descripcionCargos longtext not null

);
-- 7 --
create  table empleado( -- ya
idEmpleado int primary key auto_increment,
nombreEmpleado varchar(150) not null,
apellidoEmpleado varchar (150) not null,
DUIEmpleado int not null,
correoEmpleado varchar (150) not null,
FechaNacimientoEmpleado  date not null,
telefonoEmpleado int not null,
idCargos  int not null,
idDireccion int not null
);
-- 8 --
create table  venta( -- ya
idVenta int primary key auto_increment,
FechaVenta  date not null,
total decimal(10,0) not null,
idEmpleado int not null,
idCliente int not null

);
-- 9 --
create table distribuidor ( -- ya  
idDistribuidor int primary key auto_increment,
Distribuidor varchar(100) not null,
descripcionDistribuidor longtext not null,
idDireccion int not null 
);
-- 10 --
create  table pedidos( -- yaa
idPedidos int primary Key auto_increment,
montoPedido varchar(45) not null,
unidadespedidos  varchar(45)  not null,
fechaPedido  date  not null,
idEmpleado int not null ,
idDistribuidor  int not null

);

-- 11 --
create table  unidadMedida(  -- ya --
idUnidadMedida int  primary key auto_increment,
UnidadMedida varchar (30) not null
);

-- 12 --
create table producto( -- ya --
idProducto int primary key  auto_increment,
Producto varchar (100) not null,
descripcionProducto varchar (200) not null,
precioVenta decimal (10,0) not null,
stock int not null,
fechaCaducida date  not null,
idDistribuidor int  not null,
idUnidadMedida int not null,
idBodega int not null,
idCategoria int  not null,
idMarca int not null
);


-- 13 --
create  table   detallePedido(--  ya
idDetallePedido int primary key auto_increment,
cantidadProductoPedido  int not null,
idProducto int not null,
idPedidos int not null,
idFacturaCompra int not null
);
-- 14 --
create  table detalleVenta( -- ya
idDetalleVenta int primary key auto_increment,
cantidadProductoVenta int not null,
idProducto int not null,
idVenta int not null
);
-- 15 --
create  table bodega( -- ya
idBodega int primary key  auto_increment,
nombreBodega varchar(100) not null,
descripcion longtext not null,
capacidad  int not null,
tipoAlmacenamiento  varchar (200) not null,
fechaEntrada date not null,
fechaSalida date not null
);
-- 16 --
create table categoria (  -- ya--
idCategoria int  primary key auto_increment,
Categoria varchar (50) not  null,
descripcionCategoria longtext not null

);
-- 17 --
create table marca( -- ya
idMarca int primary key auto_increment,
Marca varchar(50) not null,
descripcionMarca longtext not null
);
-- 18 --
create table facturaCompra( -- ya
idFacturaCompra int primary key auto_increment,
numeroFacturaCompra varchar (45) not null,
montoFacturaCompra decimal  not null,
ivaFacturaCompra  decimal not null,
creditoFiscalFacturaCompra  varchar(20) not null,
idFormaPago int not null,
idDetallePedido int  not null

);
-- 19 --
create table formaPago(  -- ya--
idFormaPago int primary key auto_increment,
FormaPago varchar (150)
);
-- 20 --
create table facturaVenta( -- ya
idFacturaVenta int primary key auto_increment,
numerodeFactura varchar ( 50) not null,
MontoFacturaVenta  decimal not  null,
ivaFacturaVenta  decimal not null,
creditoFiscalFacturaVenta  varchar(20) not null,
idDetalleVenta int not null,
idFormaPago int not null   
);

-- TABLAS DE ROLES
create table roles(
	IdRol int primary key auto_increment,
    Rol varchar (50) not null
);

create table opciones(
	IdOpcion int primary key auto_increment,
    Opcion varchar(50) not null
);

create table asignacionRolesOpciones(
	IdAsignacion int primary key auto_increment,
    IdRol int not null,
    IdOpcion int not null
);

create table usuarios (
	Idusuario int primary key auto_increment,
    Usuario varchar (50) not null,
    Contrasenia varchar(50) not null,
    IdRol int not null,
    IdEmpleado int not null
);

-- LLAVES FORANEAS DE DIRECCIONES --
ALTER TABLE municipio ADD  FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento);
ALTER TABLE distrito ADD FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio);
ALTER TABLE direccion ADD FOREIGN KEY ( idDistrito) REFERENCES distrito(idDistrito);
--   llave foranea para empleado --
ALTER TABLE empleado  ADD FOREIGN KEY (idCargos) REFERENCES cargos(idCargos); 
ALTER TABLE empleado ADD FOREIGN KEY (idDireccion) REFERENCES direccion(idDireccion); 
 --  llave foranea para cliente --
ALTER TABLE cliente ADD FOREIGN KEY (idDireccion) REFERENCES direccion(idDireccion);
 -- llave foranea para venta --
ALTER TABLE venta ADD FOREIGN KEY (idCliente) REFERENCES cliente (idCliente);-- ya --


                           -- llave foranea para distribuidor --
ALTER TABLE distribuidor ADD FOREIGN KEY (idDireccion) REFERENCES direccion(idDireccion);
  -- llave foranea para producto --
ALTER TABLE producto ADD FOREIGN KEY (idDistribuidor) REFERENCES distribuidor(idDistribuidor); -- f --
ALTER TABLE producto ADD FOREIGN KEY (idUnidadMedida) REFERENCES unidadmedida (idUnidadMedida);
ALTER TABLE producto ADD FOREIGN KEY (idBodega) REFERENCES bodega(idBodega); 
ALTER TABLE producto ADD FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria);
ALTER TABLE producto ADD FOREIGN KEY (idMarca) REFERENCES marca(idMarca);
-- llave foranea  para pedidos --
ALTER TABLE pedidos ADD FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado); -- f --
ALTER TABLE pedidos ADD FOREIGN KEY (idDistribuidor) REFERENCES distribuidor(idDistribuidor);
-- llave foranea para detalleVenta --
ALTER TABLE detalleVenta ADD FOREIGN KEY (idVenta) REFERENCES venta(idVenta); 
ALTER TABLE detalleVenta ADD FOREIGN KEY (idProducto) REFERENCES producto(idProducto);
-- llave foranea para  factura compra  ya--
ALTER TABLE facturaCompra ADD FOREIGN KEY (idFormaPago) REFERENCES formaPago(idFormaPago);


           -- llaveforanea para detallepedido --
ALTER TABLE detallePedido ADD FOREIGN KEY (idProducto) REFERENCES producto(idProducto);
ALTER TABLE detallePedido ADD FOREIGN KEY (idPedidos) REFERENCES pedidos(idPedidos); -- f --
ALTER TABLE detallePedido ADD FOREIGN KEY (idFacturaCompra) REFERENCES facturaCompra (idFacturaCompra);
  -- llave foranea facturaventa ya --
ALTER TABLE facturaVenta ADD FOREIGN KEY (idDetalleVenta) REFERENCES detalleVenta (idDetalleVenta);
ALTER TABLE facturaVenta ADD FOREIGN KEY (idFormaPago) REFERENCES formaPago(idFormaPago);
alter table asignacionRolesOpciones add foreign key (IdRol) references roles(IdRol);
alter table asignacionRolesOpciones add foreign key (IdOpcion) references opciones(IdOpcion);

alter table usuarios add foreign key (IdRol) references roles(IdRol);
alter table usuarios add foreign key (IdEmpleado) references empleados(IdEmpleado);


