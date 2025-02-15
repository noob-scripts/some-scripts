-- Made by Wild -> Wide
-- script: Synapse X library

function load_url(url)
    return loadstring(game:HttpGet("https://github.com/" .. url .. "?raw=true"))()
end

local not_implemented = newcclosure(function(...) end)

local protections = load_url("zzerexx/scripts/blob/main/SynapseFunctions/protect_gui.lua")
local setthread = setidentity or set_thread_identity or setthreadidentity
local getthread = getidentity or get_thread_identity or getthreadidentity

function secure_call(f, s, ...)
    assert(type(f) == "function", `Invalid argument #1 (function expected, got {typeof(f)})`)
    assert(typeof(s) == "Instance", `invalid argument #2 (Instance expected, got {typeof(s)})`)

    local class = s.ClassName == "LocalScript" or s.ClassName == "ModuleScript"
    assert(class, `Invalid argument #2 (LocalScript/ModuleScript expected, got {s.ClassName})`)

    local old_s = script
    local old_identity = getthread()

    getgenv().script = s
    setthread(2)

    local r = coroutine.wrap(function(...)
        local old_fenv0 = getfenv(0)
        local old_fenv1 = getfenv(1)
       
        setfenv(0, getsenv(s))
        setfenv(1, getsenv(s))

        coroutine.yield(f(...))

        setfenv(0, old_fenv0)
        setfenv(1, old_fenv1)
    end)

    getgenv().script = old_s
    setthread(old_identity)

    return r(...)
end

function trampoline_call(f, call_stack, thread_options, ...)
    local t = thread_options.thread or nil
    local env = thread_options.env or nil
    local s = thread_options.script
    local identity = thread_options.identity or 2

    if env then
        for i, v in pairs(call_stack) do
            if v.func and type(v.func) == "function" then
                setfenv(v.func, v.env or env)
            end
        end

        setfenv(t, env)
    end

    local old_s = script
    local old_identity = getthread()

    getgenv().script = s
    setthread(identity)

    local r = coroutine.wrap(function(...)
         local old_fenv0 = getfenv(0)
         local old_fenv1 = getfenv(1)

         setfenv(0, getsenv(s))
         setfenv(1, getsenv(s))

         coroutine.yield(f(...))

         setfenv(0, old_fenv0)
         setfenv(1, old_fenv1)
    end)

    getgenv().script = old_s
    setthread(old_identity)

    return r(...)
end

function run_on_actor(actor, source) -- bad
    local s = script.Parent

    script.Parent = actor

    loadstring(source)()

    script.Parent = s
end

if not crypt then
    load_url("noob-scripts/some-scripts/blob/master/crypt_lib.lua")
end

local rqst = (http and http.request) or http_request or request
getgenv().syn = {
    secure_call = secure_call,
    emulate_call = secure_call,
    trampoline_call = trampoline_call,
    protect_gui = protections["protect_gui"],
    unprotect_gui = protections["unprotect_gui"],
    set_thread_identity = setthread,
    get_thread_identity = getthread,
    toast_notification = not_implemented,
    run_on_actor = run_on_actor,
    ipc_send = not_implemented,
    request = rqst,
    queue_on_teleport = not_implemented,
    clear_teleport_queue = not_implemented,
    on_actor_state_created = not_implemented,
    filtergc = not_implemented,
    crypt = crypt,
    oth = {
        hook = hookfunction,
        unhook = restorefunction,
        hookmetamethod = hookmetamethod, -- not official but i added it cuz yes
        get_original_thread = not_implemented,
        is_hook_thread = not_implemented,
        get_root_callback = not_implemented
    },
    websocket = WebSocket
}

for i, v in pairs(syn) do
    getgenv()[i] = v
end
