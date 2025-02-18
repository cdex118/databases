SELECT 
    c.ClienteID, 
    c.Nombre AS Cliente, 
    s.ServicioID, 
    s.Nombre AS Servicio, 
    con.FechaContratación, 
    con.Estado
FROM Contrataciones con
JOIN Clientes c ON con.ClienteID = c.ClienteID
JOIN Servicios s ON con.ServicioID = s.ServicioID
ORDER BY con.FechaContratación DESC;




SELECT 
    c.ClienteID, 
    c.Nombre AS Cliente, 
    con.ContrataciónID, 
    s.Nombre AS Servicio, 
    con.FechaContratación, 
    con.Estado AS EstadoContrato, 
    p.PagoID, 
    p.Monto, 
    p.FechaPago, 
    p.MétodoPago, 
    p.Estado AS EstadoPago
FROM Pagos p
JOIN Contrataciones con ON p.ContrataciónID = con.ContrataciónID
JOIN Clientes c ON con.ClienteID = c.ClienteID
JOIN Servicios s ON con.ServicioID = s.ServicioID
ORDER BY p.FechaPago DESC;







SELECT 
    e.EmpleadoID, 
    e.Nombre AS Empleado, 
    e.Cargo, 
    a.AsignaciónID, 
    con.ContrataciónID, 
    cli.Nombre AS Cliente, 
    s.Nombre AS Servicio, 
    con.FechaContratación, 
    a.FechaAsignación
FROM Asignaciones a
JOIN Empleados e ON a.EmpleadoID = e.EmpleadoID
JOIN Contrataciones con ON a.ContrataciónID = con.ContrataciónID
JOIN Clientes cli ON con.ClienteID = cli.ClienteID
JOIN Servicios s ON con.ServicioID = s.ServicioID
ORDER BY a.FechaAsignación DESC;





SELECT 
    con.ContrataciónID, 
    cli.Nombre AS Cliente, 
    s.Nombre AS Servicio, 
    con.FechaContratación, 
    con.Estado, 
    con.Notas
FROM Contrataciones con
JOIN Clientes cli ON con.ClienteID = cli.ClienteID
JOIN Servicios s ON con.ServicioID = s.ServicioID
WHERE con.Estado = 'En curso'
ORDER BY con.FechaContratación DESC;







SELECT 
    con.ContrataciónID, 
    cli.Nombre AS Cliente, 
    s.Nombre AS Servicio, 
    con.FechaContratación, 
    con.Estado, 
    con.Notas
FROM Contrataciones con
JOIN Clientes cli ON con.ClienteID = cli.ClienteID
JOIN Servicios s ON con.ServicioID = s.ServicioID
LEFT JOIN Informes inf ON con.ContrataciónID = inf.ContrataciónID
WHERE inf.InformeID IS NULL
ORDER BY con.FechaContratación DESC;





SELECT 
    e.EmpleadoID, 
    e.Nombre AS Empleado, 
    COUNT(a.AsignaciónID) AS Cantidad_Contratos
FROM Empleados e
LEFT JOIN Asignaciones a ON e.EmpleadoID = a.EmpleadoID
GROUP BY e.EmpleadoID, e.Nombre
ORDER BY Cantidad_Contratos DESC;
