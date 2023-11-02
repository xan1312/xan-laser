function Createlaser(coords1, coords2, dist)
    local startcoords = coords1
    local endcoords2 = coords2

    local playerCoords = GetEntityCoords(PlayerPedId())


    local distance = Vdist(startcoords.x, startcoords.y, startcoords.z, playerCoords.x, playerCoords.y, playerCoords.z)

    if distance <= 100.0 then
        DrawLine(startcoords.x, startcoords.y, startcoords.z, endcoords2.x, endcoords2.y, endcoords2.z, 255, 0, 0, 255)
        DrawLine(startcoords.x, startcoords.y, startcoords.z - 0.5, endcoords2.x, endcoords2.y, endcoords2.z - 0.5, 255,
            0, 0, 255)
        DrawLine(startcoords.x, startcoords.y, startcoords.z + 0.5, endcoords2.x, endcoords2.y, endcoords2.z + 0.5, 255,
            0, 0, 255)
        DrawLine(startcoords.x, startcoords.y, startcoords.z + 1, endcoords2.x, endcoords2.y, endcoords2.z + 1, 255, 0, 0,
            255)
    end

    local distancePlayerToLine = CalculateDistanceBetweenPlayerToLine(playerCoords, startcoords, endcoords2)


    if distancePlayerToLine < dist then
        return true
    end
end

function CalculateDistanceBetweenPlayerToLine(point, line1, line2)
    local A = point - line1
    local B = line2 - line1
    local t = (A.x * B.x + A.y * B.y + A.z * B.z) / (B.x * B.x + B.y * B.y + B.z * B.z)

    if t < 0.0 then
        return Vdist(point.x, point.y, point.z, line1.x, line1.y, line1.z)
    else
        local shittttttttttty = line1 + (B * t)
        return Vdist(point.x, point.y, point.z, shittttttttttty.x, shittttttttttty.y, shittttttttttty.z)
    end
end

exports('Laser', Createlaser)
