print("Carregando Fluent...")
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main.lua"))()
if not Fluent then
    error("Falha ao carregar Fluent")
end
print("Fluent carregado:", Fluent)

print("Carregando SaveManager...")
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main/Addons/SaveManager.lua"))()
if not SaveManager then
    error("Falha ao carregar SaveManager")
end
print("SaveManager carregado:", SaveManager)

print("Carregando InterfaceManager...")
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main/Addons/InterfaceManager.lua"))()
if not InterfaceManager then
    error("Falha ao carregar InterfaceManager")
end
print("InterfaceManager carregado:", InterfaceManager)

-- Criar janela principal com Fluent
local Window = Fluent:CreateWindow({
    Title = "Sky-09" .. Fluent.Version, -- Título da janela
    SubTitle = "by naosei & naka", -- Subtítulo
    TabWidth = 160, -- Largura da aba
    Size = UDim2.fromOffset(580, 460), -- Tamanho da janela
    Acrylic = true, -- Efeito de desfoque ativado
    Theme = "Escuro", -- Tema da interface
    MinimizeKey = Enum.KeyCode.LeftControl -- Tecla para minimizar
})

-- Adicionar abas
local Tabs = {
    Inicio = Window:AddTab({ Title = "Início", Icon = "" })
}

local Options = Fluent.Options

-- Notificação ao carregar o script
Fluent:Notify({
    Title = "Sucessy", -- Título da notificação
    Content = "O script foi carregado.", -- Conteúdo da notificação
    Duration = 8 -- Duração da notificação
})

-- Configuração dos Addons
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignorar configurações de tema.
SaveManager:IgnoreThemeSettings()

-- Adicionar elementos ignorados pelo sistema de salvamento
SaveManager:SetIgnoreIndexes({})

-- Definir pasta para salvar as configurações
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/jogo-especifico")

-- Construir interface e adicionar a seção na aba "Início"
InterfaceManager:BuildInterfaceSection(Tabs.Inicio)
SaveManager:BuildConfigSection(Tabs.Inicio)

-- Selecionar a aba "Início" ao carregar
Window:SelectTab(1)

-- Carregar configuração automaticamente se configurada
SaveManager:LoadAutoloadConfig()
