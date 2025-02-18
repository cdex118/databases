-- Create table for Clients
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('Empresa', 'Persona') NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Contacto VARCHAR(255), 
    Email VARCHAR(255) UNIQUE NOT NULL,
    Teléfono VARCHAR(20),
    Dirección TEXT
);

-- Create table for Services
CREATE TABLE Servicios (
    ServicioID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10,2) NOT NULL
);

-- Create table for Contracts
CREATE TABLE Contrataciones (
    ContrataciónID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    ServicioID INT NOT NULL,
    FechaContratación DATE NOT NULL,
    Estado ENUM('Pendiente', 'En curso', 'Completado', 'Cancelado') DEFAULT 'Pendiente',
    Notas TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID) ON DELETE CASCADE,
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID) ON DELETE CASCADE
);

-- Create table for Payments
CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY AUTO_INCREMENT,
    ContrataciónID INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    FechaPago DATE NOT NULL,
    MétodoPago ENUM('Transferencia', 'Tarjeta', 'PayPal', 'Efectivo') NOT NULL,
    Estado ENUM('Pagado', 'Pendiente', 'Rechazado') DEFAULT 'Pendiente',
    FOREIGN KEY (ContrataciónID) REFERENCES Contrataciones(ContrataciónID) ON DELETE CASCADE
);

-- Create table for Employees
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Cargo VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Teléfono VARCHAR(20)
);

-- Create table for Assignments
CREATE TABLE Asignaciones (
    AsignaciónID INT PRIMARY KEY AUTO_INCREMENT,
    EmpleadoID INT NOT NULL,
    ContrataciónID INT NOT NULL,
    FechaAsignación DATE NOT NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID) ON DELETE CASCADE,
    FOREIGN KEY (ContrataciónID) REFERENCES Contrataciones(ContrataciónID) ON DELETE CASCADE
);

-- Create table for Reports
CREATE TABLE Informes (
    InformeID INT PRIMARY KEY AUTO_INCREMENT,
    ContrataciónID INT NOT NULL,
    FechaEntrega DATE NOT NULL,
    Resumen TEXT,
    ArchivoURL VARCHAR(500),
    FOREIGN KEY (ContrataciónID) REFERENCES Contrataciones(ContrataciónID) ON DELETE CASCADE
);
INSERT INTO Clientes (Tipo, Nombre, Contacto, Email, Teléfono, Dirección) VALUES ('Empresa', 'TechSolutions S.A.', 'Juan Pérez', 'contacto@techsolutions.com', '123456789', 'Calle Ficticia 123, Ciudad A'), ('Persona', 'María López', NULL, 'maria.lopez@email.com', '987654321', 'Calle Real 456, Ciudad B');

INSERT INTO Servicios (Nombre, Descripción, Precio) VALUES ('Pentesting', 'Prueba de penetración de sistemas informáticos para detectar vulnerabilidades.', 1500.00), ('Administración de redes', 'Gestión y mantenimiento de redes de comunicación de datos.', 1200.00), ('Jailbreak', 'Desbloqueo de dispositivos para obtener acceso completo al sistema.', 800.00);

INSERT INTO Servicios (Nombre, Descripción, Precio) VALUES  ('Pentesting', 'Prueba de penetración de sistemas informáticos para detectar vulnerabilidades.', 1500.00), ('Administración de redes', 'Gestión y mantenimiento de redes de comunicación de datos.', 1200.00), ('Jailbreak', 'Desbloqueo de dispositivos para obtener acceso completo al sistema.', 800.00);

INSERT INTO Contrataciones (ClienteID, ServicioID, FechaContratación, Estado, Notas) VALUES (1, 1, '2025-02-17', 'Pendiente', 'Contratación de pentesting para revisar vulnerabilidades del sistema'), (2, 2, '2025-02-10', 'Completado', 'Mantenimiento de redes y servidores de la empresa');

INSERT INTO Pagos (ContrataciónID, Monto, FechaPago, MétodoPago, Estado) VALUES (1, 1500.00, '2025-02-17', 'Transferencia', 'Pagado'),(2, 1200.00, '2025-02-12', 'Tarjeta', 'Pagado');


INSERT INTO Empleados (Nombre, Cargo, Email, Teléfono) VALUES ('Carlos Méndez', 'Especialista en seguridad informática', 'carlos.mendez@empresa.com', '321654987'),('Ana Gómez', 'Administradora de redes', 'ana.gomez@empresa.com', '456987123');

INSERT INTO Asignaciones (EmpleadoID, ContrataciónID, FechaAsignación) VALUES (1, 1, '2025-02-17'), (2, 2, '2025-02-10');


INSERT INTO Informes (ContrataciónID, FechaEntrega, Resumen, ArchivoURL) VALUES (1, '2025-02-20', 'Informe detallado de las vulnerabilidades detectadas en el sistema.', 'http://informe.com/informe1.pdf'),(2, '2025-02-15', 'Informe de mantenimiento de redes y optimización realizada.', 'http://informe.com/informe2.pdf');

select * from Clientes, Servicios, Contrataciones,Pagos,Empleados, Asignaciones;
 
