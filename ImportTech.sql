CREATE DATABASE ImportTech;
USE ImportTech;

/* Create proveedores table */
CREATE TABLE proveedores(
	NIP INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    web VARCHAR(200),
    telefono VARCHAR(10) NOT NULL,
    PRIMARY KEY(NIP)
);

/* Create categorias table */
CREATE TABLE categorias(
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT(300) NOT NULL,
    PRIMARY KEY(id_categoria)
);

/* Create productos table */
CREATE TABLE productos(
	id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    stock INT NOT NULL,
    precio DOUBLE NOT NULL,
    PRIMARY KEY(id_producto)
);

/* Foreign keys for producto_proveedor */
ALTER TABLE productos ADD proveedor_NIP INT NOT NULL;
ALTER TABLE productos ADD CONSTRAINT fk_producto_proveedor
			FOREIGN KEY(proveedor_NIP) REFERENCES proveedores(NIP);
/* Foreign key for producto_categoria */
ALTER TABLE productos ADD categoria_id INT NOT NULL;
ALTER TABLE productos ADD CONSTRAINT fk_producto_categoria
			FOREIGN KEY(categoria_id) REFERENCES categorias(id_categoria);

/* Create direcciones table */
CREATE TABLE direcciones(
	id_direccion INT NOT NULL AUTO_INCREMENT,
    ciudad VARCHAR(45) NOT NULL,
    comuna VARCHAR(45) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    calle VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_direccion)
);

/* Create clientes table */
CREATE TABLE clientes(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY(id_cliente)
);

/* Foreign key for cliente_direccion */
ALTER TABLE clientes ADD direccion_id INT NOT NULL;
ALTER TABLE clientes ADD CONSTRAINT fk_cliente_direccion
			FOREIGN KEY(direccion_id) REFERENCES direcciones(id_direccion);
ALTER TABLE clientes ADD CONSTRAINT uk_cliente_direccion
			UNIQUE(direccion_id);

/* Create telefonos table */
CREATE TABLE telefonos(
	id_telefono INT NOT NULL AUTO_INCREMENT,
    telefono VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_telefono)
);

/* Foreign key for cliente_telefonos */
ALTER TABLE telefonos ADD cliente_id INT NOT NULL;
ALTER TABLE telefonos ADD CONSTRAINT fk_telefono_cliente
			FOREIGN KEY(cliente_id) REFERENCES clientes(id_cliente);

/* Create ventas table */
CREATE TABLE ventas(
	num_factura INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    cantidad_unidades INT NOT NULL,
    precio_unidad DOUBLE,
    descuento FLOAT NOT NULL,
    monto_total DOUBLE,
    monto_final DOUBLE,
    PRIMARY KEY(num_factura)
);

/* Foreign key for venta_producto */
ALTER TABLE ventas ADD producto_id INT NOT NULL;
ALTER TABLE ventas ADD CONSTRAINT fk_venta_producto
			FOREIGN KEY(producto_id) REFERENCES productos(id_producto);
/* Foreign key for venta_producto */            
ALTER TABLE ventas ADD cliente_id INT NOT NULL;
ALTER TABLE ventas ADD CONSTRAINT fk_venta_cliente
			FOREIGN KEY(cliente_id) REFERENCES clientes(id_cliente);
            
            
/* Add information */
INSERT INTO proveedores(nombre, web, telefono)
		VALUES ('Samsung', 'www.samsung.com', '1234567'),
				('Asus', 'www.Asus.com', '2345678'),
                ('Hp', 'www.Hp.com', '3456789'),
                ('Acer', 'www.Acer.com', '4567890'),
                ('Apple', 'www.Apple.com', '0123456'),
                ('Pictek', 'www.pictek.com', '3918264'),
				('Redragon', 'www.redragon.com', '6473819'),
                ('AMD', 'www.amd.com', '6723567'),
				('Intel', 'www.intel.com', '1628463');

INSERT INTO categorias(nombre, descripcion)
		VALUES ('Smartphones', 'Todo tipo de celulares inteligentes'),
				('Portátiles', 'Todo tipo de computadores portátiles'),
                ('Torres', 'CPUs de todas las gamas'),
				('Componentes', 'Todo tipo de componentes para computadores'),
                ('Tablets', 'Tablets de todas las marcas y gamas'),
                ('Periféricos', 'Teclados, mouses, monitores, headphones, cámaras'),
                ('Accesorios', 'Todo tipo de accesorios para móviles, tablets y computadores');

INSERT INTO productos(nombre, stock, precio, proveedor_NIP, categoria_id)
			VALUES ('Samsung Galaxy A25', 14, 650000, 1, 1),
					('Asus Vivobook 14', 9, 1750000, 2, 2),
                    ('iPhone 13 pro', 11, 5150000, 5, 1),
                    ('Procesador Ryzen 5', 6, 1100000, 6, 4),
                    ('Procesador Intel i9 11th', 6, 1900000, 7, 4),
                    ('Mouse Pictek PC330A-1', 9, 85000, 8, 6),
                    ('Teclado Pictek PC330A', 7, 125000, 8, 6),
                    ('Mouse Redragon', 6, 75000, 9, 6),
                    ('Teclado Redragon', 5, 135000, 9, 6);
                    
INSERT INTO direcciones(ciudad, comuna, numero, calle)
			VALUES ('Medellín', 'Poblado', '25', '12d'),
					('Sabaneta', 'Aves María', '13', '10d'),
                    ('Medellín', 'Laureles', '103', '29d'),
                    ('Itagüí', 'La Esmeralda', '87', '52d'),
                    ('Medellín', 'Belén', '121', '71d'),
                    ('Bello', 'Madera', '73', '23d'),
                    ('Medellín', 'Los colores', '9', '16d');
                    
INSERT INTO clientes(nombre, direccion_id)
			VALUES ('Alexander Bedoya', 2),
					('Camilo Perez', 1),
                    ('Luisa Pineda', 3),
                    ('María Durango', 7),
                    ('Tomas Marín', 5),
                    ('Andrea Giraldo', 6),
                    ('Santiago Sánchez', 4);
     
INSERT INTO telefonos(telefono, cliente_id)
			VALUES ('0987654', 1),
					('9876543', 2),
                    ('8765432', 3),
                    ('7654321', 4),
                    ('6543210', 5),
                    ('5432109', 6),
                    ('4321098', 7),
                    ('1834726', 3),
                    ('9846388', 1);

INSERT INTO ventas(fecha, cantidad_unidades, precio_unidad, descuento, monto_total, monto_final, producto_id, cliente_id)
			VALUES ('2022-10-25 00:00:00', 4, 85000, 0.15,  340000, 289000, 6, 2),
					('2022-10-25 00:00:00', 1, 1750000, 0, 1750000, 1750000, 2, 3),
                    ('2022-10-26 00:00:00', 3, 1100000, 0.10, 3300000, 2970000, 4, 1);