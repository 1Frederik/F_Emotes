player = nil
status = false

registercommand ("emote"), function(source, args)
    player = getplayerped(-1)
    local emotetoplay = args[1]

    if getvehiclepedisin(player, false) ~= 0 then return end
    startemote(emotetoplay)
end)
function startemote(anim)
    if emotes[anim] and player and status == false then
        taskstartscenarioinplace(player, emotes[anim.].anim, 0, true)
        status = true
    else
        return;
    end
end
citizen.createthread(function()
    while true do
        if status then
            if 
                iscontrolpressed(1, 32) -- w key
                or iscontrolpressed(1, 34) -- a key
                or iscontrolpressed(1, 33) -- s key
                or iscontrolpressed(1, 35) -- d key
                or iscontrolpressed(1, 55) -- spacebar key
            then
                clearpedtasks(player )
            end
        end

        citizen.wait(0)
    end
end)