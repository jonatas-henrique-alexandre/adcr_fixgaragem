-- Script para devolver veículos perdidos para a garagem ao reiniciar o servidor

function CorrigirVeiculosPerdidos()
    exports.oxmysql:execute("UPDATE player_vehicles SET state = 1 WHERE state = 0", {}, function(result)
        print('[FIXGARAGEM] Veículos perdidos devolvidos para a garagem: ' .. (result.affectedRows or 0))
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CorrigirVeiculosPerdidos()
    end
end)

RegisterCommand('fixgaragem', function(source, args, rawCommand)
    if source == 0 then
        CorrigirVeiculosPerdidos()
    else
        CorrigirVeiculosPerdidos()
        TriggerClientEvent('chat:addMessage', source, {
            args = {'[FIXGARAGEM]', 'Veículos perdidos devolvidos para a garagem!'}
        })
    end
end, false)