--[[
    Made by Wild wide
    Synapse X library fixed and better than the original.
    
    syn.protect_gui breaks scripts but this one doesn't and it's safer than many okay?

    docs: https://synapsedocs.vercel.app/reference/namespace/syn.html
]]

local Syn = {}

function sec_run(f, scriptInstance, ...)
    assert(type(f) == "function", "Argument #1 must be a function")
    assert(typeof(scriptInstance) == "Instance", "Argument #2 must be a script")
    assert(scriptInstance.ClassName == "ModuleScript" or scriptInstance.ClassName == "LocalScript",
        "Argument #2 must be ModuleScript or LocalScript"
    )

    local callArgs = {...}
    local oldScript = getgenv().script

    return coroutine.wrap(function()
        getgenv().script = scriptInstance

        local cloned = clonefunction(f)
        local fenv = getfenv(cloned)
        local senv = getsenv(scriptInstance)

        if not senv then
            senv = {}
            for _, v in pairs(getgc()) do
                if type(v) == "function" then
                    local env = getfenv(v)
                    if env.script == scriptInstance then
                        senv = env
                        break
                    end
                end
            end
        end

        local default_env = getfenv(0)
        for k, v in pairs(default_env) do
            if rawget(senv, k) == nil then
                senv[k] = v
            end
        end

        senv.script = scriptInstance

        setfenv(cloned, senv)

        local return_values = {cloned(table.unpack(callArgs))}

        getgenv().script = oldScript

        return table.unpack(return_values)
    end)()
end

local protected_guis = {}
function Protect_gui(gui)
    assert(typeof(gui) == "Instance", "Invalid argument #1 (Instance expected, got " .. typeof(gui) .. ")")
    assert(gui.ClassName == "ScreenGui", "Invalid argument #1 (ScreenGui expected, got " .. gui.ClassName .. ")")

    if table.find(protected_guis, gui) then return end
    
    local NamecallInstanceDetector = nil

    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and type(rawget(v, "IndexInstance")) == "table" and rawget(v, "IndexInstance")[1] == "kick" then
            if type(v.tvk) == "table" and type(v.tvk[2]) == "function" then
                v.tvk = {"kick", function(...) return nil end}
                hookfunction(v.tvk[2], newcclosure(function(...) return nil end))
            end
        end
        
        if typeof(v) ~= "table" then continue end
        if not rawget(v, "namecallInstance") then continue end

        for Si, Sct in pairs(v) do
            if typeof(Sct) ~= "table" then continue end
            for Ti, Upvs in pairs(Sct) do
                if Sct[Ti] ~= "kick" then continue end
                if typeof(Sct[Ti + 1]) ~= "function" then continue end

                local detected = Sct[Ti+ 1]
                for _, identifier in pairs(getconstants(detected)) do
                    if identifier == "namecallInstance" then
                        NamecallInstanceDetector = detected
                    end
                end
            end
        end
    end

    if NamecallInstanceDetector then
        hookfunction(NamecallInstanceDetector, newcclosure(function(...) return false end))
    end

    if not table.find(protected_guis, gui) then
        table.insert(protected_guis, gui)
    end

    gui.Parent = gethui()
end

function Unprotect_gui(gui)
    assert(typeof(gui) == "Instance", "Invalid argument #1 (Instance expected, got " .. typeof(gui) .. ")")
    assert(gui.ClassName == "ScreenGui", "Invalid argument #1 (ScreenGui expected, got " .. gui.ClassName .. ")")
    
    if table.find(protected_guis, gui) then
        for i, v in pairs(protected_guis) do
            if v == gui then
                table.remove(protected_guis, i)
            end
        end
    end
end

function Request(a)
    local rqst = getgenv().request(a)
    if rqst.Headers then
        rqst.Headers["User-Agent"] = "sx/v1.0.0"
    end
    return rqst
end

Syn.secure_call = newcclosure(sec_run)
Syn.emulate_call = Syn.secure_call
Syn.protect_gui = newcclosure(Protect_gui)
Syn.unprotect_gui = newcclosure(Unprotect_gui)
Syn.get_thread_identity = getgenv().getthreadidentity
Syn.set_thread_identity = getgenv().setthreadidentity
Syn.queue_on_teleport = getgenv().queue_on_teleport
Syn.clear_teleport_queue = getgenv().clear_teleport_queue
Syn.request = newcclosure(Request)
Syn.run_on_actor = getgenv().run_on_actor

Syn.oth = {
    hook = getgenv().hookfunction,
    unhook = getgenv().restorefunction
}

if getgenv().Crypt then
    Syn.crypt = getgenv().Crypt
end

setreadonly(Syn, true)

getgenv().syn = Syn
