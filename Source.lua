-- 1. PASTE YOUR RAW GITHUB LINKS HERE:
local KeyOnlineURL = "https://githubusercontent.com" 
local YourRingtaScriptURL = "PASTE_YOUR_RAW_SOURCE_LUA_LINK_HERE" -- Replace this next!

-- 2. FETCH THE KEY FROM GITHUB:
local CorrectKey = "ErrorLoadingKey"
pcall(function()
    CorrectKey = game:HttpGet(KeyOnlineURL):gsub("%s+", "") -- Cleans up spaces and newlines
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

-- 3. THE LOCK SYSTEM WINDOW:
local Window = Rayfield:CreateWindow({
   Name = "RINGTA SYSTEM INTEGRATION",
   LoadingTitle = "Checking Key Validity...",
   LoadingSubtitle = "by Ringta Team",
   ConfigurationSaving = { Enabled = false },
   KeySystem = true, 
   Title = "Ringta Key Verification",
   Subtitle = "Get your daily access key",
   Note = "Keys change regularly!",
   FileName = "RingtaKeyCache", 
   SaveKey = true, 
   GrabKeyFromUrl = false, 
   Key = {CorrectKey} 
})

-- 4. SUCCESS WINDOW (Only opens if key is correct):
local UnlockedTab = Window:CreateTab("Access Granted", 4483362458)
UnlockedTab:CreateLabel("Key verified successfully!")

UnlockedTab:CreateButton({
   Name = "Click to Copy Key Link",
   Callback = function()
       setclipboard("https://linkvertise.com") -- Paste your monetization link here
       Rayfield:Notify({
           Title = "Link Copied!",
           Content = "Paste it into your browser to complete tasks and get the key.",
           Duration = 4
       })
   end,
})

-- 5. RUNS YOUR RINGTA SCRIPT AUTOMATICALLY:
Rayfield:Notify({
    Title = "Loading Ringta Hub",
    Content = "Fetching the latest script version...",
    Duration = 5
})

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet(YourRingtaScriptURL))() -- This runs your main cheat script
    end)
end)
