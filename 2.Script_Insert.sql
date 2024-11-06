--Insert Datos de prueba
INSERT INTO Permission (PermissionID, PermissionName) VALUES 
(1, 'Leer'), 
(2, 'Escribir'), 
(3, 'Eliminar');

----****Asignar Permisos a Usuarios y Roles a Nivel de Entidad****-------
-------------------------------------------------------------------------
-- Asignar al Usuario 1 permisos de lectura en la Sucursal 1
INSERT INTO PermiUser (UserID, EntityID, PermissionID) VALUES (1, 1, 1);

-- Asignar al Rol 1 permisos de escritura en el Centro de Costos 2
INSERT INTO PermiRole (RoleID, EntityID, PermissionID) VALUES (1, 2, 2);
-------------------------------------------------------------------------



----****Asignar Permisos a Usuarios y Roles a Nivel de Registro Individual****----
----------------------------------------------------------------------------------
-- Asignar al Usuario 1 permisos de eliminación en el registro 101 de la Sucursal
INSERT INTO PermiUserRecord (UserID, RecordID, PermissionID) VALUES (1, 101, 3);


-- Asignar al Rol 1 permisos de lectura en el registro 202 del Centro de Costos
INSERT INTO PermiRoleRecord (RoleID, RecordID, PermissionID) VALUES (1, 202, 1);
----------------------------------------------------------------------------------