CREATE DATABASE sistema_permisosV2;
USE sistema_permisosV2;

--Esta tabla define los tipos de permisos que se pueden otorgar, como Leer, Escribir, y Eliminar.
CREATE TABLE Permission (
    PermissionID INT PRIMARY KEY,
    PermissionName VARCHAR(50) NOT NULL
);

--Esta tabla asigna permisos a usuarios específicos a nivel de entidad, como una sucursal completa o un centro de costos completo.
CREATE TABLE PermiUser (
    UserID INT,
    EntityID INT,
    PermissionID INT,
    PRIMARY KEY (UserID, EntityID, PermissionID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);

--Esta tabla gestiona los permisos asignados a roles a nivel de entidad completa.
CREATE TABLE PermiRole (
    RoleID INT,
    EntityID INT,
    PermissionID INT,
    PRIMARY KEY (RoleID, EntityID, PermissionID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);

--Esta tabla permite asignar permisos a usuarios sobre registros específicos dentro de una entidad.
CREATE TABLE PermiUserRecord (
    UserID INT,
    RecordID INT,
    PermissionID INT,
    PRIMARY KEY (UserID, RecordID, PermissionID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);

--Esta tabla permite asignar permisos a roles sobre registros específicos dentro de una entidad.
CREATE TABLE PermiRoleRecord (
    RoleID INT,
    RecordID INT,
    PermissionID INT,
    PRIMARY KEY (RoleID, RecordID, PermissionID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);
