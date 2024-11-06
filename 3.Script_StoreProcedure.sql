-- SP toma como parámetros @EntityID (la entidad a la cual queremos consultar permisos) 
-- y @UserID (el ID del usuario para quien queremos consultar los permisos) y devuelve 
-- una lista de permisos tanto a nivel de entidad como de registro individual.

CREATE PROCEDURE GetUserPermissions
    @EntityID INT,
    @UserID INT
AS
BEGIN
    -- Obtener permisos a nivel de entidad asignados directamente al usuario
    SELECT 'Entidad' AS Scope, P.PermissionName
    FROM PermiUser PU
    JOIN Permission P ON PU.PermissionID = P.PermissionID
    WHERE PU.EntityID = @EntityID AND PU.UserID = @UserID

    UNION

    -- Obtener permisos a nivel de entidad asignados al usuario a través de roles
    SELECT 'Entidad' AS Scope, P.PermissionName
    FROM PermiRole PR
    JOIN Permission P ON PR.PermissionID = P.PermissionID
    WHERE PR.EntityID = @EntityID 
      AND EXISTS (SELECT 1 FROM PermiUser WHERE UserID = @UserID AND RoleID = PR.RoleID)

    UNION

    -- Obtener permisos a nivel de registro individual asignados directamente al usuario
    SELECT 'Registro' AS Scope, P.PermissionName
    FROM PermiUserRecord PUR
    JOIN Permission P ON PUR.PermissionID = P.PermissionID
    WHERE PUR.UserID = @UserID

    UNION

    -- Obtener permisos a nivel de registro individual asignados al usuario a través de roles
    SELECT 'Registro' AS Scope, P.PermissionName
    FROM PermiRoleRecord PRR
    JOIN Permission P ON PRR.PermissionID = P.PermissionID
    WHERE EXISTS (SELECT 1 FROM PermiUser WHERE UserID = @UserID AND RoleID = PRR.RoleID);

END;
