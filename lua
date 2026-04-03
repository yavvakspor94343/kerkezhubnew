-- [[ KERKEZ HUB V9.0 - GLOBAL EDITION ]] --
-- Created by Antigravity for USER
local function getService(name)
    local success, service = pcall(function()
        return game:GetService(name)
    end)
    return success and service or nil
end
local TweenService = getService("TweenService")
local UserInputService = getService("UserInputService")
local CoreGui = getService("CoreGui")
local Players = getService("Players")
local RunService = getService("RunService")
local StarterGui = getService("StarterGui")
-- AUTH CONFIG
local SCRIPT_KEY = "kerkez_key_88" -- Your New Key
local AUTH_LINK = "https://work.ink/2tcW/kerkez-hub-key-system-11"
-- HUB STATE
local SelectedLanguage = "EN"
local InfJumpEnabled = false
local AutoBrainrotEnabled = false
local NoclipEnabled = false
local BatAuraEnabled = false
local TargetWalkSpeed = 16
local SelectedPlayer = nil
local ESPData = {}
local LoopFollowEnabled = false
-- [[ LOCALIZATION TABLE ]] --
local L = {}
L["TR"] = {
    LANG_TITLE = "DİL SEÇİMİ",
    LOGIN_TITLE = "KERKEZ HUB - GİRİŞ",
    KEY_HINT = "Anahtarı Buraya Girin...",
    GET_KEY = "ANAHTAR AL",
    VERIFY = "DOĞRULA",
    STATUS_WAIT = "Lütfen Anahtarı Girin.",
    STATUS_WRONG = "Hatalı Anahtar! Tekrar Deneyin.",
    STATUS_CORRECT = "Doğrulama Başarılı!",
    STATUS_COPY = "Link Panoya Kopyalandı!",
    NOTIFY_AUTH = "Reklamlı link kopyalandı!",
    NOTIFY_SUCCESS = "Hesap Doğrulandı, HUB Açılıyor...",
    HUB_TITLE = "KERKEZ HUB V9.0",
    P_CMD = "OYUNCU KOMUTLARI",
    HEDEF = "HEDEF: ",
    HEDEF_NONE = "SECILMEDI",
    BTN_LAVA = "Vadiyi Temizle (Lava)",
    BTN_VIP = "VIP Kapıları Bypass",
    BTN_BRAIN = "Oto-Brainrot (Tak-Tak)",
    BTN_JUMP = "Sınırsız Zıplama (Bypass)",
    BTN_NOCLIP = "Duvarlardan Geç (Noclip)",
    BTN_BAT = "Sopa Otomatiği (Toxic)",
    BTN_SPD = "Hızı Uygula",
    ESP_OFF = "DETAYLI ESP: KAPALI",
    ESP_ON = "DETAYLI ESP: ACIK",
    TP_BTN = "OYUNCUYA ISINLAN",
    LOOP_OFF = "TOKSIK TAKIP: KAPALI",
    LOOP_ON = "TOKSIK TAKIP: ACIK",
    ESP_ALL = "HERKESI ISARETLE",
    ESP_INFO = "HP: %d | MESAFE: %d",
    CMD_READY = "Sunucu Isaretlendi!"
}
L["EN"] = {
    LANG_TITLE = "LANGUAGE CHOICE",
    LOGIN_TITLE = "KERKEZ HUB - LOGIN",
    KEY_HINT = "Enter Key Here...",
    GET_KEY = "GET KEY",
    VERIFY = "VERIFY",
    STATUS_WAIT = "Please enter the key.",
    STATUS_WRONG = "Wrong Key! Try again.",
    STATUS_CORRECT = "Verification Successful!",
    STATUS_COPY = "Link Copied to Clipboard!",
    NOTIFY_AUTH = "Monetized link copied!",
    NOTIFY_SUCCESS = "Auth Success, HUB Loading...",
    HUB_TITLE = "KERKEZ HUB V9.0",
    P_CMD = "PLAYER COMMANDS",
    HEDEF = "TARGET: ",
    HEDEF_NONE = "NONE",
    BTN_LAVA = "Clear Valley (Lava)",
    BTN_VIP = "VIP Doors Bypass",
    BTN_BRAIN = "Auto-Brainrot (Tak-Tak)",
    BTN_JUMP = "Infinite Jump (Bypass)",
    BTN_NOCLIP = "Ghost Mode (Noclip)",
    BTN_BAT = "Bat-Aura (Toxic)",
    BTN_SPD = "Apply Speed",
    ESP_OFF = "DETAILED ESP: OFF",
    ESP_ON = "DETAILED ESP: ON",
    TP_BTN = "TELEPORT TO PLAYER",
    LOOP_OFF = "TOXIC FOLLOW: OFF",
    LOOP_ON = "TOXIC FOLLOW: ON",
    ESP_ALL = "MARK EVERYONE",
    ESP_INFO = "HP: %d | DIST: %d",
    CMD_READY = "Everyone Marked!"
}
L["RU"] = {
    LANG_TITLE = "ВЫБОР ЯЗЫКА",
    LOGIN_TITLE = "KERKEZ HUB - ВХОД",
    KEY_HINT = "Введите ключ здесь...",
    GET_KEY = "ПОЛУЧИТЬ КЛЮЧ",
    VERIFY = "ПРОВЕРИТЬ",
    STATUS_WAIT = "Пожалуйста, введите ключ.",
    STATUS_WRONG = "Неверный ключ! Попробуйте снова.",
    STATUS_CORRECT = "Проверка пройдена!",
    STATUS_COPY = "Ссылка скопирована!",
    NOTIFY_AUTH = "Ссылка для заработка скопирована!",
    NOTIFY_SUCCESS = "Успех, HUB загружается...",
    HUB_TITLE = "KERKEZ HUB V9.0",
    P_CMD = "КОМАНДЫ ИГРОКА",
    HEDEF = "ЦЕЛЬ: ",
    HEDEF_NONE = "НЕТ",
    BTN_LAVA = "Очистить долину (Лава)",
    BTN_VIP = "Bypass VIP дверей",
    BTN_BRAIN = "Авто-Брайнрот",
    BTN_JUMP = "Бесконечный прыжок",
    BTN_NOCLIP = "Призрачный режим",
    BTN_BAT = "Бат-аура (Токсик)",
    BTN_SPD = "Применить скорость",
    ESP_OFF = "ДЕТАЛЬНЫЙ ESP: ВЫКЛ",
    ESP_ON = "ДЕТАЛЬНЫЙ ESP: ВКЛ",
    TP_BTN = "ТЕЛЕПОРТ К ИГРОКУ",
    LOOP_OFF = "ТОКСИК СЛЕДОВАНИЕ: ВЫКЛ",
    LOOP_ON = "ТОКСИК СЛЕДОВАНИЕ: ВКЛ",
    ESP_ALL = "ОТМЕТИТЬ ВСЕХ",
    ESP_INFO = "HP: %d | ДИСТ: %d",
    CMD_READY = "Все отмечены!"
}
L["ES"] = {
    LANG_TITLE = "ELIGE IDIOMA",
    LOGIN_TITLE = "KERKEZ HUB - LOGIN",
    KEY_HINT = "Escribe la clave...",
    GET_KEY = "OBTENER CLAVE",
    VERIFY = "VERIFICAR",
    STATUS_WAIT = "Por favor ingrese la clave.",
    STATUS_WRONG = "¡Clave incorrecta!",
    STATUS_CORRECT = "¡Verificado con éxito!",
    STATUS_COPY = "¡Enlace copiado!",
    NOTIFY_AUTH = "¡Enlace monetizado copiado!",
    NOTIFY_SUCCESS = "Éxito, cargando HUB...",
    HUB_TITLE = "KERKEZ HUB V9.0",
    P_CMD = "COMANDOS DE JUGADOR",
    HEDEF = "OBJETIVO: ",
    HEDEF_NONE = "NINGUNO",
    BTN_LAVA = "Limpiar lava (Valle)",
    BTN_VIP = "Bypass Puertas VIP",
    BTN_BRAIN = "Auto-Brainrot (Oto)",
    BTN_JUMP = "Salto infinito",
    BTN_NOCLIP = "Modo fantasma",
    BTN_BAT = "Bat-Aura (Toxic)",
    BTN_SPD = "Aplicar velocidad",
    ESP_OFF = "ESP DETALLADO: OFF",
    ESP_ON = "ESP DETALLADO: ON",
    TP_BTN = "TELEPORTAR AL JUGADOR",
    LOOP_OFF = "SEGUIR TOXICO: OFF",
    LOOP_ON = "SEGUIR TOXICO: ON",
    ESP_ALL = "MARCAR A TODOS",
    ESP_INFO = "HP: %d | DIST: %d",
    CMD_READY = "¡Todos marcados!"
}
L["BR"] = {
    LANG_TITLE = "ESCOLHER IDIOMA",
    LOGIN_TITLE = "KERKEZ HUB - LOGIN",
    KEY_HINT = "Digite a chave...",
    GET_KEY = "PEGAR CHAVE",
    VERIFY = "VERIFICAR",
    STATUS_WAIT = "Por favor, digite a chave.",
    STATUS_WRONG = "Chave incorreta!",
    STATUS_CORRECT = "Verificado com sucesso!",
    STATUS_COPY = "Link copiado!",
    NOTIFY_AUTH = "Link monetizado copiado!",
    NOTIFY_SUCCESS = "Sucesso, carregando HUB...",
    HUB_TITLE = "KERKEZ HUB V9.0",
    P_CMD = "COMANDOS DE JOGADOR",
    HEDEF = "ALVO: ",
    HEDEF_NONE = "NENHUM",
    BTN_LAVA = "Limpar Lava (Vale)",
    BTN_VIP = "Bypass Portas VIP",
    BTN_BRAIN = "Auto-Brainrot",
    BTN_JUMP = "Pulo Infinito",
    BTN_NOCLIP = "Modo Fantasma",
    BTN_BAT = "Bat-Aura (Toxic)",
    BTN_SPD = "Aplicar Velocidade",
    ESP_OFF = "ESP DETALHADO: OFF",
    ESP_ON = "ESP DETALHADO: ON",
    TP_BTN = "TELEPORTAR AO JOGADOR",
    LOOP_OFF = "SEGUIR TOXICO: OFF",
    LOOP_ON = "SEGUIR TOXICO: ON",
    ESP_ALL = "MARCAR TODOS",
    ESP_INFO = "HP: %d | DIST: %d",
    CMD_READY = "Todos marcados!"
}
-- Notifications Helper
local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 3
        })
    end)
end
-- Fire Proximity
local function firePrompt(prompt)
    if not prompt then return end
    if fireproximityprompt then
        fireproximityprompt(prompt, 0)
    else
        pcall(function()
            prompt:InputBegan(Enum.UserInputType.MouseButton1)
            task.wait(0.05)
            prompt:InputEnded(Enum.UserInputType.MouseButton1)
        end)
    end
end
-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KerkezHub_V9_0"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui or Players.LocalPlayer:WaitForChild("PlayerGui") end)
-- Helper: Create Glass Frame
local function createGlassFrame(name, parent, pos, size)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    frame.Position = pos
    frame.Size = size
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.8
    stroke.Color = Color3.fromRGB(100, 100, 150)
    stroke.Transparency = 0.2
    stroke.Parent = frame
    
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(150, 150, 255))
    grad.Rotation = 45
    grad.Transparency = NumberSequence.new(0.1, 0.4)
    grad.Parent = frame
    
    return frame
end
-- Shared Button Helper
local function styledBtn(parent, text, pos, color, size)
    local btn = Instance.new("TextButton", parent)
    btn.BackgroundColor3 = color
    btn.Position = pos
    btn.Size = size or UDim2.new(0.38, 0, 0, 40)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.AutoButtonColor = true
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local grad = Instance.new("UIGradient", btn)
    grad.Color = ColorSequence.new(Color3.new(1,1,1), Color3.fromRGB(200,200,200))
    grad.Rotation = 45
    return btn
end
-- [[ LOGIN & HUB LOGIC (NESTED) ]] --
local function StartKeySystem()
    local trans = L[SelectedLanguage]
    local LoginFrame = createGlassFrame("LoginFrame", ScreenGui, UDim2.new(0.5, -150, 0.5, -110), UDim2.new(0, 300, 0, 220))
    
    local LoginTitle = Instance.new("TextLabel", LoginFrame)
    LoginTitle.BackgroundTransparency = 1; LoginTitle.Size = UDim2.new(1, 0, 0, 50); LoginTitle.Font = Enum.Font.GothamBold; LoginTitle.Text = trans.LOGIN_TITLE; LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255); LoginTitle.TextSize = 22
    
    local KeyBox = Instance.new("TextBox", LoginFrame)
    KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 45); KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0); KeyBox.Size = UDim2.new(0.8, 0, 0, 40); KeyBox.Font = Enum.Font.GothamBold; KeyBox.PlaceholderText = trans.KEY_HINT; KeyBox.Text = ""; KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255); KeyBox.TextSize = 14; Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 8)
    
    local GetKeyBtn = styledBtn(LoginFrame, trans.GET_KEY, UDim2.new(0.1, 0, 0.6, 0), Color3.fromRGB(80, 80, 150))
    local VerifyBtn = styledBtn(LoginFrame, trans.VERIFY, UDim2.new(0.52, 0, 0.6, 0), Color3.fromRGB(80, 150, 80))
    
    local StatusLabel = Instance.new("TextLabel", LoginFrame)
    StatusLabel.BackgroundTransparency = 1; StatusLabel.Position = UDim2.new(0.1, 0, 0.85, 0); StatusLabel.Size = UDim2.new(0.8, 0, 0, 20); StatusLabel.Font = Enum.Font.GothamBold; StatusLabel.Text = trans.STATUS_WAIT; StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 255); StatusLabel.TextSize = 12
    GetKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then setclipboard(AUTH_LINK) end
        StatusLabel.Text = trans.STATUS_COPY; notify("HUB", trans.NOTIFY_AUTH)
    end)
    
    VerifyBtn.MouseButton1Click:Connect(function()
        if KeyBox.Text == SCRIPT_KEY then
            StatusLabel.Text = trans.STATUS_CORRECT; task.wait(0.5)
            LoginFrame:Destroy()
            
            -- [[ INITIALIZE MAIN HUB (FULLY LOCALIZED) ]] --
            local MainFrame = createGlassFrame("MainFrame", ScreenGui, UDim2.new(0.5, -260, 0.5, -270), UDim2.new(0, 260, 0, 540))
            local PlayerFrame = createGlassFrame("PlayerFrame", ScreenGui, UDim2.new(0.5, 10, 0.5, -270), UDim2.new(0, 240, 0, 540))
            PlayerFrame.Visible = false
            
            local HT = Instance.new("TextLabel", MainFrame); HT.BackgroundTransparency = 1; HT.Size = UDim2.new(1,0,0,50); HT.Font = Enum.Font.GothamBold; HT.Text = trans.HUB_TITLE; HT.TextColor3 = Color3.new(1,1,1); HT.TextSize = 22
            local CT = Instance.new("TextLabel", PlayerFrame); CT.BackgroundTransparency = 1; CT.Size = UDim2.new(1,0,0,50); CT.Font = Enum.Font.GothamBold; CT.Text = trans.P_CMD; CT.TextColor3 = Color3.new(0.8,0.8,1); CT.TextSize = 18
            
            local OpenP = styledBtn(MainFrame, ">", UDim2.new(1, -30, 0.5, -60), Color3.fromRGB(35,35,65), UDim2.new(0, 30, 0, 120))
            OpenP.MouseButton1Click:Connect(function() PlayerFrame.Visible = not PlayerFrame.Visible; OpenP.Text = PlayerFrame.Visible and "<" or ">" end)
            
            local Scroll = Instance.new("ScrollingFrame", PlayerFrame); Scroll.BackgroundTransparency = 1; Scroll.Position = UDim2.new(0.05, 0, 0.12, 0); Scroll.Size = UDim2.new(0.9, 0, 0.42, 0); Scroll.CanvasSize = UDim2.new(0, 0, 2, 0); Scroll.ScrollBarThickness = 2
            Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 6)
            
            local ESPBtn = styledBtn(PlayerFrame, trans.ESP_OFF, UDim2.new(0.075, 0, 0.58, 0), Color3.fromRGB(70, 70, 150), UDim2.new(0.85, 0, 0, 38))
            local TPBtn = styledBtn(PlayerFrame, trans.TP_BTN, UDim2.new(0.075, 0, 0.66, 0), Color3.fromRGB(70, 150, 70), UDim2.new(0.85, 0, 0, 38))
            local LoopBtn = styledBtn(PlayerFrame, trans.LOOP_OFF, UDim2.new(0.075, 0, 0.74, 0), Color3.fromRGB(150, 70, 70), UDim2.new(0.85, 0, 0, 38))
            local ESPAll = styledBtn(PlayerFrame, trans.ESP_ALL, UDim2.new(0.075, 0, 0.82, 0), Color3.fromRGB(50, 50, 100), UDim2.new(0.85, 0, 0, 38))
            local TargetL = Instance.new("TextLabel", PlayerFrame); TargetL.BackgroundTransparency = 1; TargetL.Position = UDim2.new(0,0,0.9,0); TargetL.Size = UDim2.new(1,0,0,40); TargetL.Font = Enum.Font.GothamBold; TargetL.Text = trans.HEDEF .. trans.HEDEF_NONE; TargetL.TextColor3 = Color3.new(0.8,0.8,1)
            
            local function hubBtn(t_key, pos, c) local b = styledBtn(MainFrame, trans[t_key], pos, Color3.new(1,1,1), UDim2.new(0.85, 0, 0, 38)); b.TextColor3 = Color3.new(0,0,0); b:FindFirstChildOfClass("UIGradient").Color = c; return b, b:FindFirstChildOfClass("UIGradient") end
            local rG = ColorSequence.new(Color3.fromRGB(255, 60, 60)); local yG = ColorSequence.new(Color3.fromRGB(255, 200, 0)); local pG = ColorSequence.new(Color3.fromRGB(180, 80, 255)); local lG = ColorSequence.new(Color3.fromRGB(80, 150, 255)); local ghostG = ColorSequence.new(Color3.fromRGB(180, 180, 255)); local batG = ColorSequence.new(Color3.fromRGB(120, 120, 120)); local greenG = ColorSequence.new(Color3.fromRGB(50, 255, 50))
            
            local L1 = hubBtn("BTN_LAVA", UDim2.new(0.075, 0, 0.08, 0), rG)
            local L2 = hubBtn("BTN_VIP", UDim2.new(0.075, 0, 0.18, 0), yG)
            local L3, G3 = hubBtn("BTN_BRAIN", UDim2.new(0.075, 0, 0.28, 0), pG)
            local L4, G4 = hubBtn("BTN_JUMP", UDim2.new(0.075, 0, 0.38, 0), lG)
            local L5, G5 = hubBtn("BTN_NOCLIP", UDim2.new(0.075, 0, 0.48, 0), ghostG)
            local L6, G6 = hubBtn("BTN_BAT", UDim2.new(0.075, 0, 0.58, 0), batG)
            
            L1.MouseButton1Click:Connect(function() pcall(function() for _, v in ipairs(workspace.GameFolder.Lavas:GetChildren()) do v:Destroy() end end) end)
            L2.MouseButton1Click:Connect(function() pcall(function() for _, v in ipairs(workspace.GameFolder.VIPDoors:GetChildren()) do v:Destroy() end end) end)
            L3.MouseButton1Click:Connect(function() AutoBrainrotEnabled = not AutoBrainrotEnabled; L3.Text = AutoBrainrotEnabled and trans.BTN_BRAIN .. ": ON" or trans.BTN_BRAIN; G3.Color = AutoBrainrotEnabled and greenG or pG end)
            L4.MouseButton1Click:Connect(function() InfJumpEnabled = not InfJumpEnabled; L4.Text = InfJumpEnabled and trans.BTN_JUMP .. ": ON" or trans.BTN_JUMP; G4.Color = InfJumpEnabled and greenG or lG end)
            L5.MouseButton1Click:Connect(function() NoclipEnabled = not NoclipEnabled; L5.Text = NoclipEnabled and trans.BTN_NOCLIP .. ": ON" or trans.BTN_NOCLIP; G5.Color = NoclipEnabled and greenG or ghostG end)
            L6.MouseButton1Click:Connect(function() BatAuraEnabled = not BatAuraEnabled; L6.Text = BatAuraEnabled and trans.BTN_BAT .. ": ON" or trans.BTN_BAT; G6.Color = BatAuraEnabled and greenG or batG end)
            
            -- [[ HUB ENGINE (RE-LOADED) ]] --
            RunService.Heartbeat:Connect(function()
                local lp = Players.LocalPlayer; local char = lp.Character; local root = char and char:FindFirstChild("HumanoidRootPart"); local bat = char:FindFirstChild("Bat") or lp.Backpack:FindFirstChild("Bat")
                if BatAuraEnabled and root and bat then pcall(function() local bT = nil; local dM = 15; for _, p in ipairs(Players:GetPlayers()) do if p ~= lp and p.Character then local pR = p.Character:FindFirstChild("HumanoidRootPart") if pR and (root.Position - pR.Position).Magnitude < dM then bT = p.Character end end end; if bT then root.CFrame = CFrame.new(root.Position, Vector3.new(bT.HumanoidRootPart.Position.X, root.Position.Y, bT.HumanoidRootPart.Position.Z)); if bat.Parent ~= char then bat.Parent = char end; bat:Activate() end end) end
                if LoopFollowEnabled and SelectedPlayer and SelectedPlayer.Character and root then root.CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3); if bat then if bat.Parent ~= char then bat.Parent = char end; bat:Activate() end end
                for p, d in pairs(ESPData) do pcall(function() if p.Character and d.Billboard then local rP = p.Character.HumanoidRootPart; local h = p.Character.Humanoid; d.Billboard.InfoLabel.Text = string.format(trans.ESP_INFO, h.Health, (root.Position - rP.Position).Magnitude) end end) end
            end)
            
            UserInputService.JumpRequest:Connect(function() if InfJumpEnabled and Players.LocalPlayer.Character then local h = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h then h:ChangeState(3); h.Jump = true end end end)
            UserInputService.InputBegan:Connect(function(i, g) if not g and i.KeyCode == TOGGLE_KEY then ScreenGui.Enabled = not ScreenGui.Enabled end end)
            notify("HUB", trans.NOTIFY_SUCCESS)
            
            local function upList()
                for _, c in ipairs(Scroll:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= Players.LocalPlayer then
                        local b = styledBtn(Scroll, p.DisplayName, UDim2.new(0,0,0,0), (SelectedPlayer == p) and Color3.new(0.5,0.5,1) or Color3.fromRGB(35,35,50), UDim2.new(0.95, 0, 0, 32))
                        b.MouseButton1Click:Connect(function() SelectedPlayer = p; TargetL.Text = trans.HEDEF .. p.DisplayName:upper(); upList() end)
                    end
                end
            end
            Players.PlayerAdded:Connect(upList); Players.PlayerRemoving:Connect(upList); upList()
            
            ESPBtn.MouseButton1Click:Connect(function()
                if SelectedPlayer then
                    if ESPData[SelectedPlayer] then
                        pcall(function() ESPData[SelectedPlayer].Highlight:Destroy() ESPData[SelectedPlayer].Billboard:Destroy() end); ESPData[SelectedPlayer] = nil
                        ESPBtn.Text = trans.ESP_OFF
                    else
                        pcall(function()
                            local h = Instance.new("Highlight", SelectedPlayer.Character); h.FillColor = Color3.new(1,1,1)
                            local head = SelectedPlayer.Character:FindFirstChild("Head") or SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local bb = Instance.new("BillboardGui", head); bb.Size = UDim2.new(0,200,0,50); bb.AlwaysOnTop = true; bb.ExtentsOffset = Vector3.new(0,3,0)
                            local nl = Instance.new("TextLabel", bb); nl.Name = "NameLabel"; nl.BackgroundTransparency = 1; nl.Size = UDim2.new(1,0,0,25); nl.Font = 1; nl.TextColor3 = Color3.new(1,1,1); nl.TextSize = 14; nl.Text = SelectedPlayer.DisplayName
                            local il = Instance.new("TextLabel", bb); il.Name = "InfoLabel"; il.BackgroundTransparency = 1; il.Size = UDim2.new(1,0,0,25); il.Position = UDim2.new(0,0,0.5,0); il.Font = 1; il.TextColor3 = Color3.new(0,1,0); il.TextSize = 12
                            ESPData[SelectedPlayer] = {Highlight = h, Billboard = bb}
                        end)
                        ESPBtn.Text = trans.ESP_ON
                    end
                end
            end)
            
            TPBtn.MouseButton1Click:Connect(function() if SelectedPlayer and SelectedPlayer.Character then Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SelectedPlayer.Character.HumanoidRootPart.CFrame end end)
            LoopBtn.MouseButton1Click:Connect(function() if SelectedPlayer then LoopFollowEnabled = not LoopFollowEnabled; LoopBtn.Text = LoopFollowEnabled and trans.LOOP_ON or trans.LOOP_OFF end end)
            ESPAll.MouseButton1Click:Connect(function() for _, p in ipairs(Players:GetPlayers()) do if p ~= Players.LocalPlayer and p.Character then local h = Instance.new("Highlight", p.Character) end end; notify("HUB", trans.CMD_READY) end)
        else
            StatusLabel.Text = trans.STATUS_WRONG; KeyBox.Text = ""
        end
    end)
end
-- [[ FIRST SCREEN: LANGUAGE SELECTION ]] --
local LangFrame = createGlassFrame("LangFrame", ScreenGui, UDim2.new(0.5, -125, 0.5, -150), UDim2.new(0, 250, 0, 300))
local LangTitle = Instance.new("TextLabel", LangFrame)
LangTitle.BackgroundTransparency = 1; LangTitle.Size = UDim2.new(1, 0, 0, 50); LangTitle.Font = Enum.Font.GothamBold; LangTitle.Text = "SELECT LANGUAGE"; LangTitle.TextColor3 = Color3.fromRGB(255, 255, 255); LangTitle.TextSize = 20
local LangList = Instance.new("ScrollingFrame", LangFrame)
LangList.BackgroundTransparency = 1; LangList.Position = UDim2.new(0.05, 0, 0.2, 0); LangList.Size = UDim2.new(0.9, 0, 0.75, 0); LangList.CanvasSize = UDim2.new(0, 0, 1.5, 0); LangList.ScrollBarThickness = 1
Instance.new("UIListLayout", LangList).Padding = UDim.new(0, 8)
local function langBtn(id, text)
    local btn = styledBtn(LangList, text, UDim2.new(0,0,0,0), Color3.fromRGB(35, 35, 60), UDim2.new(0.95, 0, 0, 35))
    btn.MouseButton1Click:Connect(function()
        SelectedLanguage = id
        LangFrame:Destroy()
        StartKeySystem()
    end)
end
langBtn("TR", "🇹🇷 TURKCE")
langBtn("EN", "🇺🇸 ENGLISH")
langBtn("RU", "🇷🇺 RUSSIAN")
langBtn("ES", "🇪🇸 SPANISH")
langBtn("BR", "🇧🇷 PORTUGUESE")
print("KERKEZ HUB V9.0 - GLOBAL EDITION READY!")
