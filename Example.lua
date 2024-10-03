local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main/Example.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Player3030/FluentCustom/main/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Sky-09" .. Fluent.Version,
    SubTitle = "by  naosei & naka",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- O efeito de desfoque pode ser detectável, definir como false desativa o desfoque completamente
    Theme = "Escuro",
    MinimizeKey = Enum.KeyCode.LeftControl -- Usado quando não há uma tecla para minimizar
})

-- Fluent fornece ícones Lucide https://lucide.dev/icons/ para as abas, ícones são opcionais
local Tabs = {
    Inicio = Window:AddTab({ Title = "Início", Icon = "" })
}

local Options = Fluent.Options

-- Notificação ao carregar o script
Fluent:Notify({
    Title = "Sucessy",
    Content = "O script foi carregado.",
    Duration = 8
})

-- Addons:
-- SaveManager (Permite ter um sistema de configuração)
-- InterfaceManager (Permite ter um sistema de gerenciamento de interface)

-- Vincula a biblioteca aos gerenciadores
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignorar configurações de tema.
SaveManager:IgnoreThemeSettings()

-- Adicionar índices de elementos que o gerenciador de salvamento deve ignorar
SaveManager:SetIgnoreIndexes({})

-- Exemplo de uso:
-- um script hub pode ter temas em uma pasta global
-- e configurações de jogo em uma pasta separada por jogo
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/jogo-especifico")

-- Constrói a seção da interface e configurações na aba "Início"
InterfaceManager:BuildInterfaceSection(Tabs.Inicio)
SaveManager:BuildConfigSection(Tabs.Inicio)

-- Seleciona a aba "Início" ao carregar
Window:SelectTab(1)

-- Carregar automaticamente uma configuração marcada para auto carregar
SaveManager:LoadAutoloadConfig()
