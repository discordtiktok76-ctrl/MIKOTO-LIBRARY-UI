-- MIKOTOH UI 4.4.0 | standalone executor library
-- UI extracted from Chilli; item panel adapted from CHILLI_HUB (1).txt.
-- No key system, external engine or gameplay code.

local function buildWindow(config)
config = config or {}
local player = game:GetService("Players").LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local camera = workspace.CurrentCamera
assert(player, "MIKOTOH precisa ser executada no cliente.")
local playerGui = player:WaitForChild("PlayerGui")

local ROOT_GUI_NAME = "MIKOTOH_UI_4"
local LAUNCHER_GUI_NAME = "MIKOTOH_Launcher_4"
local OWNER_ATTRIBUTE = "MikotohLibraryOwned"
local parent = config.Parent or CoreGui
local parentName = "CoreGui"
do
    local hiddenOk, hiddenParent = pcall(function()
        return gethui()
    end)
    if not config.Parent and hiddenOk and typeof(hiddenParent) == "Instance" then
        parent = hiddenParent
        parentName = "HiddenUI"
    end

    local ok, problem = pcall(function()
        local probe = Instance.new("ScreenGui")
        probe.Name = "ChilliLibraryUIProbe"
        probe.Parent = parent
        probe:Destroy()
    end)
    if not ok then
        error(
            "ChilliLibrary requires write access to "
                .. parentName
                .. "; PlayerGui fallback is disabled: "
                .. tostring(problem),
            0
        )
    end
end

local function createEmbeddedSpider()
    local spider = Instance.new("MeshPart")
    spider.Name = "Spider"
    spider.Archivable = true
    spider.Anchored = true
    spider.BackSurface = Enum.SurfaceType.Smooth
    spider.BottomSurface = Enum.SurfaceType.Smooth
    spider.BrickColor = BrickColor.new("Institutional white")
    spider.CanCollide = false
    spider.CanQuery = false
    spider.CanTouch = false
    spider.CastShadow = true
    spider.Color = Color3.new(1, 1, 1)
    spider.FrontSurface = Enum.SurfaceType.Smooth
    spider.LeftSurface = Enum.SurfaceType.Smooth
    spider.Massless = true
    spider.Material = Enum.Material.Plastic
    spider.Reflectance = 0
    spider.RightSurface = Enum.SurfaceType.Smooth
    spider.RootPriority = -5
    spider.Size = Vector3.new(
        0.9052265286445618,
        0.24434703588485718,
        0.9125359058380127
    )
    spider.TopSurface = Enum.SurfaceType.Smooth
    spider.Transparency = 0
    spider.MeshId = "rbxassetid://135715081992798"
    spider.TextureID = ""
    spider.DoubleSided = false
    spider.RenderFidelity = Enum.RenderFidelity.Automatic
    spider.CollisionFidelity = Enum.CollisionFidelity.Box
    spider.CFrame = CFrame.new()

    local headAttachment = Instance.new("Attachment")
    headAttachment.Name = "HeadAttachment"
    headAttachment.CFrame = CFrame.new(
        0.72625732421875,
        -0.504150390625,
        0.3289794921875,
        0.7071012258529663,
        -0.7068588733673096,
        -0.01893438585102558,
        -0.000011771917343139648,
        0.026765286922454834,
        -0.9996418952941895,
        0.7071123719215393,
        0.70684814453125,
        0.018917446956038475
    )
    headAttachment.Parent = spider

    return spider
end



local function cleanupOldUiScreens()
    for _, child in ipairs(parent:GetChildren()) do
        if child:GetAttribute(OWNER_ATTRIBUTE) == true
            and (child.Name == ROOT_GUI_NAME or child.Name == LAUNCHER_GUI_NAME or child.Name == "MIKOTOH_FreeLauncher_4" or child.Name == "MIKOTOH_ItemPanel_4" or child.Name == "MIKOTOH_EggLauncher_4" or child.Name == "MIKOTOH_AntiGuardPanel_4") then
            child:Destroy()
        end
    end
end

cleanupOldUiScreens()




local function chilliSetProperty(instance, key, value)
    instance[key] = value
end
local objects = {}

objects.obj1 = Instance.new("ScreenGui")
pcall(chilliSetProperty, objects.obj1, "Name", ROOT_GUI_NAME)
pcall(chilliSetProperty, objects.obj1, "Archivable", true)
objects.obj1:SetAttribute("MenuSize", UDim2.new(0.44999998807907104,0,0.550000011920929,0))
objects.obj1:SetAttribute(OWNER_ATTRIBUTE, true)
objects.obj1.Parent = parent

objects.obj2 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj2, "Name", "Frame")
pcall(chilliSetProperty, objects.obj2, "Archivable", true)
pcall(chilliSetProperty, objects.obj2, "Visible", true)
pcall(chilliSetProperty, objects.obj2, "Active", false)
pcall(chilliSetProperty, objects.obj2, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj2, "BackgroundColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj2, "BackgroundTransparency", 0.4000000059604645)
pcall(chilliSetProperty, objects.obj2, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj2, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj2, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj2, "Position", UDim2.new(0.5,0,0.4749999940395355,0))
pcall(chilliSetProperty, objects.obj2, "Rotation", 0)
pcall(chilliSetProperty, objects.obj2, "Selectable", false)
pcall(chilliSetProperty, objects.obj2, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj2, "Size", UDim2.new(0.44999998807907104,0,0.550000011920929,0))
pcall(chilliSetProperty, objects.obj2, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj2, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj2, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj2, "LayoutOrder", 0)
objects.obj2.Parent = objects.obj1

objects.obj3 = Instance.new("UIStroke")
pcall(chilliSetProperty, objects.obj3, "Name", "UIStroke")
pcall(chilliSetProperty, objects.obj3, "Archivable", true)
pcall(chilliSetProperty, objects.obj3, "ApplyStrokeMode", Enum.ApplyStrokeMode.Border)
pcall(chilliSetProperty, objects.obj3, "Color", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj3, "Enabled", true)
pcall(chilliSetProperty, objects.obj3, "LineJoinMode", Enum.LineJoinMode.Round)
pcall(chilliSetProperty, objects.obj3, "Thickness", 0.00800000037997961)
pcall(chilliSetProperty, objects.obj3, "Transparency", 0)
objects.obj3.Parent = objects.obj2

objects.obj4 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj4, "Name", "Top")
pcall(chilliSetProperty, objects.obj4, "Archivable", true)
pcall(chilliSetProperty, objects.obj4, "Visible", true)
pcall(chilliSetProperty, objects.obj4, "Active", false)
pcall(chilliSetProperty, objects.obj4, "AnchorPoint", Vector2.new(0.5,0))
pcall(chilliSetProperty, objects.obj4, "BackgroundColor3", Color3.fromRGB(111,0,2))
pcall(chilliSetProperty, objects.obj4, "BackgroundTransparency", 0)
pcall(chilliSetProperty, objects.obj4, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj4, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj4, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj4, "Position", UDim2.new(0.5,0,0,0))
pcall(chilliSetProperty, objects.obj4, "Rotation", 0)
pcall(chilliSetProperty, objects.obj4, "Selectable", false)
pcall(chilliSetProperty, objects.obj4, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj4, "Size", UDim2.new(1,0,0.13500000536441803,0))
pcall(chilliSetProperty, objects.obj4, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj4, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj4, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj4, "LayoutOrder", 0)
objects.obj4.Parent = objects.obj2

objects.obj5 = Instance.new("UIStroke")
pcall(chilliSetProperty, objects.obj5, "Name", "UIStroke")
pcall(chilliSetProperty, objects.obj5, "Archivable", true)
pcall(chilliSetProperty, objects.obj5, "ApplyStrokeMode", Enum.ApplyStrokeMode.Border)
pcall(chilliSetProperty, objects.obj5, "Color", Color3.fromRGB(58,0,0))
pcall(chilliSetProperty, objects.obj5, "Enabled", true)
pcall(chilliSetProperty, objects.obj5, "LineJoinMode", Enum.LineJoinMode.Round)
pcall(chilliSetProperty, objects.obj5, "Thickness", 0.05999999865889549)
pcall(chilliSetProperty, objects.obj5, "Transparency", 0)
objects.obj5.Parent = objects.obj4

objects.obj6 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj6, "Name", "Color")
pcall(chilliSetProperty, objects.obj6, "Archivable", true)
pcall(chilliSetProperty, objects.obj6, "Visible", true)
pcall(chilliSetProperty, objects.obj6, "Active", false)
pcall(chilliSetProperty, objects.obj6, "AnchorPoint", Vector2.new(0.5,0))
pcall(chilliSetProperty, objects.obj6, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj6, "BackgroundTransparency", 0)
pcall(chilliSetProperty, objects.obj6, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj6, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj6, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj6, "Position", UDim2.new(0.5,0,0,0))
pcall(chilliSetProperty, objects.obj6, "Rotation", 0)
pcall(chilliSetProperty, objects.obj6, "Selectable", false)
pcall(chilliSetProperty, objects.obj6, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj6, "Size", UDim2.new(1,0,0.8799999952316284,0))
pcall(chilliSetProperty, objects.obj6, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj6, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj6, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj6, "LayoutOrder", 0)
objects.obj6.Parent = objects.obj4

objects.obj7 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj7, "Name", "Transparent")
pcall(chilliSetProperty, objects.obj7, "Archivable", true)
pcall(chilliSetProperty, objects.obj7, "Visible", true)
pcall(chilliSetProperty, objects.obj7, "Active", false)
pcall(chilliSetProperty, objects.obj7, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj7, "BackgroundColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj7, "BackgroundTransparency", 0.8999999761581421)
pcall(chilliSetProperty, objects.obj7, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj7, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj7, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj7, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj7, "Rotation", 0)
pcall(chilliSetProperty, objects.obj7, "Selectable", false)
pcall(chilliSetProperty, objects.obj7, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj7, "Size", UDim2.new(0.9879999756813049,0,0.8700000047683716,0))
pcall(chilliSetProperty, objects.obj7, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj7, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj7, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj7, "LayoutOrder", 0)
objects.obj7.Parent = objects.obj6

objects.obj8 = Instance.new("ImageLabel")
pcall(chilliSetProperty, objects.obj8, "Name", "Pattern")
pcall(chilliSetProperty, objects.obj8, "Archivable", true)
pcall(chilliSetProperty, objects.obj8, "Visible", true)
pcall(chilliSetProperty, objects.obj8, "Active", false)
pcall(chilliSetProperty, objects.obj8, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj8, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj8, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj8, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj8, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj8, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj8, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj8, "Rotation", 0)
pcall(chilliSetProperty, objects.obj8, "Selectable", false)
pcall(chilliSetProperty, objects.obj8, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj8, "Size", UDim2.new(1,0,1,0))
pcall(chilliSetProperty, objects.obj8, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj8, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj8, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj8, "LayoutOrder", 0)
pcall(chilliSetProperty, objects.obj8, "Image", "")
pcall(chilliSetProperty, objects.obj8, "ImageColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj8, "ImageTransparency", 0.5)
pcall(chilliSetProperty, objects.obj8, "ScaleType", Enum.ScaleType.Tile)
pcall(chilliSetProperty, objects.obj8, "SliceCenter", Rect.new(0,0,0,0))
pcall(chilliSetProperty, objects.obj8, "SliceScale", 1)
pcall(chilliSetProperty, objects.obj8, "TileSize", UDim2.new(0.15000000596046448,0,2,0))
pcall(chilliSetProperty, objects.obj8, "ResampleMode", Enum.ResamplerMode.Default)
objects.obj8.Parent = objects.obj7

objects.obj9 = Instance.new("TextLabel")
pcall(chilliSetProperty, objects.obj9, "Name", "Label")
pcall(chilliSetProperty, objects.obj9, "Archivable", true)
pcall(chilliSetProperty, objects.obj9, "Visible", true)
pcall(chilliSetProperty, objects.obj9, "Active", false)
pcall(chilliSetProperty, objects.obj9, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj9, "BackgroundColor3", Color3.fromRGB(239,220,203))
pcall(chilliSetProperty, objects.obj9, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj9, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj9, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj9, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj9, "Position", UDim2.new(0.5687711238861084,0,0.5,0))
pcall(chilliSetProperty, objects.obj9, "Rotation", 0)
pcall(chilliSetProperty, objects.obj9, "Selectable", false)
pcall(chilliSetProperty, objects.obj9, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj9, "Size", UDim2.new(0.8620089292526245,0,0.7499999403953552,0))
pcall(chilliSetProperty, objects.obj9, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj9, "ZIndex", 6)
pcall(chilliSetProperty, objects.obj9, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj9, "LayoutOrder", 0)
pcall(chilliSetProperty, objects.obj9, "Text", "MIKOTOH")
pcall(chilliSetProperty, objects.obj9, "TextColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj9, "TextTransparency", 0)
pcall(chilliSetProperty, objects.obj9, "TextStrokeColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj9, "TextStrokeTransparency", 1)
pcall(chilliSetProperty, objects.obj9, "TextSize", 14)
pcall(chilliSetProperty, objects.obj9, "TextScaled", true)
pcall(chilliSetProperty, objects.obj9, "TextWrapped", true)
pcall(chilliSetProperty, objects.obj9, "TextXAlignment", Enum.TextXAlignment.Left)
pcall(chilliSetProperty, objects.obj9, "TextYAlignment", Enum.TextYAlignment.Center)
pcall(chilliSetProperty, objects.obj9, "Font", Enum.Font.FredokaOne)
pcall(chilliSetProperty, objects.obj9, "RichText", false)
pcall(chilliSetProperty, objects.obj9, "LineHeight", 1)
pcall(chilliSetProperty, objects.obj9, "MaxVisibleGraphemes", -1)
objects.obj9.Parent = objects.obj6

objects.obj10 = Instance.new("UIStroke")
pcall(chilliSetProperty, objects.obj10, "Name", "UIStroke")
pcall(chilliSetProperty, objects.obj10, "Archivable", true)
pcall(chilliSetProperty, objects.obj10, "ApplyStrokeMode", Enum.ApplyStrokeMode.Contextual)
pcall(chilliSetProperty, objects.obj10, "Color", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj10, "Enabled", true)
pcall(chilliSetProperty, objects.obj10, "LineJoinMode", Enum.LineJoinMode.Round)
pcall(chilliSetProperty, objects.obj10, "Thickness", 0.07999999821186066)
pcall(chilliSetProperty, objects.obj10, "Transparency", 0)
objects.obj10.Parent = objects.obj9

objects.obj11 = Instance.new("UIGradient")
pcall(chilliSetProperty, objects.obj11, "Name", "UIGradient")
pcall(chilliSetProperty, objects.obj11, "Archivable", true)
pcall(chilliSetProperty, objects.obj11, "Color", ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(253,86,89)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,11,15))}))
pcall(chilliSetProperty, objects.obj11, "Enabled", true)
pcall(chilliSetProperty, objects.obj11, "Offset", Vector2.new(0,0))
pcall(chilliSetProperty, objects.obj11, "Rotation", 90)
pcall(chilliSetProperty, objects.obj11, "Transparency", NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)}))
objects.obj11.Parent = objects.obj6

objects.obj12 = Instance.new("ImageLabel")
pcall(chilliSetProperty, objects.obj12, "Name", "Icon")
pcall(chilliSetProperty, objects.obj12, "Archivable", true)
pcall(chilliSetProperty, objects.obj12, "Visible", true)
pcall(chilliSetProperty, objects.obj12, "Active", false)
pcall(chilliSetProperty, objects.obj12, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj12, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj12, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj12, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj12, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj12, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj12, "Position", UDim2.new(0.06700000166893005,0,0.44999998807907104,0))
pcall(chilliSetProperty, objects.obj12, "Rotation", 0)
pcall(chilliSetProperty, objects.obj12, "Selectable", false)
pcall(chilliSetProperty, objects.obj12, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj12, "Size", UDim2.new(0.11656716465950012,0,1.1833335161209106,0))
pcall(chilliSetProperty, objects.obj12, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj12, "ZIndex", 4)
pcall(chilliSetProperty, objects.obj12, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj12, "LayoutOrder", 0)
pcall(chilliSetProperty, objects.obj12, "Image", "")
pcall(chilliSetProperty, objects.obj12, "ImageColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj12, "ImageTransparency", 0)
pcall(chilliSetProperty, objects.obj12, "ScaleType", Enum.ScaleType.Fit)
pcall(chilliSetProperty, objects.obj12, "SliceCenter", Rect.new(0,0,0,0))
pcall(chilliSetProperty, objects.obj12, "SliceScale", 1)
pcall(chilliSetProperty, objects.obj12, "TileSize", UDim2.new(0,60,0,60))
pcall(chilliSetProperty, objects.obj12, "ResampleMode", Enum.ResamplerMode.Default)
objects.obj12.Parent = objects.obj4

objects.obj13 = Instance.new("UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj13, "Name", "UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj13, "Archivable", true)
pcall(chilliSetProperty, objects.obj13, "AspectRatio", 1)
pcall(chilliSetProperty, objects.obj13, "AspectType", Enum.AspectType.FitWithinMaxSize)
pcall(chilliSetProperty, objects.obj13, "DominantAxis", Enum.DominantAxis.Width)
objects.obj13.Parent = objects.obj12

objects.obj14 = Instance.new("TextButton")
pcall(chilliSetProperty, objects.obj14, "Name", "Close")
pcall(chilliSetProperty, objects.obj14, "Archivable", true)
pcall(chilliSetProperty, objects.obj14, "Visible", true)
pcall(chilliSetProperty, objects.obj14, "Active", true)
pcall(chilliSetProperty, objects.obj14, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj14, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj14, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj14, "BorderColor3", Color3.fromRGB(27,42,53))
pcall(chilliSetProperty, objects.obj14, "BorderSizePixel", 1)
pcall(chilliSetProperty, objects.obj14, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj14, "Position", UDim2.new(0.9549999833106995,0,0.4339999854564667,0))
pcall(chilliSetProperty, objects.obj14, "Rotation", 0)
pcall(chilliSetProperty, objects.obj14, "Selectable", true)
pcall(chilliSetProperty, objects.obj14, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj14, "Size", UDim2.new(0.06637302041053772,0,0.6588137149810791,0))
pcall(chilliSetProperty, objects.obj14, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj14, "ZIndex", 99)
pcall(chilliSetProperty, objects.obj14, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj14, "LayoutOrder", 1)
pcall(chilliSetProperty, objects.obj14, "Text", "")
pcall(chilliSetProperty, objects.obj14, "TextColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj14, "TextTransparency", 0)
pcall(chilliSetProperty, objects.obj14, "TextStrokeColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj14, "TextStrokeTransparency", 1)
pcall(chilliSetProperty, objects.obj14, "TextSize", 14)
pcall(chilliSetProperty, objects.obj14, "TextScaled", false)
pcall(chilliSetProperty, objects.obj14, "TextWrapped", false)
pcall(chilliSetProperty, objects.obj14, "TextXAlignment", Enum.TextXAlignment.Center)
pcall(chilliSetProperty, objects.obj14, "TextYAlignment", Enum.TextYAlignment.Center)
pcall(chilliSetProperty, objects.obj14, "Font", Enum.Font.SourceSans)
pcall(chilliSetProperty, objects.obj14, "RichText", false)
pcall(chilliSetProperty, objects.obj14, "LineHeight", 1)
pcall(chilliSetProperty, objects.obj14, "AutoButtonColor", true)
pcall(chilliSetProperty, objects.obj14, "Modal", false)
objects.obj14.Parent = objects.obj4

objects.obj15 = Instance.new("UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj15, "Name", "UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj15, "Archivable", true)
pcall(chilliSetProperty, objects.obj15, "AspectRatio", 1)
pcall(chilliSetProperty, objects.obj15, "AspectType", Enum.AspectType.FitWithinMaxSize)
pcall(chilliSetProperty, objects.obj15, "DominantAxis", Enum.DominantAxis.Width)
objects.obj15.Parent = objects.obj14

objects.obj16 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj16, "Name", "Main")
pcall(chilliSetProperty, objects.obj16, "Archivable", true)
pcall(chilliSetProperty, objects.obj16, "Visible", true)
pcall(chilliSetProperty, objects.obj16, "Active", false)
pcall(chilliSetProperty, objects.obj16, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj16, "BackgroundColor3", Color3.fromRGB(126,0,0))
pcall(chilliSetProperty, objects.obj16, "BackgroundTransparency", 0)
pcall(chilliSetProperty, objects.obj16, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj16, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj16, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj16, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj16, "Rotation", 0)
pcall(chilliSetProperty, objects.obj16, "Selectable", false)
pcall(chilliSetProperty, objects.obj16, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj16, "Size", UDim2.new(1,0,1,0))
pcall(chilliSetProperty, objects.obj16, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj16, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj16, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj16, "LayoutOrder", 0)
objects.obj16.Parent = objects.obj14

objects.obj17 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj17, "Name", "Color")
pcall(chilliSetProperty, objects.obj17, "Archivable", true)
pcall(chilliSetProperty, objects.obj17, "Visible", true)
pcall(chilliSetProperty, objects.obj17, "Active", false)
pcall(chilliSetProperty, objects.obj17, "AnchorPoint", Vector2.new(0.5,0))
pcall(chilliSetProperty, objects.obj17, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj17, "BackgroundTransparency", 0)
pcall(chilliSetProperty, objects.obj17, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj17, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj17, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj17, "Position", UDim2.new(0.5,0,0,0))
pcall(chilliSetProperty, objects.obj17, "Rotation", 0)
pcall(chilliSetProperty, objects.obj17, "Selectable", false)
pcall(chilliSetProperty, objects.obj17, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj17, "Size", UDim2.new(1,0,0.8999999761581421,0))
pcall(chilliSetProperty, objects.obj17, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj17, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj17, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj17, "LayoutOrder", 0)
objects.obj17.Parent = objects.obj16

objects.obj18 = Instance.new("Frame")
pcall(chilliSetProperty, objects.obj18, "Name", "Transparent")
pcall(chilliSetProperty, objects.obj18, "Archivable", true)
pcall(chilliSetProperty, objects.obj18, "Visible", true)
pcall(chilliSetProperty, objects.obj18, "Active", false)
pcall(chilliSetProperty, objects.obj18, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj18, "BackgroundColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj18, "BackgroundTransparency", 0.8999999761581421)
pcall(chilliSetProperty, objects.obj18, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj18, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj18, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj18, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj18, "Rotation", 0)
pcall(chilliSetProperty, objects.obj18, "Selectable", false)
pcall(chilliSetProperty, objects.obj18, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj18, "Size", UDim2.new(0.9599999785423279,0,0.8799999952316284,0))
pcall(chilliSetProperty, objects.obj18, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj18, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj18, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj18, "LayoutOrder", 0)
objects.obj18.Parent = objects.obj17

objects.obj19 = Instance.new("ImageLabel")
pcall(chilliSetProperty, objects.obj19, "Name", "Pattern")
pcall(chilliSetProperty, objects.obj19, "Archivable", true)
pcall(chilliSetProperty, objects.obj19, "Visible", true)
pcall(chilliSetProperty, objects.obj19, "Active", false)
pcall(chilliSetProperty, objects.obj19, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj19, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj19, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj19, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj19, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj19, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj19, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj19, "Rotation", 0)
pcall(chilliSetProperty, objects.obj19, "Selectable", false)
pcall(chilliSetProperty, objects.obj19, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj19, "Size", UDim2.new(1,0,1,0))
pcall(chilliSetProperty, objects.obj19, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj19, "ZIndex", 1)
pcall(chilliSetProperty, objects.obj19, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj19, "LayoutOrder", 0)
pcall(chilliSetProperty, objects.obj19, "Image", "")
pcall(chilliSetProperty, objects.obj19, "ImageColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj19, "ImageTransparency", 0.5)
pcall(chilliSetProperty, objects.obj19, "ScaleType", Enum.ScaleType.Tile)
pcall(chilliSetProperty, objects.obj19, "SliceCenter", Rect.new(0,0,0,0))
pcall(chilliSetProperty, objects.obj19, "SliceScale", 1)
pcall(chilliSetProperty, objects.obj19, "TileSize", UDim2.new(2,0,2,0))
pcall(chilliSetProperty, objects.obj19, "ResampleMode", Enum.ResamplerMode.Default)
objects.obj19.Parent = objects.obj18

objects.obj20 = Instance.new("TextLabel")
pcall(chilliSetProperty, objects.obj20, "Name", "Label")
pcall(chilliSetProperty, objects.obj20, "Archivable", true)
pcall(chilliSetProperty, objects.obj20, "Visible", true)
pcall(chilliSetProperty, objects.obj20, "Active", false)
pcall(chilliSetProperty, objects.obj20, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj20, "BackgroundColor3", Color3.fromRGB(239,220,203))
pcall(chilliSetProperty, objects.obj20, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj20, "BorderColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj20, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj20, "ClipsDescendants", false)
pcall(chilliSetProperty, objects.obj20, "Position", UDim2.new(0.5,0,0.5,0))
pcall(chilliSetProperty, objects.obj20, "Rotation", 0)
pcall(chilliSetProperty, objects.obj20, "Selectable", false)
pcall(chilliSetProperty, objects.obj20, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj20, "Size", UDim2.new(0.949999988079071,0,0.800000011920929,0))
pcall(chilliSetProperty, objects.obj20, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj20, "ZIndex", 6)
pcall(chilliSetProperty, objects.obj20, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj20, "LayoutOrder", 0)
pcall(chilliSetProperty, objects.obj20, "Text", "X")
pcall(chilliSetProperty, objects.obj20, "TextColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj20, "TextTransparency", 0)
pcall(chilliSetProperty, objects.obj20, "TextStrokeColor3", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj20, "TextStrokeTransparency", 1)
pcall(chilliSetProperty, objects.obj20, "TextSize", 14)
pcall(chilliSetProperty, objects.obj20, "TextScaled", true)
pcall(chilliSetProperty, objects.obj20, "TextWrapped", true)
pcall(chilliSetProperty, objects.obj20, "TextXAlignment", Enum.TextXAlignment.Center)
pcall(chilliSetProperty, objects.obj20, "TextYAlignment", Enum.TextYAlignment.Center)
pcall(chilliSetProperty, objects.obj20, "Font", Enum.Font.FredokaOne)
pcall(chilliSetProperty, objects.obj20, "RichText", false)
pcall(chilliSetProperty, objects.obj20, "LineHeight", 1)
pcall(chilliSetProperty, objects.obj20, "MaxVisibleGraphemes", -1)
objects.obj20.Parent = objects.obj17

objects.obj21 = Instance.new("UIStroke")
pcall(chilliSetProperty, objects.obj21, "Name", "UIStroke")
pcall(chilliSetProperty, objects.obj21, "Archivable", true)
pcall(chilliSetProperty, objects.obj21, "ApplyStrokeMode", Enum.ApplyStrokeMode.Contextual)
pcall(chilliSetProperty, objects.obj21, "Color", Color3.fromRGB(0,0,0))
pcall(chilliSetProperty, objects.obj21, "Enabled", true)
pcall(chilliSetProperty, objects.obj21, "LineJoinMode", Enum.LineJoinMode.Round)
pcall(chilliSetProperty, objects.obj21, "Thickness", 0.10999999940395355)
pcall(chilliSetProperty, objects.obj21, "Transparency", 0)
objects.obj21.Parent = objects.obj20

objects.obj22 = Instance.new("UIGradient")
pcall(chilliSetProperty, objects.obj22, "Name", "UIGradient")
pcall(chilliSetProperty, objects.obj22, "Archivable", true)
pcall(chilliSetProperty, objects.obj22, "Color", ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,130,130)),ColorSequenceKeypoint.new(1,Color3.fromRGB(239,28,28))}))
pcall(chilliSetProperty, objects.obj22, "Enabled", true)
pcall(chilliSetProperty, objects.obj22, "Offset", Vector2.new(0,0))
pcall(chilliSetProperty, objects.obj22, "Rotation", 90)
pcall(chilliSetProperty, objects.obj22, "Transparency", NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)}))
objects.obj22.Parent = objects.obj17

objects.obj23 = Instance.new("UIStroke")
pcall(chilliSetProperty, objects.obj23, "Name", "UIStroke")
pcall(chilliSetProperty, objects.obj23, "Archivable", true)
pcall(chilliSetProperty, objects.obj23, "ApplyStrokeMode", Enum.ApplyStrokeMode.Border)
pcall(chilliSetProperty, objects.obj23, "Color", Color3.fromRGB(76,0,0))
pcall(chilliSetProperty, objects.obj23, "Enabled", true)
pcall(chilliSetProperty, objects.obj23, "LineJoinMode", Enum.LineJoinMode.Round)
pcall(chilliSetProperty, objects.obj23, "Thickness", 0.09000000357627869)
pcall(chilliSetProperty, objects.obj23, "Transparency", 0)
objects.obj23.Parent = objects.obj16

objects.obj24 = Instance.new("UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj24, "Name", "UIAspectRatioConstraint")
pcall(chilliSetProperty, objects.obj24, "Archivable", true)
pcall(chilliSetProperty, objects.obj24, "AspectRatio", 1.340000033378601)
pcall(chilliSetProperty, objects.obj24, "AspectType", Enum.AspectType.FitWithinMaxSize)
pcall(chilliSetProperty, objects.obj24, "DominantAxis", Enum.DominantAxis.Width)
objects.obj24.Parent = objects.obj2

objects.obj25 = Instance.new("ScrollingFrame")
pcall(chilliSetProperty, objects.obj25, "Name", "List")
pcall(chilliSetProperty, objects.obj25, "Archivable", true)
pcall(chilliSetProperty, objects.obj25, "Visible", true)
pcall(chilliSetProperty, objects.obj25, "Active", true)
pcall(chilliSetProperty, objects.obj25, "AnchorPoint", Vector2.new(0.5,0.5))
pcall(chilliSetProperty, objects.obj25, "BackgroundColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj25, "BackgroundTransparency", 1)
pcall(chilliSetProperty, objects.obj25, "BorderColor3", Color3.fromRGB(27,42,53))
pcall(chilliSetProperty, objects.obj25, "BorderSizePixel", 0)
pcall(chilliSetProperty, objects.obj25, "ClipsDescendants", true)
pcall(chilliSetProperty, objects.obj25, "Position", UDim2.new(0.5000000596046448,0,0.5701961517333984,0))
pcall(chilliSetProperty, objects.obj25, "Rotation", 0)
pcall(chilliSetProperty, objects.obj25, "Selectable", true)
pcall(chilliSetProperty, objects.obj25, "SelectionOrder", 0)
pcall(chilliSetProperty, objects.obj25, "Size", UDim2.new(0.9900000095367432,0,0.8296076059341431,0))
pcall(chilliSetProperty, objects.obj25, "SizeConstraint", Enum.SizeConstraint.RelativeXY)
pcall(chilliSetProperty, objects.obj25, "ZIndex", 5)
pcall(chilliSetProperty, objects.obj25, "AutomaticSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj25, "LayoutOrder", 1)
pcall(chilliSetProperty, objects.obj25, "CanvasPosition", Vector2.new(0,0))
pcall(chilliSetProperty, objects.obj25, "CanvasSize", UDim2.new(0,0,0,642))
pcall(chilliSetProperty, objects.obj25, "AutomaticCanvasSize", Enum.AutomaticSize.None)
pcall(chilliSetProperty, objects.obj25, "ScrollBarThickness", 6)
pcall(chilliSetProperty, objects.obj25, "ScrollBarImageColor3", Color3.fromRGB(255,255,255))
pcall(chilliSetProperty, objects.obj25, "ScrollBarImageTransparency", 0)
pcall(chilliSetProperty, objects.obj25, "ScrollingDirection", Enum.ScrollingDirection.XY)
pcall(chilliSetProperty, objects.obj25, "ScrollingEnabled", true)
pcall(chilliSetProperty, objects.obj25, "VerticalScrollBarInset", Enum.ScrollBarInset.None)
pcall(chilliSetProperty, objects.obj25, "HorizontalScrollBarInset", Enum.ScrollBarInset.None)
objects.obj25.Parent = objects.obj2








local rootGui = objects.obj1
local mainFrame = objects.obj2
local topBar = objects.obj4
local closeButton = objects.obj14

local Runtime = {}
local Protected = {}

local rootConnections = {}

local function trackRootConnection(connection)
    table.insert(rootConnections, connection)
    return connection
end

local function disconnectRootConnections()
    for index = #rootConnections, 1, -1 do
        local connection = rootConnections[index]
        if connection and connection.Connected then
            connection:Disconnect()
        end
        rootConnections[index] = nil
    end
end

rootGui.ResetOnSpawn = false



rootGui.IgnoreGuiInset = true
rootGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling




-- No game HUD is inspected or modified by this standalone library.
local function findLeftCenterSources() return nil end

local sourceLeftCenterScreen
local sourceLeftCenter
local sourceButtons
local sourceShop
local sourceShopIcon
local sourceShopText
sourceLeftCenterScreen, sourceLeftCenter, sourceButtons,
    sourceShop, sourceShopIcon, sourceShopText = findLeftCenterSources()

local leftCenterFrame = sourceLeftCenter
local hudRestorePosition = leftCenterFrame
    and sourceLeftCenter.Position
    or UDim2.fromScale(0, 0.5)
local hudTween = nil
local hudTweenConnection = nil
local hudAnimationSerial = 0
Runtime.chilliIsOpen = false

local function cancelHudTween()
    if hudTweenConnection then
        hudTweenConnection:Disconnect()
        hudTweenConnection = nil
    end
    if hudTween then
        hudTween:Cancel()
        hudTween = nil
    end
end

local launcherGui = Instance.new("ScreenGui")
launcherGui.Name = LAUNCHER_GUI_NAME
launcherGui.ResetOnSpawn = false
launcherGui.IgnoreGuiInset = sourceLeftCenterScreen
    and sourceLeftCenterScreen.IgnoreGuiInset
    or false
launcherGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
launcherGui.DisplayOrder = sourceLeftCenterScreen
    and sourceLeftCenterScreen.DisplayOrder
    or 0
launcherGui:SetAttribute(OWNER_ATTRIBUTE, true)
if sourceLeftCenterScreen then
    pcall(function()
        launcherGui.ScreenInsets = sourceLeftCenterScreen.ScreenInsets
        launcherGui.SafeAreaCompatibility = sourceLeftCenterScreen.SafeAreaCompatibility
        launcherGui.ClipToDeviceSafeArea = sourceLeftCenterScreen.ClipToDeviceSafeArea
    end)
end
launcherGui.Enabled = true
launcherGui.Parent = parent

local launcherRoot = Instance.new("Frame")
launcherRoot.Name = "LeftCenter"
launcherRoot.AnchorPoint = sourceLeftCenter
    and sourceLeftCenter.AnchorPoint
    or Vector2.new(0, 0.5)
launcherRoot.Position = sourceLeftCenter
    and sourceLeftCenter.Position
    or UDim2.fromScale(0, 0.5)
launcherRoot.Size = sourceLeftCenter
    and sourceLeftCenter.Size
    or UDim2.fromScale(1, 1)
launcherRoot.BackgroundTransparency = 1
launcherRoot.BorderSizePixel = 0
launcherRoot.Parent = launcherGui

local sourceRootAspect = sourceLeftCenter
    and sourceLeftCenter:FindFirstChildOfClass("UIAspectRatioConstraint")
local launcherRootAspect = Instance.new("UIAspectRatioConstraint")
launcherRootAspect.AspectRatio = sourceRootAspect and sourceRootAspect.AspectRatio or 2.15
launcherRootAspect.AspectType = sourceRootAspect and sourceRootAspect.AspectType or Enum.AspectType.FitWithinMaxSize
launcherRootAspect.DominantAxis = sourceRootAspect and sourceRootAspect.DominantAxis or Enum.DominantAxis.Width
launcherRootAspect.Parent = launcherRoot

local launcherButtons = Instance.new("Frame")
launcherButtons.Name = "Buttons"
launcherButtons.AnchorPoint = sourceButtons
    and sourceButtons.AnchorPoint
    or Vector2.new(0, 0.5)
launcherButtons.Position = sourceButtons
    and sourceButtons.Position
    or UDim2.fromScale(0.015625, 0.5)
launcherButtons.Size = sourceButtons
    and sourceButtons.Size
    or UDim2.fromScale(0.062, 0.38)
launcherButtons.BackgroundTransparency = 1
launcherButtons.BorderSizePixel = 0
launcherButtons.Parent = launcherRoot

local sourceButtonsAspect = sourceButtons
    and sourceButtons:FindFirstChildOfClass("UIAspectRatioConstraint")
local launcherButtonsAspect = Instance.new("UIAspectRatioConstraint")
launcherButtonsAspect.AspectRatio = sourceButtonsAspect and sourceButtonsAspect.AspectRatio or 0.3
launcherButtonsAspect.AspectType = sourceButtonsAspect and sourceButtonsAspect.AspectType or Enum.AspectType.FitWithinMaxSize
launcherButtonsAspect.DominantAxis = sourceButtonsAspect and sourceButtonsAspect.DominantAxis or Enum.DominantAxis.Width
launcherButtonsAspect.Parent = launcherButtons

local chilliButton = Instance.new("ImageButton")
chilliButton.Name = "Chilli"
chilliButton.AnchorPoint = Vector2.new(0.5, 0.5)
chilliButton.Position = sourceShop
    and UDim2.fromScale(0.5, 0)
    or UDim2.fromScale(0.42, -0.1885267)
chilliButton.Size = sourceShop
    and UDim2.fromScale(1, 0.3)
    or UDim2.fromScale(1, 0.3015267)
chilliButton.BackgroundColor3 = sourceShop
    and sourceShop.BackgroundColor3
    or Color3.fromRGB(255, 255, 255)
chilliButton.BackgroundTransparency = sourceShop
    and sourceShop.BackgroundTransparency
    or 1
chilliButton.BorderSizePixel = 0
chilliButton.AutoButtonColor = sourceShop == nil or sourceShop.AutoButtonColor
chilliButton.Image = sourceShop
    and sourceShop.Image
    or "rbxassetid://88734015663903"
chilliButton.HoverImage = sourceShop
    and sourceShop.HoverImage
    or "rbxassetid://119376130178381"
chilliButton.PressedImage = sourceShop and sourceShop.PressedImage or ""
chilliButton.ImageColor3 = sourceShop
    and sourceShop.ImageColor3
    or Color3.fromRGB(255, 255, 255)
chilliButton.ImageTransparency = sourceShop
    and sourceShop.ImageTransparency
    or 0
chilliButton.ImageRectOffset = sourceShop
    and sourceShop.ImageRectOffset
    or Vector2.new()
chilliButton.ImageRectSize = sourceShop
    and sourceShop.ImageRectSize
    or Vector2.new()
chilliButton.ResampleMode = sourceShop
    and sourceShop.ResampleMode
    or Enum.ResamplerMode.Default
chilliButton.ScaleType = sourceShop
    and sourceShop.ScaleType
    or Enum.ScaleType.Fit
chilliButton.SliceCenter = sourceShop
    and sourceShop.SliceCenter
    or Rect.new()
chilliButton.SliceScale = sourceShop and sourceShop.SliceScale or 1
chilliButton.ZIndex = sourceShop and sourceShop.ZIndex or 2
chilliButton.Parent = launcherButtons

local fallbackButtonGradient = Instance.new("UIGradient")
fallbackButtonGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(111, 145, 161)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(52, 72, 84)),
})
fallbackButtonGradient.Rotation = 90
fallbackButtonGradient.Enabled = false
fallbackButtonGradient.Parent = chilliButton

local fallbackButtonStroke = Instance.new("UIStroke")
fallbackButtonStroke.Color = Color3.fromRGB(34, 45, 52)
fallbackButtonStroke.Thickness = 0.025
fallbackButtonStroke.Enabled = false
pcall(function()
    fallbackButtonStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
end)
fallbackButtonStroke.Parent = chilliButton

local chilliViewport = Instance.new("ViewportFrame")
chilliViewport.Name = "ChilliViewport"
chilliViewport.AnchorPoint = sourceShopIcon and sourceShopIcon.AnchorPoint
    or Vector2.new(0.5, 0.5)
chilliViewport.Position = sourceShopIcon and sourceShopIcon.Position
    or UDim2.fromScale(0.5, 0.5)
chilliViewport.Size = sourceShopIcon and sourceShopIcon.Size
    or UDim2.fromScale(0.76055, 0.76055)
chilliViewport.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
chilliViewport.BackgroundTransparency = 1
chilliViewport.BorderSizePixel = 0
chilliViewport.Ambient = Color3.fromRGB(255, 255, 255)
chilliViewport.LightColor = Color3.fromRGB(255, 255, 255)
chilliViewport.LightDirection = Vector3.new(-1, -1, -1)
chilliViewport.ImageColor3 = Color3.fromRGB(255, 255, 255)
chilliViewport.ImageTransparency = 0
chilliViewport.LayoutOrder = 0
chilliViewport.ZIndex = sourceShopIcon and sourceShopIcon.ZIndex or 0
chilliViewport.Visible = true
chilliViewport.Active = false
pcall(function()
    chilliViewport.Interactable = false
end)
chilliViewport.Parent = chilliButton

local chilliWorldModel = Instance.new("WorldModel")
chilliWorldModel.Name = "WorldModel"
chilliWorldModel.Parent = chilliViewport

local chilliSpider = createEmbeddedSpider()
chilliSpider.Parent = chilliWorldModel
chilliSpider.CFrame = CFrame.Angles(
    math.rad(82.5),
    math.rad(-153.95),
    math.rad(0)
)

local chilliViewportCamera = Instance.new("Camera")
chilliViewportCamera.Name = "Camera"
chilliViewportCamera.CameraType = Enum.CameraType.Fixed
chilliViewportCamera.FieldOfView = 50
chilliViewportCamera.FieldOfViewMode = Enum.FieldOfViewMode.Vertical
chilliViewportCamera.Parent = chilliViewport
chilliViewport.CurrentCamera = chilliViewportCamera

local function frameChilliSpider()
    local boxCFrame = chilliSpider.CFrame
    local right = boxCFrame.RightVector
    local up = boxCFrame.UpVector
    local look = boxCFrame.LookVector
    local size = chilliSpider.Size
    local boxSize = Vector3.new(
        math.abs(right.X) * size.X
            + math.abs(up.X) * size.Y
            + math.abs(look.X) * size.Z,
        math.abs(right.Y) * size.X
            + math.abs(up.Y) * size.Y
            + math.abs(look.Y) * size.Z,
        math.abs(right.Z) * size.X
            + math.abs(up.Z) * size.Y
            + math.abs(look.Z) * size.Z
    )

    local verticalFieldOfView = math.rad(chilliViewportCamera.FieldOfView)
    local viewportSize = chilliViewport.AbsoluteSize
    local aspectRatio = 1
    if viewportSize.X > 0 and viewportSize.Y > 0 then
        aspectRatio = viewportSize.X / viewportSize.Y
    end
    local horizontalFieldOfView = 2 * math.atan(
        math.tan(verticalFieldOfView * 0.5) * aspectRatio
    )
    local verticalDistance = boxSize.Y
        / (2 * math.tan(verticalFieldOfView * 0.5))
    local horizontalDistance = boxSize.X
        / (2 * math.tan(horizontalFieldOfView * 0.5))
    local distance = math.max(verticalDistance, horizontalDistance)
        + boxSize.Z * 0.5
    distance = distance * 3

    local target = boxCFrame.Position
    local cameraPosition = target + Vector3.new(0, boxSize.Y * 0.04, distance)
    chilliViewportCamera.CFrame = CFrame.lookAt(cameraPosition, target)
    chilliViewportCamera.Focus = CFrame.new(target)
end

frameChilliSpider()
task.defer(function()
    RunService.RenderStepped:Wait()
    frameChilliSpider()
end)

local chilliText = Instance.new("TextLabel")
chilliText.Name = "Txt"
chilliText.AnchorPoint = sourceShopText and sourceShopText.AnchorPoint or Vector2.new(0.5, 0.5)
chilliText.Position = sourceShopText and sourceShopText.Position or UDim2.fromScale(0.5, 0.9367089)
chilliText.Size = sourceShopText and sourceShopText.Size or UDim2.fromScale(1, 0.2278481)
chilliText.BackgroundTransparency = 1
chilliText.BorderSizePixel = 0
chilliText.FontFace = sourceShopText and sourceShopText.FontFace or Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontWeight.ExtraBold
)
chilliText.Text = "MIKOTOH"
chilliText.TextColor3 = sourceShopText and sourceShopText.TextColor3 or Color3.fromRGB(255, 255, 255)
chilliText.TextTransparency = sourceShopText and sourceShopText.TextTransparency or 0
chilliText.TextScaled = sourceShopText == nil or sourceShopText.TextScaled
chilliText.TextWrapped = sourceShopText == nil or sourceShopText.TextWrapped
chilliText.TextXAlignment = sourceShopText and sourceShopText.TextXAlignment or Enum.TextXAlignment.Center
chilliText.TextYAlignment = sourceShopText and sourceShopText.TextYAlignment or Enum.TextYAlignment.Center
chilliText.ZIndex = sourceShopText and sourceShopText.ZIndex or 1
chilliText.Parent = chilliButton

local sourceTextStroke = sourceShopText and sourceShopText:FindFirstChildOfClass("UIStroke")
local chilliTextStroke = Instance.new("UIStroke")
chilliTextStroke.ApplyStrokeMode = sourceTextStroke and sourceTextStroke.ApplyStrokeMode or Enum.ApplyStrokeMode.Contextual
chilliTextStroke.Color = sourceTextStroke and sourceTextStroke.Color or Color3.fromRGB(0, 0, 0)
chilliTextStroke.LineJoinMode = sourceTextStroke and sourceTextStroke.LineJoinMode or Enum.LineJoinMode.Round
chilliTextStroke.Thickness = sourceTextStroke and sourceTextStroke.Thickness or 2
chilliTextStroke.Transparency = sourceTextStroke and sourceTextStroke.Transparency or 0.35
if sourceTextStroke then
    local originalThickness = sourceTextStroke:GetAttribute("OriginalThickness")
    if originalThickness ~= nil then
        chilliTextStroke:SetAttribute("OriginalThickness", originalThickness)
    end
end
chilliTextStroke.Parent = chilliText

local function getLiveVerticalStep()
    if not (sourceButtons and sourceButtons.Parent and sourceShop and sourceShop.Parent) then
        return nil
    end

    local shopPosition = sourceShop.AbsolutePosition
    local shopSize = sourceShop.AbsoluteSize
    local bestStep = nil

    for _, child in ipairs(sourceButtons:GetChildren()) do
        if child ~= sourceShop and child:IsA("GuiButton") and child.Visible then
            local deltaX = math.abs(child.AbsolutePosition.X - shopPosition.X)
            local deltaY = child.AbsolutePosition.Y - shopPosition.Y
            if deltaX <= shopSize.X * 0.25 and deltaY > 0 then
                if not bestStep or deltaY < bestStep then
                    bestStep = deltaY
                end
            end
        end
    end

    if bestStep then
        return bestStep
    end

    local grid = sourceButtons:FindFirstChildOfClass("UIGridLayout")
    if grid then
        return grid.AbsoluteCellSize.Y
            + grid.CellPadding.Y.Scale * sourceButtons.AbsoluteSize.Y
            + grid.CellPadding.Y.Offset
    end

    return shopSize.Y
end

local function updateChilliLauncherLayout()
    if not (sourceButtons and sourceButtons.Parent and sourceShop and sourceShop.Parent) then
        return
    end

    local buttonsSize = sourceButtons.AbsoluteSize
    local shopSize = sourceShop.AbsoluteSize
    if buttonsSize.X <= 0 or buttonsSize.Y <= 0 or shopSize.X <= 0 or shopSize.Y <= 0 then
        return
    end

    local buttonsPosition = sourceButtons.AbsolutePosition
    local shopPosition = sourceShop.AbsolutePosition
    local verticalStep = getLiveVerticalStep()
    if not verticalStep then
        return
    end
    local centerX = shopPosition.X + shopSize.X * 0.5
    local centerY = shopPosition.Y - verticalStep + shopSize.Y * 0.5

    chilliButton.Position = UDim2.fromScale(
        (centerX - buttonsPosition.X) / buttonsSize.X,
        (centerY - buttonsPosition.Y) / buttonsSize.Y
    )
    chilliButton.Size = UDim2.fromScale(
        shopSize.X / buttonsSize.X,
        shopSize.Y / buttonsSize.Y
    )
end

local launcherLayoutQueued = false
local function queueChilliLauncherLayout()
    
    
    if hudTween or launcherLayoutQueued then
        return
    end
    launcherLayoutQueued = true
    task.defer(function()
        RunService.RenderStepped:Wait()
        launcherLayoutQueued = false
        if launcherGui.Parent then
            updateChilliLauncherLayout()
        end
    end)
end

local sourceConnections = {}
local sourceBound = false

local function disconnectSourceConnections()
    for _, connection in ipairs(sourceConnections) do
        connection:Disconnect()
    end
    table.clear(sourceConnections)
    sourceBound = false
end

local function connectSource(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(sourceConnections, connection)
end

local function shiftOneScreenLeft(position)
    return UDim2.new(
        position.X.Scale - 1,
        position.X.Offset,
        position.Y.Scale,
        position.Y.Offset
    )
end

local function refreshEffectiveLeftCenterHidden()
    local unavailable = not sourceLeftCenterScreen
        or not sourceLeftCenterScreen.Parent
        or not sourceLeftCenterScreen.Enabled
        or not leftCenterFrame
        or not leftCenterFrame.Parent
        or not leftCenterFrame.Visible
    local shiftedLeft = false
    if leftCenterFrame and leftCenterFrame.Parent then
        local currentX = leftCenterFrame.Position.X
        local restoreX = hudRestorePosition.X
        shiftedLeft = currentX.Scale < restoreX.Scale - 0.05
            or (
                math.abs(currentX.Scale - restoreX.Scale) <= 0.05
                and currentX.Offset < restoreX.Offset - 4
            )
    end
    local effectiveHidden =
        launcherGui:GetAttribute("QuickHudHidden") == true
        or Runtime.chilliIsOpen
        or unavailable
        or shiftedLeft
    if launcherGui:GetAttribute("EffectiveLeftCenterHidden")
        ~= effectiveHidden
    then
        launcherGui:SetAttribute(
            "EffectiveLeftCenterHidden",
            effectiveHidden
        )
    end
end

local function adoptLeftCenterSources(screen, frame, buttons, shop, icon, text)
    if sourceBound
        or not (screen and frame and buttons and shop and icon and text)
    then
        return false
    end

    sourceBound = true

    sourceLeftCenterScreen = screen
    sourceLeftCenter = frame
    sourceButtons = buttons
    sourceShop = shop
    sourceShopIcon = icon
    sourceShopText = text
    sourceTextStroke = sourceShopText:FindFirstChildOfClass("UIStroke")

    launcherGui.IgnoreGuiInset = sourceLeftCenterScreen.IgnoreGuiInset
    launcherGui.DisplayOrder = sourceLeftCenterScreen.DisplayOrder
    pcall(function()
        launcherGui.ScreenInsets = sourceLeftCenterScreen.ScreenInsets
        launcherGui.SafeAreaCompatibility = sourceLeftCenterScreen.SafeAreaCompatibility
        launcherGui.ClipToDeviceSafeArea = sourceLeftCenterScreen.ClipToDeviceSafeArea
    end)

    launcherRoot.AnchorPoint = sourceLeftCenter.AnchorPoint
    launcherRoot.Size = sourceLeftCenter.Size
    sourceRootAspect = sourceLeftCenter:FindFirstChildOfClass("UIAspectRatioConstraint")
    if sourceRootAspect then
        launcherRootAspect.AspectRatio = sourceRootAspect.AspectRatio
        launcherRootAspect.AspectType = sourceRootAspect.AspectType
        launcherRootAspect.DominantAxis = sourceRootAspect.DominantAxis
    end

    launcherButtons.AnchorPoint = sourceButtons.AnchorPoint
    launcherButtons.Position = sourceButtons.Position
    launcherButtons.Size = sourceButtons.Size
    sourceButtonsAspect = sourceButtons:FindFirstChildOfClass("UIAspectRatioConstraint")
    if sourceButtonsAspect then
        launcherButtonsAspect.AspectRatio = sourceButtonsAspect.AspectRatio
        launcherButtonsAspect.AspectType = sourceButtonsAspect.AspectType
        launcherButtonsAspect.DominantAxis = sourceButtonsAspect.DominantAxis
    end

    chilliButton.BackgroundColor3 = sourceShop.BackgroundColor3
    chilliButton.BackgroundTransparency = sourceShop.BackgroundTransparency
    chilliButton.AutoButtonColor = sourceShop.AutoButtonColor
    chilliButton.Image = sourceShop.Image
    chilliButton.HoverImage = sourceShop.HoverImage
    chilliButton.PressedImage = sourceShop.PressedImage
    chilliButton.ImageColor3 = sourceShop.ImageColor3
    chilliButton.ImageTransparency = sourceShop.ImageTransparency
    chilliButton.ImageRectOffset = sourceShop.ImageRectOffset
    chilliButton.ImageRectSize = sourceShop.ImageRectSize
    chilliButton.ResampleMode = sourceShop.ResampleMode
    chilliButton.ScaleType = sourceShop.ScaleType
    chilliButton.SliceCenter = sourceShop.SliceCenter
    chilliButton.SliceScale = sourceShop.SliceScale
    chilliButton.ZIndex = sourceShop.ZIndex
    fallbackButtonGradient.Enabled = false
    fallbackButtonStroke.Enabled = false

    chilliViewport.AnchorPoint = sourceShopIcon.AnchorPoint
    chilliViewport.Position = sourceShopIcon.Position
    chilliViewport.Size = sourceShopIcon.Size
    chilliViewport.ZIndex = sourceShopIcon.ZIndex

    chilliText.AnchorPoint = sourceShopText.AnchorPoint
    chilliText.Position = sourceShopText.Position
    chilliText.Size = sourceShopText.Size
    chilliText.FontFace = sourceShopText.FontFace
    chilliText.TextColor3 = sourceShopText.TextColor3
    chilliText.TextTransparency = sourceShopText.TextTransparency
    chilliText.TextScaled = sourceShopText.TextScaled
    chilliText.TextWrapped = sourceShopText.TextWrapped
    chilliText.TextXAlignment = sourceShopText.TextXAlignment
    chilliText.TextYAlignment = sourceShopText.TextYAlignment
    chilliText.ZIndex = sourceShopText.ZIndex

    if sourceTextStroke then
        local boundStroke = sourceTextStroke
        chilliTextStroke.ApplyStrokeMode = boundStroke.ApplyStrokeMode
        chilliTextStroke.Color = boundStroke.Color
        chilliTextStroke.LineJoinMode = boundStroke.LineJoinMode
        chilliTextStroke.Thickness = boundStroke.Thickness
        chilliTextStroke.Transparency = boundStroke.Transparency
        connectSource(
            boundStroke:GetPropertyChangedSignal("Thickness"),
            function()
                chilliTextStroke.Thickness = boundStroke.Thickness
            end
        )
        connectSource(
            boundStroke:GetPropertyChangedSignal("Transparency"),
            function()
                chilliTextStroke.Transparency = boundStroke.Transparency
            end
        )
    end

    leftCenterFrame = sourceLeftCenter
    hudAnimationSerial = hudAnimationSerial + 1
    cancelHudTween()
    local savedRestorePosition = launcherGui:GetAttribute(
        "HudRestorePosition"
    )
    if typeof(savedRestorePosition) == "UDim2" then
        hudRestorePosition = savedRestorePosition
    else
        hudRestorePosition = leftCenterFrame.Position
    end
    
    
    while hudRestorePosition.X.Scale <= -0.5 do
        hudRestorePosition = UDim2.new(
            hudRestorePosition.X.Scale + 1,
            hudRestorePosition.X.Offset,
            hudRestorePosition.Y.Scale,
            hudRestorePosition.Y.Offset
        )
    end
    if Runtime.chilliIsOpen
        or launcherGui:GetAttribute("QuickHudHidden") == true
    then
        leftCenterFrame.Position = shiftOneScreenLeft(
            hudRestorePosition
        )
        launcherGui:SetAttribute(
            "HudRestorePosition",
            hudRestorePosition
        )
        if launcherGui:GetAttribute("QuickHudHidden") == true then
            leftCenterFrame.Visible = false
            sourceLeftCenterScreen.Enabled = false
            launcherGui:SetAttribute("LeftCenterHiddenByLibrary", true)
            launcherGui:SetAttribute(
                "LeftCenterScreenDisabledByLibrary",
                true
            )
        end
    else
        leftCenterFrame.Position = hudRestorePosition
        launcherGui:SetAttribute("HudRestorePosition", nil)
    end
    launcherRoot.Position = Runtime.chilliIsOpen
        and shiftOneScreenLeft(hudRestorePosition)
        or hudRestorePosition

    connectSource(
        leftCenterFrame:GetPropertyChangedSignal("Position"),
        function()
            local shouldStayHidden =
                launcherGui:GetAttribute("QuickHudHidden") == true
                or Runtime.chilliIsOpen
            if shouldStayHidden then
                
                
                
                if not hudTween then
                    local hiddenPosition = shiftOneScreenLeft(
                        hudRestorePosition
                    )
                    if leftCenterFrame.Position ~= hiddenPosition then
                        leftCenterFrame.Position = hiddenPosition
                    end
                end
                refreshEffectiveLeftCenterHidden()
                return
            end
            launcherRoot.Position = leftCenterFrame.Position
            refreshEffectiveLeftCenterHidden()
        end
    )
    connectSource(
        leftCenterFrame:GetPropertyChangedSignal("Visible"),
        function()
            if launcherGui:GetAttribute("QuickHudHidden") == true
                and leftCenterFrame.Visible
            then
                leftCenterFrame.Visible = false
            end
            refreshEffectiveLeftCenterHidden()
        end
    )
    connectSource(
        sourceLeftCenterScreen:GetPropertyChangedSignal("Enabled"),
        function()
            if launcherGui:GetAttribute("QuickHudHidden") == true
                and sourceLeftCenterScreen.Enabled
            then
                sourceLeftCenterScreen.Enabled = false
            end
            refreshEffectiveLeftCenterHidden()
        end
    )
    for _, instance in ipairs({ sourceLeftCenter, sourceButtons, sourceShop }) do
        connectSource(
            instance:GetPropertyChangedSignal("AbsolutePosition"),
            queueChilliLauncherLayout
        )
        connectSource(
            instance:GetPropertyChangedSignal("AbsoluteSize"),
            queueChilliLauncherLayout
        )
    end
    connectSource(sourceButtons.ChildAdded, queueChilliLauncherLayout)
    connectSource(sourceButtons.ChildRemoved, queueChilliLauncherLayout)

    queueChilliLauncherLayout()
    refreshEffectiveLeftCenterHidden()
    task.defer(frameChilliSpider)
    return true
end

if sourceLeftCenterScreen then
    adoptLeftCenterSources(
        sourceLeftCenterScreen,
        sourceLeftCenter,
        sourceButtons,
        sourceShop,
        sourceShopIcon,
        sourceShopText
    )
else
    task.spawn(function()
        local retryDeadline = os.clock() + 10
        while launcherGui.Parent
            and not sourceBound
            and os.clock() < retryDeadline
        do
            local screen, frame, buttons, shop, icon, text =
                findLeftCenterSources()
            if adoptLeftCenterSources(
                screen,
                frame,
                buttons,
                shop,
                icon,
                text
            ) then
                break
            end
            task.wait(0.25)
        end
    end)
end



trackRootConnection(playerGui.DescendantAdded:Connect(function()
    local screen, frame, buttons, shop, icon, text = findLeftCenterSources()
    if frame
        and (frame ~= leftCenterFrame or screen ~= sourceLeftCenterScreen)
    then
        disconnectSourceConnections()
        adoptLeftCenterSources(screen, frame, buttons, shop, icon, text)
    end
end))




local HUD_RENDER_GUARD_NAME = "ChilliLibraryLeftCenterRenderGuard"

local function enforceHiddenLeftCenterBeforeRender()
    if not rootGui.Parent
        or not leftCenterFrame
        or not leftCenterFrame.Parent
    then
        return
    end

    local manuallyHidden =
        launcherGui:GetAttribute("QuickHudHidden") == true
    if manuallyHidden and not hudTween then
        if leftCenterFrame.Visible then
            leftCenterFrame.Visible = false
        end
        if sourceLeftCenterScreen and sourceLeftCenterScreen.Enabled then
            sourceLeftCenterScreen.Enabled = false
        end
        launcherGui:SetAttribute("LeftCenterHiddenByLibrary", true)
        launcherGui:SetAttribute(
            "LeftCenterScreenDisabledByLibrary",
            true
        )
    elseif not manuallyHidden
        and launcherGui:GetAttribute("LeftCenterHiddenByLibrary") == true
    then
        leftCenterFrame.Visible = true
        launcherGui:SetAttribute("LeftCenterHiddenByLibrary", nil)
        if sourceLeftCenterScreen
            and launcherGui:GetAttribute(
                "LeftCenterScreenDisabledByLibrary"
            ) == true
        then
            sourceLeftCenterScreen.Enabled = true
            launcherGui:SetAttribute(
                "LeftCenterScreenDisabledByLibrary",
                nil
            )
        end
    end

    if hudTween then
        return
    end

    local shouldStayHidden = manuallyHidden or Runtime.chilliIsOpen
    if not shouldStayHidden then
        return
    end

    local hiddenPosition = shiftOneScreenLeft(hudRestorePosition)
    if leftCenterFrame.Position ~= hiddenPosition then
        leftCenterFrame.Position = hiddenPosition
    end
end

pcall(function()
    RunService:UnbindFromRenderStep(HUD_RENDER_GUARD_NAME)
end)
RunService:BindToRenderStep(
    HUD_RENDER_GUARD_NAME,
    Enum.RenderPriority.Last.Value + 10000,
    enforceHiddenLeftCenterBeforeRender
)

rootGui.Destroying:Connect(function()
    pcall(function()
        RunService:UnbindFromRenderStep(HUD_RENDER_GUARD_NAME)
    end)
    disconnectRootConnections()
    disconnectSourceConnections()
end)

local function applyOriginalStrokeSizing()
    
    
    
    
    pcall(function()
        for _, inst in ipairs(rootGui:GetDescendants()) do
            if inst:IsA("UIStroke") then
                if not inst:GetAttribute("MikotohFixedStroke") then inst.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize end
                inst.BorderStrokePosition = Enum.BorderStrokePosition.Outer
                inst.BorderOffset = UDim.new(0, 0)
            end
        end
    end)
end

local function makeDraggable(handle, target, canStart, moved)
    handle.Active = true

    local dragging = false
    local dragInput = nil
    local dragStart = Vector2.new(0, 0)
    local startPosition = Vector2.new(0, 0)

    local function cancelDrag()
        dragging = false
        dragInput = nil
    end

    trackRootConnection(handle.InputBegan:Connect(function(input)
        if dragging or input.UserInputState ~= Enum.UserInputState.Begin then
            return
        end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch
        then
            return
        end
        if canStart and not canStart() then
            return
        end

        local region = rootGui.AbsoluteSize
        if region.X <= 0 or region.Y <= 0 then
            return
        end

        local pointer = Vector2.new(input.Position.X, input.Position.Y)
        local handlePosition = handle.AbsolutePosition
        local handleSize = handle.AbsoluteSize
        if pointer.X < handlePosition.X
            or pointer.X > handlePosition.X + handleSize.X
            or pointer.Y < handlePosition.Y
            or pointer.Y > handlePosition.Y + handleSize.Y
        then
            return
        end
        
        
        for _, child in ipairs(handle:GetDescendants()) do
            if child:IsA("GuiButton") and child.Visible then
                local childPosition = child.AbsolutePosition
                local childSize = child.AbsoluteSize
                if pointer.X >= childPosition.X
                    and pointer.X <= childPosition.X + childSize.X
                    and pointer.Y >= childPosition.Y
                    and pointer.Y <= childPosition.Y + childSize.Y
                then
                    return
                end
            end
        end

        dragging = true
        dragInput = input.UserInputType == Enum.UserInputType.Touch
            and input
            or nil
        dragStart = pointer
        startPosition = Vector2.new(
            target.Position.X.Scale + target.Position.X.Offset / region.X,
            target.Position.Y.Scale + target.Position.Y.Offset / region.Y
        )
    end))

    trackRootConnection(UserInputService.InputChanged:Connect(function(input)
        if not dragging then
            return
        end
        local inputMoved = (dragInput and input == dragInput)
            or (not dragInput
                and input.UserInputType == Enum.UserInputType.MouseMovement)
        if not inputMoved then
            return
        end

        local region = rootGui.AbsoluteSize
        if region.X <= 0 or region.Y <= 0 then
            return
        end

        local delta = Vector2.new(input.Position.X, input.Position.Y)
            - dragStart
        local targetFraction = Vector2.new(
            target.AbsoluteSize.X / region.X,
            target.AbsoluteSize.Y / region.Y
        )
        local anchor = target.AnchorPoint
        local minX = targetFraction.X * anchor.X
        local maxX = 0.998 - targetFraction.X * (1 - anchor.X)
        local minY = targetFraction.Y * anchor.Y
        
        
        
        local maxY = 0.98 + targetFraction.Y * anchor.Y

        target.Position = UDim2.fromScale(
            math.clamp(
                startPosition.X + delta.X / region.X,
                math.min(minX, maxX),
                math.max(minX, maxX)
            ),
            math.clamp(
                startPosition.Y + delta.Y / region.Y,
                math.min(minY, maxY),
                math.max(minY, maxY)
            )
        )
        if moved then
            moved(target.Position)
        end
    end))

    trackRootConnection(UserInputService.InputEnded:Connect(function(input)
        if not dragging then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input == dragInput
        then
            cancelDrag()
        end
    end))

    return {
        Cancel = cancelDrag,
        IsDragging = function()
            return dragging
        end,
    }
end




local SAFE_TOUCH_TAP_DISTANCE = 10
local safeTouchPresses = setmetatable({}, { __mode = "k" })

local function pointInsideGui(guiObject, point)
    if not guiObject or not guiObject.Parent or not guiObject.Visible then
        return false
    end
    local position = guiObject.AbsolutePosition
    local size = guiObject.AbsoluteSize
    return point.X >= position.X
        and point.X <= position.X + size.X
        and point.Y >= position.Y
        and point.Y <= position.Y + size.Y
end

trackRootConnection(UserInputService.InputChanged:Connect(function(input)
    local press = safeTouchPresses[input]
    if not press then
        return
    end
    local point = Vector2.new(input.Position.X, input.Position.Y)
    press.Position = point
    if (point - press.Start).Magnitude > SAFE_TOUCH_TAP_DISTANCE then
        press.Cancelled = true
    end
end))

trackRootConnection(UserInputService.InputEnded:Connect(function(input)
    local press = safeTouchPresses[input]
    if not press then
        return
    end
    local point = Vector2.new(input.Position.X, input.Position.Y)
    press.Position = point
    press.Ended = true
    if (point - press.Start).Magnitude > SAFE_TOUCH_TAP_DISTANCE
        or not pointInsideGui(press.Button, point)
    then
        press.Cancelled = true
    end
    
    
    task.delay(0.2, function()
        if safeTouchPresses[input] == press then
            safeTouchPresses[input] = nil
        end
    end)
end))

local function connectSafeActivation(button, callback)
    button.Active = true
    button.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
            or input.UserInputState ~= Enum.UserInputState.Begin
        then
            return
        end
        local point = Vector2.new(input.Position.X, input.Position.Y)
        if not pointInsideGui(button, point) then
            return
        end
        safeTouchPresses[input] = {
            Button = button,
            Start = point,
            Position = point,
            Cancelled = false,
            Ended = false,
        }
    end)

    return button.Activated:Connect(function(input)
        if input and input.UserInputType == Enum.UserInputType.Touch then
            local press = safeTouchPresses[input]
            if not press
                or press.Button ~= button
                or press.Cancelled
                or not pointInsideGui(button, press.Position)
            then
                return
            end
        end
        callback()
    end)
end

local function makeButtonFeedback(button)
    local normalSize = button.Size
    local hovered = false
    local activeTween = nil

    local function scaledSize(multiplier)
        return UDim2.new(
            normalSize.X.Scale * multiplier,
            normalSize.X.Offset * multiplier,
            normalSize.Y.Scale * multiplier,
            normalSize.Y.Offset * multiplier
        )
    end

    local function tweenSize(size, duration)
        if activeTween then
            activeTween:Cancel()
        end
        activeTween = TweenService:Create(
            button,
            TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Size = size }
        )
        activeTween:Play()
    end

    button.MouseEnter:Connect(function()
        hovered = true
        tweenSize(scaledSize(1.04), 0.12)
    end)

    button.MouseLeave:Connect(function()
        hovered = false
        tweenSize(normalSize, 0.12)
    end)

    button.MouseButton1Down:Connect(function()
        tweenSize(scaledSize(0.96), 0.06)
    end)

    button.MouseButton1Up:Connect(function()
        tweenSize(hovered and scaledSize(1.04) or normalSize, 0.09)
    end)
end

Runtime.menuSize = rootGui:GetAttribute("MenuSize") or mainFrame.Size
local defaultOpenPosition = UDim2.fromScale(0.5, 0.475)
Runtime.windowRestPosition = defaultOpenPosition
Runtime.windowDragController = nil
local function offsetWindowPosition(position, yScale)
    return UDim2.new(
        position.X.Scale,
        position.X.Offset,
        position.Y.Scale + yScale,
        position.Y.Offset
    )
end
local function openingWindowPosition()
    return offsetWindowPosition(Runtime.windowRestPosition, 0.245)
end
local function closedWindowPosition()
    return UDim2.new(
        Runtime.windowRestPosition.X.Scale,
        Runtime.windowRestPosition.X.Offset,
        1.55,
        0
    )
end
local WINDOW_OPEN_DURATION = 0.34
local WINDOW_CLOSE_DURATION = 0.26
local animationLocked = false
local windowTween = nil
local windowTweenConnection = nil
local windowAnimationSerial = 0


Runtime.windowAnimating = false




















local ContentScale = {
    Base = Runtime.menuSize,
    Listeners = {},
    ReflowTabs = nil,
    X = 1,
    Y = 1,
}


function ContentScale.OnChanged(callback)
    table.insert(ContentScale.Listeners, callback)
    callback(ContentScale.X, ContentScale.Y)
    return callback
end

function ContentScale.Refresh()
    local function axisScale(baseValue, currentValue)
        if baseValue > 0 and currentValue > 0 then
            return math.max(1, currentValue / baseValue)
        end
        return 1
    end

    local nextX = axisScale(
        ContentScale.Base.X.Scale,
        Runtime.menuSize.X.Scale
    )
    local nextY = axisScale(
        ContentScale.Base.Y.Scale,
        Runtime.menuSize.Y.Scale
    )
    if math.abs(nextX - ContentScale.X) < 0.0001
        and math.abs(nextY - ContentScale.Y) < 0.0001
    then
        return
    end
    ContentScale.X = nextX
    ContentScale.Y = nextY

    for index = #ContentScale.Listeners, 1, -1 do
        local callback = ContentScale.Listeners[index]
        local ok, keep = pcall(callback, nextX, nextY)
        if not ok then
        elseif keep == false then
            table.remove(ContentScale.Listeners, index)
        end
    end
    if ContentScale.ReflowTabs then
        ContentScale.ReflowTabs()
    end
end









do
    local aspectConstraint = objects.obj24
    local ratio = aspectConstraint.AspectRatio
    
    
    
    
    aspectConstraint.Parent = nil

    
    
    local viewport = camera and camera.ViewportSize or Vector2.new(1280, 720)
    if viewport.X < 1 or viewport.Y < 1 then
        viewport = Vector2.new(1280, 720)
    end

    local topLeftInset, bottomRightInset = Vector2.new(0, 0), Vector2.new(0, 0)
    pcall(function()
        topLeftInset, bottomRightInset = GuiService:GetGuiInset()
    end)

    local regionX = math.max(
        viewport.X - topLeftInset.X - bottomRightInset.X,
        1
    )
    local regionY = math.max(
        viewport.Y - topLeftInset.Y - bottomRightInset.Y,
        1
    )

    local width = Runtime.menuSize.X.Scale * regionX
    local height = Runtime.menuSize.Y.Scale * regionY
    if ratio > 0 then
        if width / height > ratio then
            width = height * ratio
        else
            height = width / ratio
        end
    end

    
    
    
    if UserInputService.TouchEnabled
        and not UserInputService.KeyboardEnabled
        and not UserInputService.MouseEnabled
    then
        local mobileMultiplier = math.min(
            1.3,
            (regionX * 0.98) / math.max(width, 1),
            (regionY * 0.98) / math.max(height, 1)
        )
        width = width * mobileMultiplier
        height = height * mobileMultiplier
    end

    Runtime.menuSize = UDim2.fromScale(width / regionX, height / regionY)
    rootGui:SetAttribute("MenuSize", Runtime.menuSize)
    mainFrame.Size = Runtime.menuSize
    ContentScale.Base = Runtime.menuSize
end

local function setLeftCenterHidden(hidden)
    hudAnimationSerial = hudAnimationSerial + 1
    local serial = hudAnimationSerial
    cancelHudTween()

    if hidden then
        
        
        
        local savedRestorePosition = launcherGui:GetAttribute(
            "HudRestorePosition"
        )
        if typeof(savedRestorePosition) == "UDim2" then
            hudRestorePosition = savedRestorePosition
        end
        while hudRestorePosition.X.Scale <= -0.5 do
            hudRestorePosition = UDim2.new(
                hudRestorePosition.X.Scale + 1,
                hudRestorePosition.X.Offset,
                hudRestorePosition.Y.Scale,
                hudRestorePosition.Y.Offset
            )
        end
        launcherGui:SetAttribute(
            "HudRestorePosition",
            hudRestorePosition
        )
    elseif leftCenterFrame
        and launcherGui:GetAttribute("LeftCenterHiddenByLibrary") == true
    then
        leftCenterFrame.Visible = true
        launcherGui:SetAttribute("LeftCenterHiddenByLibrary", nil)
        if sourceLeftCenterScreen
            and launcherGui:GetAttribute(
                "LeftCenterScreenDisabledByLibrary"
            ) == true
        then
            sourceLeftCenterScreen.Enabled = true
            launcherGui:SetAttribute(
                "LeftCenterScreenDisabledByLibrary",
                nil
            )
        end
    end

    local target = hidden
        and shiftOneScreenLeft(hudRestorePosition)
        or hudRestorePosition
    refreshEffectiveLeftCenterHidden()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint)

    if leftCenterFrame then
        hudTween = TweenService:Create(
            leftCenterFrame,
            tweenInfo,
            { Position = target }
        )
        
        
        TweenService:Create(
            launcherRoot,
            tweenInfo,
            {
                Position = hudRestorePosition,
            }
        ):Play()
    else
        
        hudTween = TweenService:Create(
            launcherRoot,
            tweenInfo,
            {
                Position = hudRestorePosition,
            }
        )
    end
    local activeHudTween = hudTween
    hudTweenConnection = activeHudTween.Completed:Connect(function()
        if serial ~= hudAnimationSerial
            or hudTween ~= activeHudTween
        then
            return
        end
        
        
        if hudTweenConnection then
            hudTweenConnection:Disconnect()
            hudTweenConnection = nil
        end
        hudTween = nil

        local manuallyHidden =
            launcherGui:GetAttribute("QuickHudHidden") == true
        local shouldStayHidden = manuallyHidden or Runtime.chilliIsOpen
        if shouldStayHidden then
            if leftCenterFrame then
                leftCenterFrame.Position = shiftOneScreenLeft(
                    hudRestorePosition
                )
                if manuallyHidden then
                    leftCenterFrame.Visible = false
                    launcherGui:SetAttribute(
                        "LeftCenterHiddenByLibrary",
                        true
                    )
                end
            end
            launcherGui:SetAttribute(
                "HudRestorePosition",
                hudRestorePosition
            )
            if manuallyHidden and sourceLeftCenterScreen then
                sourceLeftCenterScreen.Enabled = false
                launcherGui:SetAttribute(
                    "LeftCenterScreenDisabledByLibrary",
                    true
                )
            end
        else
            if leftCenterFrame then
                leftCenterFrame.Position = hudRestorePosition
                if launcherGui:GetAttribute(
                    "LeftCenterHiddenByLibrary"
                ) == true then
                    leftCenterFrame.Visible = true
                    launcherGui:SetAttribute(
                        "LeftCenterHiddenByLibrary",
                        nil
                    )
                end
            end
            if sourceLeftCenterScreen
                and launcherGui:GetAttribute(
                    "LeftCenterScreenDisabledByLibrary"
                ) == true
            then
                sourceLeftCenterScreen.Enabled = true
                launcherGui:SetAttribute(
                    "LeftCenterScreenDisabledByLibrary",
                    nil
                )
            end
            launcherGui:SetAttribute("HudRestorePosition", nil)
        end
        launcherRoot.Position = hudRestorePosition
        refreshEffectiveLeftCenterHidden()
        queueChilliLauncherLayout()
    end)
    activeHudTween:Play()
end

local function cancelWindowTween()
    windowAnimationSerial = windowAnimationSerial + 1
    if windowTweenConnection then
        windowTweenConnection:Disconnect()
        windowTweenConnection = nil
    end
    if windowTween then
        windowTween:Cancel()
        windowTween = nil
    end
end

local function tweenWindowPosition(target, info, completed)
    cancelWindowTween()
    local serial = windowAnimationSerial
    local tween = TweenService:Create(mainFrame, info, {
        Position = target,
    })
    windowTween = tween
    windowTweenConnection = tween.Completed:Connect(function(playbackState)
        if serial ~= windowAnimationSerial or windowTween ~= tween then
            return
        end
        if windowTweenConnection then
            windowTweenConnection:Disconnect()
            windowTweenConnection = nil
        end
        windowTween = nil
        if playbackState == Enum.PlaybackState.Completed then
            completed()
        end
    end)
    tween:Play()
end

local function playOpenAnimation(completed)
    if Runtime.chilliIsOpen then
        return
    end
    local resumeFromCurrentPosition = windowTween ~= nil
    animationLocked = true
    Runtime.windowAnimating = true
    Runtime.chilliIsOpen = true
    setLeftCenterHidden(true)

    if not resumeFromCurrentPosition then
        mainFrame.Position = openingWindowPosition()
    end
    mainFrame.Size = Runtime.menuSize

    tweenWindowPosition(Runtime.windowRestPosition, TweenInfo.new(
        WINDOW_OPEN_DURATION,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    ), function()
        animationLocked = false
        Runtime.windowAnimating = false
        if completed then
            completed()
        end
    end)
end

local function playCloseAnimation()
    if not Runtime.chilliIsOpen then
        return
    end
    
    
    if Runtime.windowDragController then
        Runtime.windowDragController.Cancel()
    end
    animationLocked = true
    Runtime.windowAnimating = true
    Runtime.chilliIsOpen = false
    setLeftCenterHidden(
        launcherGui:GetAttribute("QuickHudHidden") == true
    )

    mainFrame.Size = Runtime.menuSize
    tweenWindowPosition(closedWindowPosition(), TweenInfo.new(
        WINDOW_CLOSE_DURATION,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.In
    ), function()
        animationLocked = false
        Runtime.windowAnimating = false
    end)
end















local RESIZE_LIMITS = {
    MinWidth = 0.20,
    MaxWidth = 0.98,
    MinHeight = 0.22,
    MaxHeight = 0.98,
}





local RESIZE_KEEPS_OPTION_WIDTH = false

local resizeGrip = Instance.new("TextButton")
resizeGrip.Name = "ResizeGrip"
resizeGrip.Active = true
resizeGrip.AutoButtonColor = false
resizeGrip.AnchorPoint = Vector2.new(1, 1)
resizeGrip.BackgroundTransparency = 1
resizeGrip.BorderSizePixel = 0
resizeGrip.Position = UDim2.fromScale(0.998, 0.995)
resizeGrip.Selectable = false
resizeGrip.Size = UDim2.fromScale(0.05, 0.05)
resizeGrip.Text = ""
resizeGrip.ZIndex = 120
resizeGrip.Parent = mainFrame

local resizeGripAspect = Instance.new("UIAspectRatioConstraint")
resizeGripAspect.AspectRatio = 1
resizeGripAspect.AspectType = Enum.AspectType.FitWithinMaxSize
resizeGripAspect.DominantAxis = Enum.DominantAxis.Width
resizeGripAspect.Parent = resizeGrip


local resizeGripBars = {}
for _, bar in ipairs({
    { 0.5, 0.5, 0.9 },
    { 0.68, 0.68, 0.54 },
    { 0.84, 0.84, 0.22 },
}) do
    local piece = Instance.new("Frame")
    piece.Name = "GripBar"
    piece.Active = false
    piece.AnchorPoint = Vector2.new(0.5, 0.5)
    piece.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    piece.BackgroundTransparency = 0.35
    piece.BorderSizePixel = 0
    piece.Position = UDim2.fromScale(bar[1], bar[2])
    piece.Rotation = -45
    piece.Size = UDim2.fromScale(bar[3], 0.13)
    piece.ZIndex = 121
    piece.Parent = resizeGrip
    table.insert(resizeGripBars, piece)
end

local function setResizeGripHighlight(highlighted)
    for _, piece in ipairs(resizeGripBars) do
        TweenService:Create(piece, TweenInfo.new(0.1), {
            BackgroundTransparency = highlighted and 0.05 or 0.35,
        }):Play()
    end
end

local resizeDragging = false
local resizeActiveTouch = nil
local resizeStartPointer = Vector2.new(0, 0)
local resizeStartSize = Vector2.new(0, 0)

local function applyResizeSize(widthPixels, heightPixels)
    local region = rootGui.AbsoluteSize
    if region.X <= 0 or region.Y <= 0 then
        return
    end
    Runtime.menuSize = UDim2.fromScale(
        math.clamp(
            widthPixels / region.X,
            RESIZE_LIMITS.MinWidth,
            RESIZE_LIMITS.MaxWidth
        ),
        math.clamp(
            heightPixels / region.Y,
            RESIZE_LIMITS.MinHeight,
            RESIZE_LIMITS.MaxHeight
        )
    )
    rootGui:SetAttribute("MenuSize", Runtime.menuSize)
    mainFrame.Size = Runtime.menuSize
    ContentScale.Refresh()
end

local function resizeFromInputPosition(position)
    local delta = Vector2.new(position.X, position.Y) - resizeStartPointer
    applyResizeSize(
        resizeStartSize.X + delta.X * 2,
        resizeStartSize.Y + delta.Y * 2
    )
end

resizeGrip.MouseEnter:Connect(function()
    setResizeGripHighlight(true)
end)

resizeGrip.MouseLeave:Connect(function()
    if not resizeDragging then
        setResizeGripHighlight(false)
    end
end)

resizeGrip.InputBegan:Connect(function(input)
    if resizeDragging or input.UserInputState ~= Enum.UserInputState.Begin then
        return
    end
    if input.UserInputType ~= Enum.UserInputType.MouseButton1
        and input.UserInputType ~= Enum.UserInputType.Touch
    then
        return
    end
    local pointer = Vector2.new(input.Position.X, input.Position.Y)
    local gripPosition = resizeGrip.AbsolutePosition
    local gripSize = resizeGrip.AbsoluteSize
    if pointer.X < gripPosition.X
        or pointer.X > gripPosition.X + gripSize.X
        or pointer.Y < gripPosition.Y
        or pointer.Y > gripPosition.Y + gripSize.Y
    then
        return
    end
    resizeDragging = true
    resizeActiveTouch = input.UserInputType == Enum.UserInputType.Touch
        and input
        or nil
    resizeStartPointer = Vector2.new(input.Position.X, input.Position.Y)
    resizeStartSize = mainFrame.AbsoluteSize
    setResizeGripHighlight(true)
end)

trackRootConnection(UserInputService.InputChanged:Connect(function(input)
    if not resizeDragging then
        return
    end
    if resizeActiveTouch then
        if input == resizeActiveTouch then
            resizeFromInputPosition(input.Position)
        end
    elseif input.UserInputType == Enum.UserInputType.MouseMovement then
        resizeFromInputPosition(input.Position)
    end
end))

trackRootConnection(UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input == resizeActiveTouch
    then
        if resizeDragging then
            resizeDragging = false
            resizeActiveTouch = nil
            setResizeGripHighlight(false)
        end
    end
end))


ContentScale.OnChanged(function(scaleX, scaleY)
    resizeGrip.Position = UDim2.fromScale(
        1 - 0.002 / scaleX,
        1 - 0.005 / scaleY
    )
    resizeGrip.Size = UDim2.fromScale(0.05 / scaleX, 0.05 / scaleY)
end)



ContentScale.OnChanged(function(scaleX, scaleY)
    topBar.Size = UDim2.new(1, 0, 0.125 / scaleY, 0)
    objects.obj12.Position = UDim2.new(
        0.06700000166893005 / scaleX,
        0,
        0.44999998807907104,
        0
    )
    objects.obj12.Size = UDim2.new(
        0.11656716465950012 / scaleX,
        0,
        1.1833335161209106,
        0
    )
    objects.obj9.Position = UDim2.new(
        0.5687711238861084 / scaleX,
        0,
        0.5,
        0
    )
    objects.obj9.Size = UDim2.new(
        0.8620089292526245 / scaleX,
        0,
        0.7499999403953552,
        0
    )
    objects.obj14.Position = UDim2.new(
        1 - 0.045000016689300537 / scaleX,
        0,
        0.4339999854564667,
        0
    )
    objects.obj14.Size = UDim2.new(
        0.06637302041053772 / scaleX,
        0,
        0.6588137149810791,
        0
    )
end)

local normalTextFont = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontWeight.ExtraBold,
    Enum.FontStyle.Normal
)

local italicTextFont = Font.new(
    "rbxasset://fonts/families/GothamSSm.json",
    Enum.FontWeight.ExtraBold,
    Enum.FontStyle.Italic
)

local shinyTextGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.486159176, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.519031167, Color3.fromRGB(221, 221, 221)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 236, 236)),
})

local blueStrokeGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 36, 84)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 31, 54)),
})

local function clearDirectGradients(container)
    for _, child in ipairs(container:GetChildren()) do
        if child:IsA("UIGradient") then
            child:Destroy()
        end
    end
end

local function getTextStroke(label)
    local stroke = label:FindFirstChildOfClass("UIStroke")
    if not stroke then
        stroke = Instance.new("UIStroke")
        stroke.Name = "UIStroke"
        stroke.Parent = label
    end
    return stroke
end

local function configureScaledStroke(stroke, color, thickness)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    stroke.Color = color
    stroke.Enabled = true
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Thickness = thickness
    stroke.Transparency = 0
    pcall(function()
        stroke.BorderOffset = UDim.new(0, 0)
        stroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
        stroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    end)
end

local function applyShinyTextStyle(label, fontFace)
    if fontFace then
        label.FontFace = fontFace
    end
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 1
    label.TextScaled = true
    label.LineHeight = 1

    clearDirectGradients(label)

    local stroke = getTextStroke(label)
    clearDirectGradients(stroke)
    configureScaledStroke(stroke, Color3.fromRGB(255, 255, 255), 0.06499999761581421)

    local strokeGradient = Instance.new("UIGradient")
    strokeGradient.Name = "StrokeStyleGradient"
    strokeGradient.Color = blueStrokeGradient
    strokeGradient.Offset = Vector2.new(0, 0)
    strokeGradient.Rotation = 90
    strokeGradient.Transparency = NumberSequence.new(0)
    strokeGradient.Parent = stroke

    local textGradient = Instance.new("UIGradient")
    textGradient.Name = "TextStyleGradient"
    textGradient.Color = shinyTextGradient
    textGradient.Offset = Vector2.new(0, 0)
    textGradient.Rotation = 90
    textGradient.Transparency = NumberSequence.new(0)
    textGradient.Parent = label
end

local function applyPlainTextStyle(label)
    label.FontFace = normalTextFont
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 1
    label.TextScaled = true
    label.LineHeight = 1

    clearDirectGradients(label)

    local stroke = getTextStroke(label)
    clearDirectGradients(stroke)
    configureScaledStroke(stroke, Color3.fromRGB(0, 0, 0), 0.07999999821186066)
end

local rebirthOuterGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194)),
    ColorSequenceKeypoint.new(0.0570934266, Color3.fromRGB(255, 132, 123)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 28, 28)),
})

local rebirthInnerGradient = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194)),
    ColorSequenceKeypoint.new(0.0155709349, Color3.fromRGB(255, 132, 123)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 28, 28)),
})

local function addRedGradient(parent, name, color)
    local gradient = Instance.new("UIGradient")
    gradient.Name = name
    gradient.Color = color
    gradient.Rotation = 90
    gradient.Parent = parent
    return gradient
end

local function addScaledStroke(parent, mode, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = mode
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Thickness = thickness
    stroke.Transparency = 0
    pcall(function()
        stroke.BorderOffset = UDim.new(0, 0)
        stroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
        stroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    end)
    stroke.Parent = parent
    return stroke
end

local function createRebirthStyleButton(parent, text, layoutOrder)
    local button = Instance.new("TextButton")
    button.Name = text
    button.Active = true
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.AutoButtonColor = false
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.LayoutOrder = layoutOrder
    button.Size = UDim2.new(1, 0, 0.130, 0)
    button.Text = ""
    button.ZIndex = 99
    button.Parent = parent

    local buttonScale = Instance.new("UIScale")
    buttonScale.Scale = 1
    buttonScale.Parent = button

    local base = Instance.new("Frame")
    base.Name = "Main"
    base.Active = false
    base.AnchorPoint = Vector2.new(0.5, 0.5)
    base.BackgroundColor3 = Color3.fromRGB(175, 0, 0)
    base.BorderSizePixel = 0
    base.Position = UDim2.fromScale(0.5, 0.5)
    base.Size = UDim2.fromScale(1, 0.92)
    base.ZIndex = 1
    base.Parent = button
    addScaledStroke(base, Enum.ApplyStrokeMode.Border, 0.0599999987)

    local colorFrame = Instance.new("Frame")
    colorFrame.Name = "ColorFrame"
    colorFrame.Active = false
    colorFrame.AnchorPoint = Vector2.new(0.5, 0)
    colorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    colorFrame.BorderSizePixel = 0
    colorFrame.Position = UDim2.fromScale(0.5, 0)
    colorFrame.Size = UDim2.fromScale(1, 0.9)
    colorFrame.ZIndex = 1
    colorFrame.Parent = base
    addRedGradient(colorFrame, "RedGradient", rebirthOuterGradient)

    local highlight = Instance.new("Frame")
    highlight.Name = "Transparent"
    highlight.Active = false
    highlight.AnchorPoint = Vector2.new(0.5, 0.5)
    highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    highlight.BorderSizePixel = 0
    highlight.Position = UDim2.fromScale(0.5, 0.5)
    highlight.Size = UDim2.fromScale(0.965, 0.88)
    highlight.ZIndex = 2
    highlight.Parent = colorFrame
    addRedGradient(highlight, "RedGradient", rebirthInnerGradient)

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Active = false
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Position = UDim2.fromScale(0.5, 0.5)
    label.Size = UDim2.fromScale(0.94, 0.72)
    label.Text = text
    label.ZIndex = 6
    label.Parent = colorFrame
    applyShinyTextStyle(label, normalTextFont)

    local activeTween
    local hovered = false
    local function tweenScale(value, duration)
        if activeTween then
            activeTween:Cancel()
        end
        activeTween = TweenService:Create(
            buttonScale,
            TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Scale = value }
        )
        activeTween:Play()
    end

    button.MouseEnter:Connect(function()
        hovered = true
        tweenScale(1.035, 0.1)
    end)
    button.MouseLeave:Connect(function()
        hovered = false
        tweenScale(1, 0.1)
    end)
    button.MouseButton1Down:Connect(function()
        tweenScale(0.96, 0.055)
    end)
    button.MouseButton1Up:Connect(function()
        tweenScale(hovered and 1.035 or 1, 0.08)
    end)

    return button
end

local sideButtons = Instance.new("Frame")
sideButtons.Name = "SideButtons"
sideButtons.Active = false
sideButtons.AnchorPoint = Vector2.new(1, 0.5)
sideButtons.BackgroundTransparency = 1
sideButtons.BorderSizePixel = 0



sideButtons.Position = UDim2.new(-0.025, 0, 0.558, 0)
sideButtons.Size = UDim2.new(0.2612044513, 0, 1, 0)
sideButtons.ZIndex = 99
sideButtons.Parent = mainFrame














local ACCENT_GRADIENT = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 255, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 109, 0)),
})


local ROW_ASPECT = 10
local ROW_WIDTH_SCALE = 0.97





local CONTROL_LAYOUT = {
    NarrowWidth = 0.20062215626239776,
    NarrowCenterX = 0.8846889218690012,
    WideWidth = 0.28,
    WideCenterX = 0.845,
}



local CHEVRON_COLOR = Color3.fromRGB(58, 255, 55)


local UNIT_CHEVRON_COLOR = Color3.fromRGB(255, 255, 255)


local MAX_CHIPS_PER_LINE = 4




local BALANCE_CHIP_LINES = false



local ACCENT_WIDTH_RATIO = 0.17



local SEARCH_MIN_OPTIONS = 5




local ROW_ASPECT_WITH_NOTE = 7.5




local NOTE_TITLE_SCALE = 0.9

local function addAccentGradient(parent)
    local gradient = Instance.new("UIGradient")
    gradient.Name = "AccentGradient"
    gradient.Color = ACCENT_GRADIENT
    gradient.Rotation = 90
    gradient.Parent = parent
    return gradient
end

local function attachScaleFeedback(button, hoverScale, pressScale)
    local scale = button:FindFirstChildOfClass("UIScale")
    if not scale then
        scale = Instance.new("UIScale")
        scale.Name = "InteractionScale"
        scale.Scale = 1
        scale.Parent = button
    end

    local activeTween
    local hovered = false

    local function play(value, duration)
        if activeTween then
            activeTween:Cancel()
        end
        activeTween = TweenService:Create(
            scale,
            TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Scale = value }
        )
        activeTween:Play()
    end

    button.MouseEnter:Connect(function()
        hovered = true
        play(hoverScale, 0.1)
    end)
    button.MouseLeave:Connect(function()
        hovered = false
        play(1, 0.1)
    end)
    button.MouseButton1Down:Connect(function()
        play(pressScale, 0.055)
    end)
    button.MouseButton1Up:Connect(function()
        play(hovered and hoverScale or 1, 0.08)
    end)

    return scale
end


local function buildRowPlate(parent, labelText)
    local main = Instance.new("Frame")
    main.Name = "Main"
    main.Active = false
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    main.BackgroundTransparency = 0.5
    main.BorderSizePixel = 0
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.Size = UDim2.fromScale(1, 0.85)
    main.ZIndex = 3
    main.Parent = parent
    addScaledStroke(main, Enum.ApplyStrokeMode.Border, 0.05)

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Active = false
    label.AnchorPoint = Vector2.new(0, 0.5)
    label.BackgroundTransparency = 1
    label.BorderSizePixel = 0
    label.Position = UDim2.fromScale(0.025, 0.5)
    
    
    label.Size = UDim2.fromScale(0.65, 0.64)
    label.Text = labelText
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.ZIndex = 5
    label.Parent = main
    applyPlainTextStyle(label)

    return main, label
end


local function buildFixedRow(name, labelText)
    local row = Instance.new("Frame")
    row.Name = name
    row.Active = false
    row.AnchorPoint = Vector2.new(0.5, 0.5)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.Position = UDim2.fromScale(0.5, 0.5)
    row.Size = UDim2.fromScale(ROW_WIDTH_SCALE, 0.6)
    row.ZIndex = 3

    local aspect = Instance.new("UIAspectRatioConstraint")
    aspect.AspectRatio = ROW_ASPECT
    aspect.AspectType = Enum.AspectType.FitWithinMaxSize
    aspect.DominantAxis = Enum.DominantAxis.Width
    aspect.Parent = row

    local main, label = buildRowPlate(row, labelText)
    return row, main, label
end




Runtime.activeDropdownCloser = nil

local function closeActiveDropdown()
    if Runtime.activeDropdownCloser then
        Runtime.activeDropdownCloser()
    end
end










local function createDropdownRow(
    name,
    labelText,
    options,
    defaultIndex,
    multiSelect,
    action,
    noteText
)
    local row = Instance.new("Frame")
    row.Name = name
    row.Active = false
    row.AnchorPoint = Vector2.new(0.5, 0.5)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    
    
    
    row.ClipsDescendants = false
    row.Position = UDim2.fromScale(0.5, 0.5)
    row.Size = UDim2.new(ROW_WIDTH_SCALE, 0, 0, 0)
    row.ZIndex = 3

    local head = Instance.new("Frame")
    head.Name = "Head"
    head.Active = false
    head.AnchorPoint = Vector2.new(0.5, 0)
    head.BackgroundTransparency = 1
    head.BorderSizePixel = 0
    head.Position = UDim2.fromScale(0.5, 0)
    head.Size = UDim2.new(1, 0, 0, 0)
    head.ZIndex = 3
    head.Parent = row

    local main, titleLabel = buildRowPlate(head, labelText)

    local box = Instance.new("TextButton")
    box.Name = "Dropdown"
    box.Active = true
    box.AutoButtonColor = false
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    box.BackgroundTransparency = 0.6
    box.BorderSizePixel = 0
    box.Position = UDim2.fromScale(CONTROL_LAYOUT.WideCenterX, 0.5)
    box.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62)
    box.Text = ""
    box.ZIndex = 6
    box.Parent = main
    addScaledStroke(box, Enum.ApplyStrokeMode.Border, 0.1)
    attachScaleFeedback(box, 1.025, 0.975)

    local currentNote = tostring(noteText or "")
    local noteVScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local boxLeft = CONTROL_LAYOUT.WideCenterX - CONTROL_LAYOUT.WideWidth / 2

    local noteLabel = Instance.new("TextLabel")
    noteLabel.Name = "Note"
    noteLabel.Active = false
    noteLabel.AnchorPoint = Vector2.new(0, 0.5)
    noteLabel.BackgroundTransparency = 1
    noteLabel.BorderSizePixel = 0
    noteLabel.Position = UDim2.fromScale(0.025, 0.755)
    noteLabel.Size = UDim2.fromScale(math.max(0.3, boxLeft - 0.045), 0.3)
    noteLabel.Text = currentNote
    noteLabel.TextWrapped = false
    noteLabel.TextXAlignment = Enum.TextXAlignment.Left
    noteLabel.TextYAlignment = Enum.TextYAlignment.Center
    noteLabel.Visible = false
    noteLabel.ZIndex = 5
    noteLabel.Parent = main
    applyPlainTextStyle(noteLabel)
    noteLabel.TextTransparency = 0.32

    local noteStroke = noteLabel:FindFirstChildOfClass("UIStroke")
    if noteStroke then
        noteStroke.Thickness = 0.06
        noteStroke.Transparency = 0.2
    end

    local function applyNoteLayout()
        local hasNote = currentNote ~= ""
        noteLabel.Text = currentNote
        noteLabel.Visible = hasNote
        if hasNote then
            titleLabel.Position = UDim2.fromScale(0.025, 0.34)
            titleLabel.Size = UDim2.fromScale(0.65, 0.64 * noteVScale * NOTE_TITLE_SCALE)
            box.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62 * noteVScale)
        else
            titleLabel.Position = UDim2.fromScale(0.025, 0.5)
            titleLabel.Size = UDim2.fromScale(0.65, 0.64)
            box.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62)
        end
    end
    applyNoteLayout()

    local value = Instance.new("TextLabel")
    value.Name = "Value"
    value.Active = false
    value.AnchorPoint = Vector2.new(0.5, 0.5)
    value.BackgroundTransparency = 1
    value.BorderSizePixel = 0
    
    value.Position = UDim2.fromScale(0.405, 0.5)
    value.Size = UDim2.fromScale(0.7, 0.58)
    value.Text = options[defaultIndex] or options[1]
    value.TextWrapped = true
    value.TextXAlignment = Enum.TextXAlignment.Center
    value.TextYAlignment = Enum.TextYAlignment.Center
    value.ZIndex = 7
    value.Parent = box
    applyPlainTextStyle(value)

    
    local divider = Instance.new("Frame")
    divider.Name = "Divider"
    divider.Active = false
    divider.AnchorPoint = Vector2.new(0.5, 0.5)
    divider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    divider.BackgroundTransparency = 0.3
    divider.BorderSizePixel = 0
    divider.Position = UDim2.fromScale(0.8, 0.5)
    divider.Size = UDim2.fromScale(0.014, 0.66)
    divider.ZIndex = 7
    divider.Parent = box

    local caret = Instance.new("Frame")
    caret.Name = "Caret"
    caret.Active = false
    caret.AnchorPoint = Vector2.new(0.5, 0.5)
    caret.BackgroundTransparency = 1
    caret.BorderSizePixel = 0
    caret.Position = UDim2.fromScale(0.888, 0.5)
    caret.Size = UDim2.fromScale(0.16, 0.56)
    caret.ZIndex = 7
    caret.Parent = box

    local caretAspect = Instance.new("UIAspectRatioConstraint")
    caretAspect.AspectRatio = 1
    caretAspect.AspectType = Enum.AspectType.FitWithinMaxSize
    caretAspect.DominantAxis = Enum.DominantAxis.Height
    caretAspect.Parent = caret

    
    
    
    
    
    for _, arm in ipairs({ { 0.335355, 45 }, { 0.664645, -45 } }) do
        local piece = Instance.new("Frame")
        piece.Name = "Arm"
        piece.Active = false
        piece.AnchorPoint = Vector2.new(0.5, 0.5)
        piece.BackgroundColor3 = CHEVRON_COLOR
        piece.BorderSizePixel = 0
        piece.Position = UDim2.fromScale(arm[1], 0.535355)
        piece.Rotation = arm[2]
        piece.Size = UDim2.fromScale(0.6657, 0.2)
        piece.ZIndex = 8
        piece.Parent = caret
    end

    
    
    
    
    
    
    
    
    local menuClip = Instance.new("Frame")
    menuClip.Name = "Menu"
    menuClip.Active = false
    menuClip.AnchorPoint = Vector2.new(0.5, 0)
    menuClip.BackgroundTransparency = 1
    menuClip.BorderSizePixel = 0
    menuClip.ClipsDescendants = true
    menuClip.Position = UDim2.new(0.5, 0, 0, 0)
    menuClip.Size = UDim2.new(1, 0, 0, 0)
    menuClip.ZIndex = 6
    menuClip.Parent = row

    
    local searchField, searchBox
    if #options >= SEARCH_MIN_OPTIONS then
        searchField = Instance.new("Frame")
        searchField.Name = "Search"
        searchField.Active = false
        searchField.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        searchField.BackgroundTransparency = 0.6
        searchField.BorderSizePixel = 0
        searchField.Position = UDim2.new(0, 0, 0, 0)
        searchField.Size = UDim2.new(0, 0, 0, 0)
        searchField.ZIndex = 7
        searchField.Parent = menuClip
        addScaledStroke(searchField, Enum.ApplyStrokeMode.Border, 0.07)

        searchBox = Instance.new("TextBox")
        searchBox.Name = "Input"
        searchBox.Active = true
        searchBox.AnchorPoint = Vector2.new(0.5, 0.5)
        searchBox.BackgroundTransparency = 1
        searchBox.BorderSizePixel = 0
        searchBox.ClearTextOnFocus = false
        searchBox.MultiLine = false
        searchBox.Position = UDim2.fromScale(0.5, 0.5)
        searchBox.Size = UDim2.fromScale(0.94, 0.56)
        searchBox.Text = ""
        searchBox.PlaceholderText = "Search..."
        searchBox.PlaceholderColor3 = Color3.fromRGB(198, 198, 198)
        searchBox.TextXAlignment = Enum.TextXAlignment.Center
        searchBox.TextYAlignment = Enum.TextYAlignment.Center
        searchBox.ZIndex = 9
        searchBox.Parent = searchField
        applyPlainTextStyle(searchBox)
    end

    local emptyLabel = Instance.new("TextLabel")
    emptyLabel.Name = "Empty"
    emptyLabel.Active = false
    emptyLabel.BackgroundTransparency = 1
    emptyLabel.BorderSizePixel = 0
    emptyLabel.Position = UDim2.new(0, 0, 0, 0)
    emptyLabel.Size = UDim2.new(0, 0, 0, 0)
    emptyLabel.Text = "No match"
    emptyLabel.Visible = false
    emptyLabel.ZIndex = 9
    emptyLabel.Parent = menuClip
    applyPlainTextStyle(emptyLabel)
    emptyLabel.TextTransparency = 0.4

    local currentIndex = type(defaultIndex) == "number" and defaultIndex or 1
    local selected = {}
    if multiSelect and type(defaultIndex) == "table" then
        for _, choice in ipairs(defaultIndex) do
            local choiceIndex = nil
            if type(choice) == "number" then
                choiceIndex = math.clamp(math.floor(choice), 1, #options)
            else
                for index, option in ipairs(options) do
                    if option == tostring(choice) then
                        choiceIndex = index
                        break
                    end
                end
            end
            if choiceIndex then
                selected[choiceIndex] = true
            end
        end
    else
        selected[currentIndex] = true
    end

    local function getControllerValue()
        if not multiSelect then
            return options[currentIndex], currentIndex
        end
        local values = {}
        local indices = {}
        for index = 1, #options do
            if selected[index] then
                table.insert(values, options[index])
                table.insert(indices, index)
            end
        end
        return values, indices
    end

    local items = {}
    local visibleItems = {}
    local searchQuery = ""
    local isOpen = false
    local setOpen
    local refreshSelection
    local accentWidth = 0

    
    
    local hintLabel = nil
    local applyButton = nil
    local applyCaption = nil
    local applyCaptionStroke = nil
    local applyLayers = nil
    local applyBaseText = ""
    local applyReady = true
    if action then
        applyBaseText = tostring(action.ButtonText or "Apply")

        
        
        hintLabel = Instance.new("TextLabel")
        hintLabel.Name = "Hint"
        hintLabel.Active = false
        hintLabel.BackgroundTransparency = 1
        hintLabel.BorderSizePixel = 0
        hintLabel.Position = UDim2.new(0, 0, 0, 0)
        hintLabel.Size = UDim2.new(0, 0, 0, 0)
        hintLabel.Text = tostring(action.Hint or "")
        hintLabel.TextWrapped = true
        hintLabel.TextXAlignment = Enum.TextXAlignment.Center
        hintLabel.TextYAlignment = Enum.TextYAlignment.Center
        hintLabel.ZIndex = 9
        hintLabel.Parent = menuClip
        applyPlainTextStyle(hintLabel)
        hintLabel.TextTransparency = 0.28

        
        
        
        applyButton = Instance.new("TextButton")
        applyButton.Name = "Apply"
        applyButton.Active = true
        applyButton.AutoButtonColor = false
        
        
        applyButton.AnchorPoint = Vector2.new(0.5, 0.5)
        applyButton.BackgroundTransparency = 1
        applyButton.BorderSizePixel = 0
        applyButton.Position = UDim2.new(0, 0, 0, 0)
        applyButton.Size = UDim2.new(0, 0, 0, 0)
        applyButton.Text = ""
        applyButton.ZIndex = 9
        applyButton.Parent = menuClip
        attachScaleFeedback(applyButton, 1.03, 0.96)

        local applyBase = Instance.new("Frame")
        applyBase.Name = "Main"
        applyBase.Active = false
        applyBase.AnchorPoint = Vector2.new(0.5, 0.5)
        applyBase.BackgroundColor3 = Color3.fromRGB(175, 0, 0)
        applyBase.BorderSizePixel = 0
        applyBase.Position = UDim2.fromScale(0.5, 0.5)
        applyBase.Size = UDim2.fromScale(1, 1)
        applyBase.ZIndex = 10
        applyBase.Parent = applyButton
        addScaledStroke(applyBase, Enum.ApplyStrokeMode.Border, 0.07)

        local applyColor = Instance.new("Frame")
        applyColor.Name = "ColorFrame"
        applyColor.Active = false
        applyColor.AnchorPoint = Vector2.new(0.5, 0)
        applyColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        applyColor.BorderSizePixel = 0
        applyColor.Position = UDim2.fromScale(0.5, 0)
        applyColor.Size = UDim2.fromScale(1, 0.9)
        applyColor.ZIndex = 11
        applyColor.Parent = applyBase
        addRedGradient(applyColor, "RedGradient", rebirthOuterGradient)

        local applyHighlight = Instance.new("Frame")
        applyHighlight.Name = "Transparent"
        applyHighlight.Active = false
        applyHighlight.AnchorPoint = Vector2.new(0.5, 0.5)
        applyHighlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        applyHighlight.BorderSizePixel = 0
        applyHighlight.Position = UDim2.fromScale(0.5, 0.5)
        applyHighlight.Size = UDim2.fromScale(0.965, 0.88)
        applyHighlight.ZIndex = 12
        applyHighlight.Parent = applyColor
        addRedGradient(applyHighlight, "RedGradient", rebirthInnerGradient)

        applyCaption = Instance.new("TextLabel")
        applyCaption.Name = "Label"
        applyCaption.Active = false
        applyCaption.AnchorPoint = Vector2.new(0.5, 0.5)
        applyCaption.BackgroundTransparency = 1
        applyCaption.BorderSizePixel = 0
        applyCaption.Position = UDim2.fromScale(0.5, 0.5)
        applyCaption.Size = UDim2.fromScale(0.88, 0.56)
        applyCaption.Text = applyBaseText
        applyCaption.TextWrapped = true
        applyCaption.ZIndex = 13
        applyCaption.Parent = applyColor
        applyShinyTextStyle(applyCaption, normalTextFont)
        
        
        applyCaptionStroke = applyCaption:FindFirstChildOfClass("UIStroke")

        applyLayers = { applyColor, applyHighlight }

        connectSafeActivation(applyButton, function()
            
            
            if multiSelect and not applyReady then
                return
            end
            local values, indices = getControllerValue()
            setOpen(false)
            if type(action.OnApply) == "function" then
                action.OnApply(values, indices)
            end
        end)
    end

    local function describeSelection()
        if not multiSelect then
            return options[currentIndex] or ""
        end
        local picked = {}
        for index = 1, #options do
            if selected[index] then
                table.insert(picked, options[index])
            end
        end
        if #picked == 0 then
            return "None"
        elseif #picked == 1 then
            return picked[1]
        end
        return #picked .. " selected"
    end

    for index, optionText in ipairs(options) do
        local item = Instance.new("TextButton")
        item.Name = "Option" .. index
        item.Active = true
        item.AutoButtonColor = false
        item.AnchorPoint = Vector2.new(0, 0)
        item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        item.BackgroundTransparency = 0.45
        item.BorderSizePixel = 0
        item.LayoutOrder = index
        item.Position = UDim2.new(0, 0, 0, 0)
        item.Size = UDim2.new(0, 0, 0, 0)
        item.Text = ""
        item.ZIndex = 7
        item.Parent = menuClip
        addScaledStroke(item, Enum.ApplyStrokeMode.Border, 0.07)

        
        local accent
        if not multiSelect then
            accent = Instance.new("Frame")
            accent.Name = "Accent"
            accent.Active = false
            accent.AnchorPoint = Vector2.new(0, 0.5)
            accent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            accent.BorderSizePixel = 0
            accent.Position = UDim2.fromScale(0, 0.5)
            accent.Size = UDim2.fromScale(0, 1)
            accent.ZIndex = 8
            accent.Parent = item
            addAccentGradient(accent)
        end

        
        local tickFill
        if multiSelect then
            local tickBox = Instance.new("Frame")
            tickBox.Name = "Tick"
            tickBox.Active = false
            tickBox.AnchorPoint = Vector2.new(0, 0.5)
            tickBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            tickBox.BackgroundTransparency = 0.3
            tickBox.BorderSizePixel = 0
            tickBox.Position = UDim2.fromScale(0.055, 0.5)
            tickBox.Size = UDim2.fromScale(0.16, 0.44)
            tickBox.ZIndex = 8
            tickBox.Parent = item
            addScaledStroke(tickBox, Enum.ApplyStrokeMode.Border, 0.12)

            local tickAspect = Instance.new("UIAspectRatioConstraint")
            tickAspect.AspectRatio = 1
            tickAspect.AspectType = Enum.AspectType.FitWithinMaxSize
            tickAspect.DominantAxis = Enum.DominantAxis.Height
            tickAspect.Parent = tickBox

            tickFill = Instance.new("Frame")
            tickFill.Name = "Fill"
            tickFill.Active = false
            tickFill.AnchorPoint = Vector2.new(0.5, 0.5)
            tickFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tickFill.BorderSizePixel = 0
            tickFill.Position = UDim2.fromScale(0.5, 0.5)
            tickFill.Size = UDim2.fromScale(0, 0)
            tickFill.ZIndex = 9
            tickFill.Parent = tickBox
            addAccentGradient(tickFill)
        end

        
        
        local text = Instance.new("TextLabel")
        text.Name = "Label"
        text.Active = false
        
        
        text.AnchorPoint = Vector2.new(0.5, 0.5)
        text.BackgroundTransparency = 1
        text.BorderSizePixel = 0
        text.Position = UDim2.fromScale(multiSelect and 0.56 or 0.5, 0.5)
        text.Size = UDim2.fromScale(multiSelect and 0.62 or 0.78, 0.56)
        text.Text = optionText
        text.TextWrapped = true
        text.TextXAlignment = Enum.TextXAlignment.Center
        text.TextYAlignment = Enum.TextYAlignment.Center
        text.ZIndex = 9
        text.Parent = item
        applyPlainTextStyle(text)

        local hovered = false

        local function isChosen()
            if multiSelect then
                return selected[index] == true
            end
            return currentIndex == index
        end

        local function paint(animated)
            local chosen = isChosen()
            if not animated then
                if accent then
                    accent.Size = UDim2.new(0, chosen and accentWidth or 0, 1, 0)
                end
                item.BackgroundTransparency = chosen and 0.2 or (hovered and 0.3 or 0.45)
                if tickFill then
                    tickFill.Size = UDim2.fromScale(chosen and 0.85 or 0, chosen and 0.85 or 0)
                end
                text.TextTransparency = chosen and 0 or 0.15
                return
            end
            local info = TweenInfo.new(
                animated and 0.12 or 0,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            )
            if accent then
                TweenService:Create(accent, info, {
                    Size = UDim2.new(0, chosen and accentWidth or 0, 1, 0),
                }):Play()
            end
            TweenService:Create(item, info, {
                BackgroundTransparency = chosen and 0.2 or (hovered and 0.3 or 0.45),
            }):Play()
            if tickFill then
                TweenService:Create(tickFill, info, {
                    Size = UDim2.fromScale(chosen and 0.85 or 0, chosen and 0.85 or 0),
                }):Play()
            end
            text.TextTransparency = chosen and 0 or 0.15
        end

        item.MouseEnter:Connect(function()
            hovered = true
            paint(true)
        end)
        item.MouseLeave:Connect(function()
            hovered = false
            paint(true)
        end)

        connectSafeActivation(item, function()
            if multiSelect then
                if selected[index] then
                    selected[index] = nil
                else
                    selected[index] = true
                end
                refreshSelection(true)
            else
                currentIndex = index
                refreshSelection(true)
                
                
                if not action then
                    setOpen(false)
                end
            end
        end)

        items[index] = { button = item, paint = paint }
    end

    refreshSelection = function(animated)
        for _, entry in ipairs(items) do
            entry.paint(animated)
        end
        value.Text = describeSelection()
        if applyButton then
            local picked = 0
            if multiSelect then
                for index = 1, #options do
                    if selected[index] then
                        picked = picked + 1
                    end
                end
            elseif options[currentIndex] then
                picked = 1
            end
            
            
            applyCaption.Text = (multiSelect and picked > 0)
                    and (applyBaseText .. " (" .. picked .. ")")
                or applyBaseText
            applyReady = picked > 0
            
            
            local dim = applyReady and 0 or 0.45
            applyCaption.TextTransparency = dim
            if applyCaptionStroke then
                applyCaptionStroke.Transparency = dim
            end
            for _, layer in ipairs(applyLayers) do
                layer.BackgroundTransparency = dim
            end
        end
    end

    
    
    local function applyFilter()
        local query = searchQuery:lower()
        visibleItems = {}
        for index, entry in ipairs(items) do
            local matched = query == ""
                or options[index]:lower():find(query, 1, true) ~= nil
            entry.button.Visible = matched
            if matched then
                table.insert(visibleItems, entry)
            end
        end
        emptyLabel.Visible = #visibleItems == 0
    end

    local heightTween
    local menuTween
    local headHeight, menuHeight, gapSize, clipMargin = 0, 0, 0, 0

    
    
    local function applyOpenState(animated)
        if heightTween then
            heightTween:Cancel()
            heightTween = nil
        end
        if menuTween then
            menuTween:Cancel()
            menuTween = nil
        end

        local rowSize = UDim2.new(
            row.Size.X.Scale,
            row.Size.X.Offset,
            0,
            headHeight + (isOpen and (gapSize + menuHeight) or 0)
        )
        local clipSize = UDim2.new(
            1,
            clipMargin * 2,
            0,
            isOpen and (menuHeight + clipMargin * 2) or 0
        )

        if isOpen then
            menuClip.Visible = true
        end
        if animated then
            local info = TweenInfo.new(0.26, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            heightTween = TweenService:Create(row, info, { Size = rowSize })
            menuTween = TweenService:Create(menuClip, info, { Size = clipSize })
            if not isOpen then
                menuTween.Completed:Connect(function(state)
                    if state == Enum.PlaybackState.Completed and not isOpen then
                        menuClip.Visible = false
                    end
                end)
            end
            heightTween:Play()
            menuTween:Play()
        else
            row.Size = rowSize
            menuClip.Size = clipSize
            menuClip.Visible = isOpen
        end
    end

    local function refreshGeometry(animated)
        local width = row.AbsoluteSize.X
        if width <= 0 then
            return
        end

        
        
        local referenceWidth = width
        if not RESIZE_KEEPS_OPTION_WIDTH then
            referenceWidth = width / ContentScale.X
        end
        local band = referenceWidth / ROW_ASPECT
        headHeight = currentNote ~= "" and referenceWidth / ROW_ASPECT_WITH_NOTE or band
        local chipHeight = band * 0.62
        local count = #visibleItems
        
        clipMargin = chipHeight * 0.12

        
        
        
        
        local plateInset = headHeight * 0.075
        gapSize = band * 0.15
        local gap = gapSize

        accentWidth = chipHeight * ACCENT_WIDTH_RATIO
        head.Size = UDim2.new(1, 0, 0, headHeight)
        
        
        
        menuClip.Position = UDim2.new(
            0.5,
            0,
            0,
            headHeight - plateInset + gap - clipMargin
        )

        if not isOpen and not animated then
            applyOpenState(false)
            return
        end

        local hintBlock = 0
        if hintLabel then
            local hintHeight = chipHeight * 0.8
            hintBlock = hintHeight + gap
            hintLabel.Position = UDim2.new(0, clipMargin, 0, clipMargin)
            hintLabel.Size = UDim2.new(0, width, 0, hintHeight)
        end

        
        local searchBlock = 0
        if searchField then
            searchBlock = chipHeight + gap
            searchField.Position = UDim2.new(
                0,
                clipMargin,
                0,
                clipMargin + hintBlock
            )
            searchField.Size = UDim2.new(0, width, 0, chipHeight)
        end
        local chipsTop = clipMargin + hintBlock + searchBlock

        if count == 0 then
            
            
            emptyLabel.Position = UDim2.new(0, clipMargin, 0, chipsTop)
            emptyLabel.Size = UDim2.new(0, width, 0, chipHeight)
            menuHeight = hintBlock + searchBlock + chipHeight
        else
            
            
            local minChipWidth = chipHeight * 2.2
            local fitPerLine = math.floor((width + gap) / (minChipWidth + gap))
            local perLine = math.clamp(
                math.min(MAX_CHIPS_PER_LINE, fitPerLine),
                1,
                count
            )
            local lines = math.ceil(count / perLine)
            if BALANCE_CHIP_LINES then
                perLine = math.ceil(count / lines)
            end

            local chipWidth = (width - (perLine - 1) * gap) / perLine
            menuHeight = hintBlock
                + searchBlock
                + lines * chipHeight
                + math.max(lines - 1, 0) * gap

            for index, entry in ipairs(visibleItems) do
                local line = math.floor((index - 1) / perLine)
                local column = (index - 1) % perLine
                
                local inThisLine = math.min(perLine, count - line * perLine)
                local lineWidth = inThisLine * chipWidth + (inThisLine - 1) * gap
                entry.button.Position = UDim2.new(
                    0,
                    clipMargin + (width - lineWidth) / 2 + column * (chipWidth + gap),
                    0,
                    chipsTop + line * (chipHeight + gap)
                )
                entry.button.Size = UDim2.new(0, chipWidth, 0, chipHeight)
            end
        end

        
        
        if applyButton then
            local applyWidth = math.min(
                width,
                math.max(chipHeight * 3.6, width * 0.42)
            )
            
            applyButton.Position = UDim2.new(
                0,
                clipMargin + width / 2,
                0,
                clipMargin + menuHeight + gap + chipHeight / 2
            )
            applyButton.Size = UDim2.new(0, applyWidth, 0, chipHeight)
            menuHeight = menuHeight + gap + chipHeight
        end

        
        refreshSelection(false)

        applyOpenState(animated)
    end

    setOpen = function(open)
        if isOpen == open then
            return
        end
        if open then
            
            closeActiveDropdown()
            
            if searchBox then
                searchBox.Text = ""
            end
            searchQuery = ""
            applyFilter()
        elseif searchBox then
            searchBox:ReleaseFocus()
        end
        isOpen = open
        Runtime.activeDropdownCloser = open and function()
            setOpen(false)
        end or nil

        TweenService:Create(
            caret,
            TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Rotation = open and 180 or 0 }
        ):Play()
        TweenService:Create(box, TweenInfo.new(0.16), {
            BackgroundTransparency = open and 0.42 or 0.6,
        }):Play()

        refreshGeometry(true)
    end

    if searchBox then
        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            searchQuery = searchBox.Text:match("^%s*(.-)%s*$") or ""
            applyFilter()
            refreshGeometry(true)
        end)
    end

    connectSafeActivation(box, function()
        setOpen(not isOpen)
    end)

    local lastWidth = 0
    row:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        local width = row.AbsoluteSize.X
        if math.abs(width - lastWidth) < 0.5 then
            return
        end
        lastWidth = width
        refreshGeometry(false)
    end)

    task.defer(function()
        RunService.RenderStepped:Wait()
        lastWidth = row.AbsoluteSize.X
        applyFilter()
        refreshSelection(false)
        refreshGeometry(false)
    end)

    local function resolveControllerIndex(choice)
        if type(choice) == "number" then
            return math.clamp(math.floor(choice), 1, #options)
        end
        for index, option in ipairs(options) do
            if option == tostring(choice) then
                return index
            end
        end
        return nil
    end

    local function setControllerValue(newValue)
        if multiSelect then
            selected = {}
            local choices = type(newValue) == "table"
                and newValue
                or { newValue }
            for _, choice in ipairs(choices) do
                local index = resolveControllerIndex(choice)
                if index then
                    selected[index] = true
                end
            end
        else
            local index = resolveControllerIndex(newValue)
            if index then
                currentIndex = index
            end
        end
        refreshSelection(false)
    end

    return row, {
        GetValue = getControllerValue,
        SetValue = setControllerValue,
        
        Apply = function()
            local values, indices = getControllerValue()
            setOpen(false)
            if action and type(action.OnApply) == "function" then
                action.OnApply(values, indices)
            end
        end,
        SetHint = function(text)
            if hintLabel then
                hintLabel.Text = tostring(text or "")
            end
        end,
        SetActionText = function(text)
            if applyButton then
                applyBaseText = tostring(text or applyBaseText)
                refreshSelection(false)
            end
        end,
        GetNote = function()
            return currentNote
        end,
        SetNote = function(value)
            currentNote = tostring(value or "")
            applyNoteLayout()
            refreshGeometry(false)
        end,
    }
end






local function createButtonRow(name, labelText, buttonText, confirmText)
    local row, main = buildFixedRow(name, labelText)
    local currentButtonText = tostring(buttonText or "")
    local currentConfirmText = tostring(confirmText or "")

    local button = Instance.new("TextButton")
    button.Name = "Action"
    button.Active = true
    button.AutoButtonColor = false
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Position = UDim2.fromScale(CONTROL_LAYOUT.NarrowCenterX, 0.5)
    button.Size = UDim2.fromScale(CONTROL_LAYOUT.NarrowWidth, 0.68)
    button.Text = ""
    button.ZIndex = 6
    button.Parent = main
    attachScaleFeedback(button, 1.035, 0.96)

    local base = Instance.new("Frame")
    base.Name = "Main"
    base.Active = false
    base.AnchorPoint = Vector2.new(0.5, 0.5)
    base.BackgroundColor3 = Color3.fromRGB(175, 0, 0)
    base.BorderSizePixel = 0
    base.Position = UDim2.fromScale(0.5, 0.5)
    base.Size = UDim2.fromScale(1, 0.92)
    base.ZIndex = 1
    base.Parent = button
    addScaledStroke(base, Enum.ApplyStrokeMode.Border, 0.06)

    local colorFrame = Instance.new("Frame")
    colorFrame.Name = "ColorFrame"
    colorFrame.Active = false
    colorFrame.AnchorPoint = Vector2.new(0.5, 0)
    colorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    colorFrame.BorderSizePixel = 0
    colorFrame.Position = UDim2.fromScale(0.5, 0)
    colorFrame.Size = UDim2.fromScale(1, 0.9)
    colorFrame.ZIndex = 1
    colorFrame.Parent = base
    addRedGradient(colorFrame, "RedGradient", rebirthOuterGradient)

    local highlight = Instance.new("Frame")
    highlight.Name = "Transparent"
    highlight.Active = false
    highlight.AnchorPoint = Vector2.new(0.5, 0.5)
    highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    highlight.BorderSizePixel = 0
    highlight.Position = UDim2.fromScale(0.5, 0.5)
    highlight.Size = UDim2.fromScale(0.965, 0.88)
    highlight.ZIndex = 2
    highlight.Parent = colorFrame
    addRedGradient(highlight, "RedGradient", rebirthInnerGradient)

    local caption = Instance.new("TextLabel")
    caption.Name = "Label"
    caption.Active = false
    caption.AnchorPoint = Vector2.new(0.5, 0.5)
    caption.BackgroundTransparency = 1
    caption.BorderSizePixel = 0
    caption.Position = UDim2.fromScale(0.5, 0.5)
    caption.Size = UDim2.fromScale(0.9, 0.62)
    caption.Text = currentButtonText
    caption.TextWrapped = true
    caption.ZIndex = 6
    caption.Parent = colorFrame
    applyShinyTextStyle(caption, normalTextFont)

    
    local busy = false
    
    
    local function playPress()
        local scale = button:FindFirstChildOfClass("UIScale")
        if scale then
            TweenService:Create(
                scale,
                TweenInfo.new(
                    0.055,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                { Scale = 0.96 }
            ):Play()
            task.delay(0.07, function()
                if scale.Parent then
                    TweenService:Create(
                        scale,
                        TweenInfo.new(
                            0.09,
                            Enum.EasingStyle.Quad,
                            Enum.EasingDirection.Out
                        ),
                        { Scale = 1 }
                    ):Play()
                end
            end)
        end
        if busy or currentConfirmText == "" then
            return
        end
        busy = true
        caption.Text = currentConfirmText
        task.delay(0.9, function()
            caption.Text = currentButtonText
            busy = false
        end)
    end

    connectSafeActivation(button, playPress)

    return row, playPress
end






local function createInputRow(name, labelText, placeholder)
    local row, main = buildFixedRow(name, labelText)

    local field = Instance.new("Frame")
    field.Name = "Field"
    field.Active = false
    field.AnchorPoint = Vector2.new(0.5, 0.5)
    field.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    field.BackgroundTransparency = 0.6
    field.BorderSizePixel = 0
    
    
    field.ClipsDescendants = false
    field.Position = UDim2.fromScale(CONTROL_LAYOUT.WideCenterX, 0.5)
    field.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62)
    field.ZIndex = 4
    field.Parent = main
    addScaledStroke(field, Enum.ApplyStrokeMode.Border, 0.1)

    local underline = Instance.new("Frame")
    underline.Name = "Underline"
    underline.Active = false
    underline.AnchorPoint = Vector2.new(0.5, 1)
    underline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    underline.BorderSizePixel = 0
    underline.Position = UDim2.fromScale(0.5, 1)
    underline.Size = UDim2.fromScale(0, 0.11)
    underline.ZIndex = 6
    underline.Parent = field

    local input = Instance.new("TextBox")
    input.Name = "Input"
    input.Active = true
    input.AnchorPoint = Vector2.new(0.5, 0.5)
    input.BackgroundTransparency = 1
    input.BorderSizePixel = 0
    input.ClearTextOnFocus = false
    input.MultiLine = false
    input.Position = UDim2.fromScale(0.5, 0.5)
    input.Size = UDim2.fromScale(0.9, 0.56)
    input.Text = ""
    input.PlaceholderText = placeholder
    input.PlaceholderColor3 = Color3.fromRGB(198, 198, 198)
    input.TextXAlignment = Enum.TextXAlignment.Center
    input.TextYAlignment = Enum.TextYAlignment.Center
    input.ZIndex = 5
    input.Parent = field
    applyPlainTextStyle(input)

    local function normalizeText(value)
        local text = tostring(value or "")
        text = text:match("^%s*(.-)%s*$") or ""
        return text
    end

    local function tweenFocus(focused)
        TweenService:Create(field, TweenInfo.new(0.16), {
            BackgroundTransparency = 1,
        }):Play()
        TweenService:Create(
            underline,
            TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Size = UDim2.fromScale(focused and 1.0 or 0, 0.11) }
        ):Play()
    end

    input.Focused:Connect(function()
        tweenFocus(true)
    end)

    input.FocusLost:Connect(function()
        tweenFocus(false)
        input.Text = normalizeText(input.Text)
    end)

    return row, normalizeText
end










































local function safeCallback(callback, ...)
    if type(callback) ~= "function" then
        return
    end

    local arguments = table.pack(...)
    task.spawn(function()
        local ok, message = xpcall(function()
            callback(table.unpack(arguments, 1, arguments.n))
        end, function(problem)
            return tostring(problem)
        end)
        if not ok then
        end
    end)
end

local function copyTable(source)
    local result = {}
    if type(source) == "table" then
        for key, value in pairs(source) do
            result[key] = value
        end
    end
    return result
end

local function normalizeConfig(config, fallbackName)
    if type(config) == "string" then
        return {
            Name = config,
        }
    end
    assert(type(config) == "table", "config phai la string hoac table")

    local result = copyTable(config)
    result.Name = tostring(
        result.Name
            or result.Title
            or result.Text
            or fallbackName
            or "Unnamed"
    )
    assert(result.Name ~= "", "Name khong duoc de trong")
    return result
end

local function findDescendant(root, name)
    local found = root:FindFirstChild(name, true)
    assert(found, ("Khong tim thay thanh phan UI '%s'"):format(name))
    return found
end

































local function createLibrarySliderRow(config)
    local rawMinimum = tonumber(config.Min) or 0
    local rawMaximum = tonumber(config.Max) or 100
    local rawDefault = tonumber(config.Default)
    local requestedIncrement = tonumber(config.Increment or config.Step)

    local function decimalCount(value)
        value = tonumber(value)
        if not value then
            return 0
        end
        for places = 0, 6 do
            local scale = 10 ^ places
            if math.abs(value * scale - math.round(value * scale)) < 1e-6 then
                return places
            end
        end
        return 6
    end

    local configuredDecimals = config.AllowDecimals
    if configuredDecimals == nil then
        configuredDecimals = config.Decimals
    end

    local allowDecimals
    if configuredDecimals == nil then
        allowDecimals = decimalCount(requestedIncrement) > 0
            or decimalCount(rawMinimum) > 0
            or decimalCount(rawMaximum) > 0
            or decimalCount(rawDefault) > 0
    else
        allowDecimals = configuredDecimals == true
    end

    local configuredPlaces = tonumber(
        config.DecimalPlaces or config.Precision
    )
    local decimalPlaces = 0
    if allowDecimals then
        decimalPlaces = math.clamp(
            math.floor(
                configuredPlaces
                    or math.max(
                        1,
                        decimalCount(requestedIncrement),
                        decimalCount(rawMinimum),
                        decimalCount(rawMaximum),
                        decimalCount(rawDefault)
                    )
            ),
            1,
            6
        )
    end

    local function roundForMode(value)
        value = tonumber(value) or 0
        if not allowDecimals then
            return math.round(value)
        end
        local scale = 10 ^ decimalPlaces
        return math.round(value * scale) / scale
    end

    local minimum = roundForMode(rawMinimum)
    local maximum = roundForMode(rawMaximum)
    if maximum < minimum then
        minimum, maximum = maximum, minimum
    end

    local function normalizeIncrement(value)
        if allowDecimals then
            local quantum = 10 ^ -decimalPlaces
            local normalized = math.abs(tonumber(value) or quantum)
            normalized = roundForMode(normalized)
            return math.max(quantum, normalized)
        end
        return math.max(1, math.round(math.abs(tonumber(value) or 1)))
    end

    local increment = normalizeIncrement(requestedIncrement)

    
    
    
    
    local valueFormatFn = type(config.ValueFormat or config.InputFormat)
            == "function"
        and (config.ValueFormat or config.InputFormat)
        or nil
    local valueParseFn = type(config.ValueParse or config.InputParse)
            == "function"
        and (config.ValueParse or config.InputParse)
        or nil

    
    local function normalizeUnitOptions(list)
        local result = {}
        if type(list) ~= "table" then
            return result
        end
        for _, entry in ipairs(list) do
            if type(entry) == "string" or type(entry) == "number" then
                local text = tostring(entry)
                table.insert(result, { Name = text, Suffix = text })
            elseif type(entry) == "table" then
                local name = tostring(
                    entry.Name or entry.Text or entry.Suffix or "Unit"
                )
                local suffix = entry.Suffix ~= nil
                    and tostring(entry.Suffix)
                    or name
                table.insert(result, {
                    Name = name,
                    Suffix = suffix,
                    Prefix = entry.Prefix ~= nil
                        and tostring(entry.Prefix)
                        or nil,
                    Format = type(entry.Format) == "function"
                        and entry.Format
                        or nil,
                    FromBase = type(entry.FromBase) == "function"
                        and entry.FromBase
                        or nil,
                    ToBase = type(entry.ToBase) == "function"
                        and entry.ToBase
                        or nil,
                })
            end
        end
        return result
    end

    local unitConfig = config.Unit or config.Units
    if type(unitConfig) == "string" then
        unitConfig = { Options = { unitConfig } }
    elseif type(unitConfig) == "table"
        and unitConfig.Options == nil
        and unitConfig.List == nil
        and #unitConfig > 0
    then
        unitConfig = { Options = unitConfig }
    elseif type(unitConfig) ~= "table" then
        unitConfig = nil
    end

    local unitOptions = normalizeUnitOptions(
        unitConfig and (unitConfig.Options or unitConfig.List)
    )
    local unitEnabled = unitConfig ~= nil
        and unitConfig.Enabled ~= false
        and #unitOptions > 0
    local unitSelectorEnabled
    if unitConfig and unitConfig.Selector ~= nil then
        unitSelectorEnabled = unitConfig.Selector == true
    else
        unitSelectorEnabled = #unitOptions > 1
    end
    local unitCallback = unitConfig and unitConfig.Callback or nil
    local unitGlobalFormat = unitConfig
            and type(unitConfig.Format) == "function"
            and unitConfig.Format
        or nil
    
    local filteringValueText = false

    
    
    local valueColors = {
        Number = Color3.fromRGB(255, 255, 255),
        Prefix = CHEVRON_COLOR,
        Suffix = CHEVRON_COLOR,
    }
    local valueColorEnabled = false

    local function applyColorConfig(colors)
        if type(colors) ~= "table" then
            return
        end
        
        if typeof(colors.Unit) == "Color3" then
            valueColors.Prefix = colors.Unit
            valueColors.Suffix = colors.Unit
        end
        for _, key in ipairs({ "Number", "Prefix", "Suffix" }) do
            if typeof(colors[key]) == "Color3" then
                valueColors[key] = colors[key]
            end
        end
    end

    applyColorConfig(config.Colors)
    applyColorConfig(unitConfig and unitConfig.Colors)
    if config.ColorEnabled ~= nil then
        valueColorEnabled = config.ColorEnabled == true
    end
    if unitConfig and unitConfig.ColorEnabled ~= nil then
        valueColorEnabled = unitConfig.ColorEnabled == true
    end

    local function escapeRichText(text)
        local result = tostring(text)
        result = result:gsub("&", "&amp;")
        result = result:gsub("<", "&lt;")
        result = result:gsub(">", "&gt;")
        return result
    end

    local function colorTag(color, text)
        return ('<font color="rgb(%d,%d,%d)">%s</font>'):format(
            math.floor(color.R * 255 + 0.5),
            math.floor(color.G * 255 + 0.5),
            math.floor(color.B * 255 + 0.5),
            escapeRichText(text)
        )
    end

    
    local unitPrefix = ""
    if unitConfig and unitConfig.Prefix ~= nil then
        unitPrefix = tostring(unitConfig.Prefix)
    end
    local currentUnitIndex = 1

    local row, main, label = buildFixedRow(config.Name, config.Name)
    
    
    label.Size = UDim2.fromScale(0.43, 0.64)

    local sliderNote = tostring(config.Note or config.Description or "")
    local noteVScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local noteLabel = Instance.new("TextLabel")
    noteLabel.Name = "Note"
    noteLabel.Active = false
    noteLabel.AnchorPoint = Vector2.new(0, 0.5)
    noteLabel.BackgroundTransparency = 1
    noteLabel.BorderSizePixel = 0
    noteLabel.Position = UDim2.fromScale(0.025, 0.755)
    noteLabel.Size = UDim2.fromScale(0.48, 0.3)
    noteLabel.Text = ""
    noteLabel.TextWrapped = false
    noteLabel.TextXAlignment = Enum.TextXAlignment.Left
    noteLabel.TextYAlignment = Enum.TextYAlignment.Center
    noteLabel.Visible = false
    noteLabel.ZIndex = 5
    noteLabel.Parent = main
    applyPlainTextStyle(noteLabel)
    noteLabel.TextTransparency = 0.32
    do
        local noteStroke = noteLabel:FindFirstChildOfClass("UIStroke")
        if noteStroke then
            noteStroke.Thickness = 0.06
            noteStroke.Transparency = 0.2
        end
    end

    local valueLabel = Instance.new("TextBox")
    valueLabel.Name = "Value"
    valueLabel.Active = true
    valueLabel.AnchorPoint = Vector2.new(0, 0.5)
    valueLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.BorderSizePixel = 0
    valueLabel.ClearTextOnFocus = false
    valueLabel.MultiLine = false
    valueLabel.Position = UDim2.fromScale(0.525, 0.5)
    valueLabel.Size = UDim2.fromScale(0.095, 0.56)
    valueLabel.Text = ""
    valueLabel.TextEditable = true
    valueLabel.TextWrapped = false
    valueLabel.TextXAlignment = Enum.TextXAlignment.Center
    valueLabel.TextYAlignment = Enum.TextYAlignment.Center
    valueLabel.ZIndex = 5
    valueLabel.Parent = main
    applyPlainTextStyle(valueLabel)
    
    
    
    -- Value display: text only, no black field border.

    local valuePadding = Instance.new("UIPadding")
    valuePadding.Name = "ValuePadding"
    
    
    valuePadding.PaddingLeft = UDim.new(0, 0)
    valuePadding.PaddingRight = UDim.new(0, 0)
    valuePadding.PaddingTop = UDim.new(0, 0)
    valuePadding.PaddingBottom = UDim.new(0, 0)
    valuePadding.Parent = valueLabel

    local track = Instance.new("Frame")
    track.Name = "Slider"
    track.Active = true
    track.AnchorPoint = Vector2.new(0.5, 0.5)
    track.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    track.BackgroundTransparency = 0.6
    track.BorderSizePixel = 0
    track.ClipsDescendants = false
    track.Position = UDim2.fromScale(0.8075, 0.5)
    track.Size = UDim2.fromScale(0.345, 0.45)
    track.ZIndex = 3
    track.Parent = main
    addScaledStroke(track, Enum.ApplyStrokeMode.Border, 0.1)

    local bar = Instance.new("Frame")
    bar.Name = "Bar"
    bar.Active = true
    bar.AnchorPoint = Vector2.new(0, 0.5)
    bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    bar.BorderSizePixel = 0
    bar.Position = UDim2.fromScale(0, 0.5)
    bar.Size = UDim2.fromScale(0.5, 1)
    bar.ZIndex = 4
    bar.Parent = track
    addAccentGradient(bar)

    local hold = Instance.new("Frame")
    hold.Name = "Hold"
    hold.Active = true
    hold.AnchorPoint = Vector2.new(0.5, 0.5)
    hold.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    hold.BackgroundTransparency = 1
    hold.BorderSizePixel = 0
    hold.ClipsDescendants = false
    hold.Position = UDim2.fromScale(0.5, 0.5)
    hold.Size = UDim2.fromScale(0.115, 1.2)
    hold.ZIndex = 5
    hold.Parent = track

    local holdStroke = addScaledStroke(
        hold,
        Enum.ApplyStrokeMode.Border,
        0.09
    )
    holdStroke.Color = Color3.fromRGB(39, 39, 39)

    local holdColor = Instance.new("Frame")
    holdColor.Name = "Color"
    holdColor.Active = false
    holdColor.AnchorPoint = Vector2.new(0.5, 0)
    holdColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    holdColor.BorderSizePixel = 0
    holdColor.Position = UDim2.fromScale(0.5, 0)
    holdColor.Size = UDim2.fromScale(1, 1)
    holdColor.ZIndex = 6
    holdColor.Parent = hold

    
    
    
    
    
    
    local unitDivider = Instance.new("Frame")
    unitDivider.Name = "UnitDivider"
    unitDivider.Active = false
    unitDivider.AnchorPoint = Vector2.new(0.5, 0.5)
    unitDivider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    unitDivider.BackgroundTransparency = 0.3
    unitDivider.BorderSizePixel = 0
    unitDivider.Position = UDim2.fromScale(0.5935, 0.5)
    unitDivider.Size = UDim2.fromScale(0.0025, 0.36)
    unitDivider.Visible = false
    unitDivider.ZIndex = 7
    unitDivider.Parent = main

    local unitButton = Instance.new("TextButton")
    unitButton.Name = "UnitSelector"
    unitButton.Active = true
    unitButton.AutoButtonColor = false
    unitButton.AnchorPoint = Vector2.new(1, 0.5)
    unitButton.BackgroundTransparency = 1
    unitButton.BorderSizePixel = 0
    unitButton.Position = UDim2.fromScale(0.618, 0.5)
    unitButton.Size = UDim2.fromScale(0.025, 0.46)
    unitButton.Text = ""
    unitButton.Visible = false
    unitButton.ZIndex = 8
    unitButton.Parent = main

    local unitScale = Instance.new("UIScale")
    unitScale.Name = "InteractionScale"
    unitScale.Scale = 1
    unitScale.Parent = unitButton

    local unitCaret = Instance.new("Frame")
    unitCaret.Name = "Caret"
    unitCaret.Active = false
    unitCaret.AnchorPoint = Vector2.new(0.5, 0.5)
    unitCaret.BackgroundTransparency = 1
    unitCaret.BorderSizePixel = 0
    unitCaret.Position = UDim2.fromScale(0.5, 0.5)
    unitCaret.Size = UDim2.fromScale(0.75, 0.6)
    unitCaret.ZIndex = 8
    unitCaret.Parent = unitButton

    local unitCaretAspect = Instance.new("UIAspectRatioConstraint")
    unitCaretAspect.AspectRatio = 1
    unitCaretAspect.AspectType = Enum.AspectType.FitWithinMaxSize
    unitCaretAspect.DominantAxis = Enum.DominantAxis.Height
    unitCaretAspect.Parent = unitCaret

    for _, arm in ipairs({ { 0.335355, 45 }, { 0.664645, -45 } }) do
        local piece = Instance.new("Frame")
        piece.Name = "Arm"
        piece.Active = false
        piece.AnchorPoint = Vector2.new(0.5, 0.5)
        piece.BackgroundColor3 = UNIT_CHEVRON_COLOR
        piece.BorderSizePixel = 0
        piece.Position = UDim2.fromScale(arm[1], 0.535355)
        piece.Rotation = arm[2]
        piece.Size = UDim2.fromScale(0.6657, 0.2)
        piece.ZIndex = 9
        piece.Parent = unitCaret
    end

    local currentValue = minimum
    local dragging = false
    local activeTouch = nil
    local globalConnections = {}
    local setValue
    local setRange
    local setUnit
    local closeUnitMenu
    local refreshValueBoxGeometry

    local function formatValue(value)
        if not allowDecimals then
            return tostring(math.round(value))
        end
        return string.format(
            "%." .. tostring(decimalPlaces) .. "f",
            value
        )
    end

    
    
    local function numberText()
        if valueFormatFn then
            local ok, text = pcall(valueFormatFn, currentValue)
            if ok and text ~= nil then
                return tostring(text)
            end
            if not ok then
                
                
                
            end
        end
        return formatValue(currentValue)
    end

    
    
    
    
    
    
    local function displayValueText()
        local text = numberText()
        local unit = nil
        if unitEnabled then
            unit = unitOptions[currentUnitIndex]
        end

        local formatter = nil
        if unit then
            formatter = unitGlobalFormat or unit.Format
        end
        if formatter then
            local ok, composed = pcall(
                formatter,
                text,
                unit.Name,
                unit,
                currentValue
            )
            if ok and composed ~= nil then
                return tostring(composed), valueColorEnabled
            end
            if not ok then
                
                
                
            end
        end

        if not unit then
            if not valueColorEnabled then
                return text, false
            end
            return colorTag(valueColors.Number, text), true
        end

        local prefix = unit.Prefix or unitPrefix
        if not valueColorEnabled then
            return prefix .. text .. unit.Suffix, false
        end
        return colorTag(valueColors.Prefix, prefix)
            .. colorTag(valueColors.Number, text)
            .. colorTag(valueColors.Suffix, unit.Suffix), true
    end

    local function visibleCharacterCount(text)
        local plain = tostring(text or ""):gsub("<.->", "")
        local ok, length = pcall(utf8.len, plain)
        return (ok and length) or #plain
    end

    
    
    refreshValueBoxGeometry = function(text)
        local showUnit = unitEnabled and #unitOptions > 0
        local showSelector = showUnit and unitSelectorEnabled
        local minimumWidth = showUnit and 0.125 or 0.095
        local maximumWidth = showUnit and 0.195 or 0.175
        local baseCharacters = showUnit and 7 or 5
        local extraCharacters = math.max(
            0,
            visibleCharacterCount(text) - baseCharacters
        )
        local width = math.clamp(
            minimumWidth + extraCharacters * 0.0095,
            minimumWidth,
            maximumWidth
        )
        local leftEdge = 0.62 - width

        local hasNote = sliderNote ~= ""
        local controlScale = hasNote and noteVScale or 1
        valueLabel.Position = UDim2.fromScale(leftEdge, 0.5)
        valueLabel.Size = UDim2.fromScale(width, 0.56 * controlScale)
        track.Size = UDim2.fromScale(0.345, 0.45 * controlScale)
        unitDivider.Size = UDim2.fromScale(0.0025, 0.36 * controlScale)
        unitButton.Size = UDim2.fromScale(0.025, 0.46 * controlScale)

        local normalLabelWidth = showUnit and 0.43 or 0.45
        label.Position = UDim2.fromScale(0.025, hasNote and 0.34 or 0.5)
        label.Size = UDim2.fromScale(
            math.min(normalLabelWidth, math.max(0.28, leftEdge - 0.045)),
            hasNote and 0.64 * noteVScale * NOTE_TITLE_SCALE or 0.64
        )

        noteLabel.Text = sliderNote
        noteLabel.Visible = hasNote
        noteLabel.Size = UDim2.fromScale(math.max(0.2, leftEdge - 0.045), 0.3)
        local rowAspect = row:FindFirstChildOfClass("UIAspectRatioConstraint")
        if rowAspect then
            rowAspect.AspectRatio = hasNote and ROW_ASPECT_WITH_NOTE or ROW_ASPECT
        end
        row:SetAttribute(
            "ChilliResponsiveAspect",
            hasNote and ROW_ASPECT_WITH_NOTE or ROW_ASPECT
        )

        
        valuePadding.PaddingRight = UDim.new(
            showSelector
                and math.min(0.45, 0.034 / math.max(width, 0.001))
                or 0,
            0
        )
    end

    local function applyDisplayText()
        if valueLabel:IsFocused() then
            return
        end
        local text, richText = displayValueText()
        filteringValueText = true
        valueLabel.RichText = richText
        valueLabel.Text = text
        filteringValueText = false
        refreshValueBoxGeometry(text)
    end

    local function snapValue(value)
        value = math.clamp(tonumber(value) or minimum, minimum, maximum)
        if value <= minimum then
            return minimum
        end
        if value >= maximum then
            return maximum
        end
        local steps = math.floor(((value - minimum) / increment) + 0.5)
        local snapped = minimum + steps * increment
        return math.clamp(roundForMode(snapped), minimum, maximum)
    end

    local function updateUnitDisplay()
        applyDisplayText()
    end

    local function resolveUnitIndex(choice)
        if choice == nil or #unitOptions == 0 then
            return nil
        end
        if type(choice) == "number" then
            return math.clamp(math.floor(choice), 1, #unitOptions)
        end
        local wanted = tostring(choice)
        for index, unit in ipairs(unitOptions) do
            if unit.Name == wanted or unit.Suffix == wanted then
                return index
            end
        end
        return nil
    end

    
    
    
    
    
    
    local unitOverlay = nil
    local unitMenu = nil
    local unitMenuList = nil
    local unitMenuPadding = nil
    local unitMenuOpen = false
    local unitMenuConnections = {}

    local function disconnectUnitMenuConnections()
        for index = #unitMenuConnections, 1, -1 do
            local connection = unitMenuConnections[index]
            if connection.Connected then
                connection:Disconnect()
            end
            unitMenuConnections[index] = nil
        end
    end

    closeUnitMenu = function()
        if not unitMenuOpen then
            return
        end
        unitMenuOpen = false
        disconnectUnitMenuConnections()
        if unitOverlay then
            unitOverlay.Visible = false
        end
        TweenService:Create(
            unitCaret,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            { Rotation = 0 }
        ):Play()
        if Runtime.activeDropdownCloser == closeUnitMenu then
            Runtime.activeDropdownCloser = nil
        end
    end

    local function ensureUnitOverlay()
        if unitOverlay then
            return
        end
        unitOverlay = Instance.new("TextButton")
        unitOverlay.Name = "UnitMenuOverlay"
        unitOverlay.Active = true
        unitOverlay.AutoButtonColor = false
        unitOverlay.BackgroundTransparency = 1
        unitOverlay.BorderSizePixel = 0
        unitOverlay.Position = UDim2.fromScale(0, 0)
        unitOverlay.Selectable = false
        unitOverlay.Size = UDim2.fromScale(1, 1)
        unitOverlay.Text = ""
        unitOverlay.Visible = false
        unitOverlay.ZIndex = 150
        unitOverlay.Parent = rootGui
        connectSafeActivation(unitOverlay, function()
            closeUnitMenu()
        end)

        unitMenu = Instance.new("Frame")
        unitMenu.Name = "UnitMenu"
        unitMenu.Active = true
        
        
        unitMenu.BackgroundTransparency = 1
        unitMenu.BorderSizePixel = 0
        unitMenu.ZIndex = 151
        unitMenu.Parent = unitOverlay

        unitMenuPadding = Instance.new("UIPadding")
        unitMenuPadding.Name = "MenuPadding"
        unitMenuPadding.Parent = unitMenu

        unitMenuList = Instance.new("UIListLayout")
        unitMenuList.Name = "MenuLayout"
        unitMenuList.FillDirection = Enum.FillDirection.Vertical
        unitMenuList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        unitMenuList.VerticalAlignment = Enum.VerticalAlignment.Top
        unitMenuList.SortOrder = Enum.SortOrder.LayoutOrder
        unitMenuList.Parent = unitMenu
    end

    local function paintUnitMenuItems()
        if not unitMenu then
            return
        end
        for _, child in ipairs(unitMenu:GetChildren()) do
            if child:IsA("TextButton") then
                local chosen = child.LayoutOrder == currentUnitIndex
                child.BackgroundTransparency = chosen and 0.15 or 0.35
                child.TextTransparency = chosen and 0 or 0.15
            end
        end
    end

    local function rebuildUnitMenuItems(itemHeight)
        if not unitMenu then
            return
        end
        for _, child in ipairs(unitMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        for index, unit in ipairs(unitOptions) do
            local item = Instance.new("TextButton")
            item.Name = "Unit" .. index
            item.Active = true
            item.AutoButtonColor = false
            item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            item.BackgroundTransparency = 0.35
            item.BorderSizePixel = 0
            item.LayoutOrder = index
            item.Size = UDim2.new(1, 0, 0, itemHeight)
            item.Text = unit.Name
            item.TextWrapped = false
            item.ZIndex = 152
            item.Parent = unitMenu
            applyPlainTextStyle(item)
            addScaledStroke(item, Enum.ApplyStrokeMode.Border, 0.07)

            
            
            local itemPadding = Instance.new("UIPadding")
            itemPadding.Name = "ItemPadding"
            itemPadding.PaddingTop = UDim.new(0.18, 0)
            itemPadding.PaddingBottom = UDim.new(0.18, 0)
            itemPadding.PaddingLeft = UDim.new(0.08, 0)
            itemPadding.PaddingRight = UDim.new(0.08, 0)
            itemPadding.Parent = item

            item.MouseEnter:Connect(function()
                if index ~= currentUnitIndex then
                    item.BackgroundTransparency = 0.25
                end
            end)
            item.MouseLeave:Connect(function()
                paintUnitMenuItems()
            end)
            connectSafeActivation(item, function()
                setUnit(index, true)
                closeUnitMenu()
            end)
        end
        paintUnitMenuItems()
    end

    local function layoutUnitMenu()
        if not (unitOverlay and unitMenu) then
            return
        end
        
        local chipPosition = valueLabel.AbsolutePosition
        local chipSize = valueLabel.AbsoluteSize
        
        
        
        local originPosition = rootGui.AbsolutePosition
        local screenSize = rootGui.AbsoluteSize
        if screenSize.X <= 0 or screenSize.Y <= 0 then
            return
        end
        
        
        local itemHeight = math.max(14, math.floor(chipSize.Y * 0.85 + 0.5))
        local pad = math.max(2, math.floor(itemHeight * 0.14 + 0.5))
        
        
        local count = #unitOptions
        local totalWidth = math.max(math.floor(chipSize.X + 0.5), 24)
        local totalHeight = count * itemHeight
            + math.max(count - 1, 0) * pad

        unitMenuPadding.PaddingTop = UDim.new(0, 0)
        unitMenuPadding.PaddingBottom = UDim.new(0, 0)
        unitMenuPadding.PaddingLeft = UDim.new(0, 0)
        unitMenuPadding.PaddingRight = UDim.new(0, 0)
        unitMenuList.Padding = UDim.new(0, pad)
        for _, child in ipairs(unitMenu:GetChildren()) do
            if child:IsA("TextButton") then
                child.Size = UDim2.new(1, 0, 0, itemHeight)
            end
        end

        
        
        local x = chipPosition.X + chipSize.X - totalWidth
        x = math.min(
            x,
            originPosition.X + screenSize.X - totalWidth - 4
        )
        x = math.max(x, originPosition.X + 4)
        local y = chipPosition.Y + chipSize.Y + pad
        if y + totalHeight > originPosition.Y + screenSize.Y - 4 then
            y = chipPosition.Y - pad - totalHeight
        end
        y = math.max(y, originPosition.Y + 4)

        unitMenu.Position = UDim2.fromOffset(
            x - originPosition.X,
            y - originPosition.Y
        )
        unitMenu.Size = UDim2.fromOffset(totalWidth, totalHeight)
    end

    local function trackUnitChip()
        if not unitMenuOpen then
            return
        end
        local viewport = valueLabel:FindFirstAncestorOfClass(
            "ScrollingFrame"
        )
        if viewport then
            local viewportTop = viewport.AbsolutePosition.Y
            local viewportBottom = viewportTop + viewport.AbsoluteSize.Y
            local chipTop = valueLabel.AbsolutePosition.Y
            local chipBottom = chipTop + valueLabel.AbsoluteSize.Y
            if chipBottom < viewportTop or chipTop > viewportBottom then
                closeUnitMenu()
                return
            end
        end
        layoutUnitMenu()
    end

    local function openUnitMenu()
        if unitMenuOpen or #unitOptions == 0 then
            return
        end
        closeActiveDropdown()
        ensureUnitOverlay()
        local itemHeight = math.max(
            14,
            math.floor(valueLabel.AbsoluteSize.Y * 0.85 + 0.5)
        )
        rebuildUnitMenuItems(itemHeight)
        layoutUnitMenu()
        unitOverlay.Visible = true
        unitMenuOpen = true
        Runtime.activeDropdownCloser = closeUnitMenu
        TweenService:Create(
            unitCaret,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            { Rotation = 180 }
        ):Play()
        
        
        
        
        
        table.insert(
            unitMenuConnections,
            valueLabel:GetPropertyChangedSignal("AbsolutePosition"):Connect(
                trackUnitChip
            )
        )
        table.insert(
            unitMenuConnections,
            valueLabel:GetPropertyChangedSignal("AbsoluteSize"):Connect(
                trackUnitChip
            )
        )
    end

    setUnit = function(choice, fireCallback)
        local index = resolveUnitIndex(choice)
        if not index then
            return false
        end
        local previousUnit = unitOptions[currentUnitIndex]
        local nextUnit = unitOptions[index]
        local previousName = previousUnit and previousUnit.Name or nil
        currentUnitIndex = index

        
        
        
        if previousUnit
            and previousUnit ~= nextUnit
            and (previousUnit.ToBase or nextUnit.FromBase)
        then
            local function convert(value)
                local result = value
                if previousUnit.ToBase then
                    local ok, converted = pcall(
                        previousUnit.ToBase,
                        result
                    )
                    if ok and tonumber(converted) then
                        result = tonumber(converted)
                    end
                end
                if nextUnit.FromBase then
                    local ok, converted = pcall(
                        nextUnit.FromBase,
                        result
                    )
                    if ok and tonumber(converted) then
                        result = tonumber(converted)
                    end
                end
                return result
            end
            local convertedValue = convert(currentValue)
            setRange(convert(minimum), convert(maximum), false)
            setValue(convertedValue, false)
        end

        updateUnitDisplay()
        paintUnitMenuItems()
        if fireCallback ~= false and nextUnit then
            safeCallback(
                unitCallback,
                nextUnit.Name,
                index,
                previousName
            )
        end
        return true
    end

    local function updateSliderLayout()
        local showUnit = unitEnabled and #unitOptions > 0
        local showSelector = showUnit and unitSelectorEnabled
        unitButton.Visible = showSelector
        unitDivider.Visible = showSelector
        
        
        if showSelector then
            unitDivider.Position = UDim2.fromScale(0.5935, 0.5)
            unitButton.Position = UDim2.fromScale(0.618, 0.5)
        end
        if not showSelector then
            closeUnitMenu()
        end
        updateUnitDisplay()
    end

    local unitScaleTween = nil
    local unitHovered = false
    local function tweenUnitScale(targetScale, duration)
        if unitScaleTween then
            unitScaleTween:Cancel()
        end
        unitScaleTween = TweenService:Create(
            unitScale,
            TweenInfo.new(
                duration,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            { Scale = targetScale }
        )
        unitScaleTween:Play()
    end

    unitButton.MouseEnter:Connect(function()
        unitHovered = true
        if unitSelectorEnabled then
            tweenUnitScale(1.03, 0.1)
        end
    end)
    unitButton.MouseLeave:Connect(function()
        unitHovered = false
        tweenUnitScale(1, 0.1)
    end)
    unitButton.MouseButton1Down:Connect(function()
        if unitSelectorEnabled then
            tweenUnitScale(0.97, 0.055)
        end
    end)
    unitButton.MouseButton1Up:Connect(function()
        tweenUnitScale(
            unitSelectorEnabled and unitHovered and 1.03 or 1,
            0.08
        )
    end)
    connectSafeActivation(unitButton, function()
        if not unitSelectorEnabled then
            return
        end
        if unitMenuOpen then
            closeUnitMenu()
        else
            openUnitMenu()
        end
    end)

    setValue = function(value, fireCallback)
        currentValue = snapValue(value)
        
        applyDisplayText()
        updateUnitDisplay()
        local alpha = 0
        if maximum > minimum then
            alpha = (currentValue - minimum) / (maximum - minimum)
        end
        
        local visualAlpha = math.clamp(alpha, 0.0575, 0.9425)
        bar.Size = UDim2.new(visualAlpha, 0, 1, 0)
        hold.Position = UDim2.new(visualAlpha, 0, 0.5, 0)
        if fireCallback ~= false then
            safeCallback(config.Callback, currentValue)
        end
    end

    setRange = function(newMinimum, newMaximum, fireCallback)
        local nextMinimum = tonumber(newMinimum)
        local nextMaximum = tonumber(newMaximum)
        assert(nextMinimum ~= nil, "Slider Min phai la number")
        assert(nextMaximum ~= nil, "Slider Max phai la number")

        minimum = roundForMode(nextMinimum)
        maximum = roundForMode(nextMaximum)
        if maximum < minimum then
            minimum, maximum = maximum, minimum
        end
        setValue(currentValue, fireCallback)
    end

    local function setDecimals(enabled, places, fireCallback)
        allowDecimals = enabled == true
        if allowDecimals then
            decimalPlaces = math.clamp(
                math.floor(tonumber(places) or math.max(decimalPlaces, 1)),
                1,
                6
            )
        else
            decimalPlaces = 0
        end

        minimum = roundForMode(minimum)
        maximum = roundForMode(maximum)
        if maximum < minimum then
            minimum, maximum = maximum, minimum
        end
        increment = allowDecimals and 10 ^ -decimalPlaces or 1
        setValue(currentValue, fireCallback)
    end

    local function setIncrement(value, fireCallback)
        increment = normalizeIncrement(value)
        setValue(currentValue, fireCallback)
    end

    local function sanitizeNumericText(text)
        text = tostring(text or "")
        local result = {}
        local hasDecimalSeparator = false
        for index = 1, #text do
            local character = text:sub(index, index)
            if character:match("%d") then
                table.insert(result, character)
            elseif (character == "." or character == ",")
                and allowDecimals
                and not hasDecimalSeparator
            then
                table.insert(result, ".")
                hasDecimalSeparator = true
            elseif character == "-"
                and minimum < 0
                and #result == 0
            then
                table.insert(result, character)
            end
        end
        return table.concat(result)
    end

    valueLabel:GetPropertyChangedSignal("Text"):Connect(function()
        if valueLabel:IsFocused() then
            refreshValueBoxGeometry(valueLabel.Text)
        end
        
        
        
        if filteringValueText
            or valueParseFn ~= nil
            or not valueLabel:IsFocused()
        then
            return
        end

        local originalText = valueLabel.Text
        local sanitizedText = sanitizeNumericText(originalText)
        if sanitizedText == originalText then
            return
        end

        local originalCursor = valueLabel.CursorPosition
        local sanitizedPrefix = sanitizedText
        if originalCursor > 0 then
            sanitizedPrefix = sanitizeNumericText(
                originalText:sub(1, originalCursor - 1)
            )
        end

        filteringValueText = true
        valueLabel.Text = sanitizedText
        if originalCursor > 0 then
            valueLabel.CursorPosition = math.clamp(
                #sanitizedPrefix + 1,
                1,
                #sanitizedText + 1
            )
        end
        filteringValueText = false
    end)

    local function commitTypedValue()
        local typedValue
        if valueParseFn then
            local ok, parsed = pcall(
                valueParseFn,
                valueLabel.Text,
                currentValue
            )
            if not ok then
                
                
                
            else
                typedValue = tonumber(parsed)
            end
        else
            typedValue = tonumber(valueLabel.Text)
        end
        if typedValue == nil then
            applyDisplayText()
            return
        end
        setValue(typedValue, true)
    end

    local function tweenValueFocus(focused)
        TweenService:Create(valueLabel, TweenInfo.new(0.16), {
            BackgroundTransparency = focused and 0.42 or 0.6,
        }):Play()
    end

    valueLabel.Focused:Connect(function()
        tweenValueFocus(true)
        
        
        filteringValueText = true
        valueLabel.RichText = false
        valueLabel.Text = numberText()
        filteringValueText = false
        refreshValueBoxGeometry(valueLabel.Text)
        task.defer(function()
            if valueLabel:IsFocused() then
                valueLabel.SelectionStart = 1
                valueLabel.CursorPosition = #valueLabel.Text + 1
            end
        end)
    end)

    valueLabel.FocusLost:Connect(function()
        tweenValueFocus(false)
        commitTypedValue()
    end)

    local function setFromScreenX(screenX)
        local width = math.max(track.AbsoluteSize.X, 1)
        local alpha = math.clamp(
            (screenX - track.AbsolutePosition.X) / width,
            0,
            1
        )
        setValue(minimum + (maximum - minimum) * alpha, true)
    end

    local function beginDrag(input)
        if dragging or input.UserInputState ~= Enum.UserInputState.Begin then
            return
        end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            activeTouch = nil
            setFromScreenX(input.Position.X)
        elseif input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            activeTouch = input
            setFromScreenX(input.Position.X)
        end
    end

    track.InputBegan:Connect(beginDrag)
    bar.InputBegan:Connect(beginDrag)
    hold.InputBegan:Connect(beginDrag)

    table.insert(globalConnections, trackRootConnection(UserInputService.InputChanged:Connect(function(input)
        if not dragging then
            return
        end
        if activeTouch then
            if input == activeTouch then
                setFromScreenX(input.Position.X)
            end
        elseif input.UserInputType == Enum.UserInputType.MouseMovement then
            setFromScreenX(input.Position.X)
        end
    end)))

    table.insert(globalConnections, trackRootConnection(UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input == activeTouch
        then
            dragging = false
            activeTouch = nil
        end
    end)))

    
    
    if unitConfig and unitConfig.Default ~= nil then
        local defaultUnitIndex = resolveUnitIndex(unitConfig.Default)
        if defaultUnitIndex then
            currentUnitIndex = defaultUnitIndex
        end
    end
    updateSliderLayout()
    updateUnitDisplay()
    setValue(config.Default ~= nil and config.Default or minimum, false)

    return row, {
        GetValue = function()
            return currentValue
        end,
        GetNote = function()
            return sliderNote
        end,
        SetNote = function(value)
            sliderNote = tostring(value or "")
            refreshValueBoxGeometry(valueLabel.Text)
        end,
        SetValue = setValue,
        GetRange = function()
            return minimum, maximum
        end,
        SetRange = setRange,
        SetMin = function(value, fireCallback)
            setRange(value, maximum, fireCallback)
        end,
        SetMax = function(value, fireCallback)
            setRange(minimum, value, fireCallback)
        end,
        GetDecimals = function()
            return allowDecimals, decimalPlaces
        end,
        SetDecimals = setDecimals,
        SetIncrement = setIncrement,
        SetValueFormat = function(formatFn)
            valueFormatFn = type(formatFn) == "function"
                and formatFn
                or nil
            applyDisplayText()
        end,
        SetValueParse = function(parseFn)
            valueParseFn = type(parseFn) == "function" and parseFn or nil
        end,
        GetValueColors = function()
            return {
                Number = valueColors.Number,
                Prefix = valueColors.Prefix,
                Suffix = valueColors.Suffix,
            }, valueColorEnabled
        end,
        SetValueColors = function(colors)
            applyColorConfig(colors)
            applyDisplayText()
        end,
        SetValueColorEnabled = function(enabled)
            valueColorEnabled = enabled == true
            applyDisplayText()
        end,
        GetUnit = function()
            local unit = unitOptions[currentUnitIndex]
            if not unit then
                return nil, nil
            end
            return unit.Name, currentUnitIndex
        end,
        SetUnit = setUnit,
        SetUnits = function(newOptions, selected, fireCallback)
            assert(
                type(newOptions) == "table",
                "SetUnits can danh sach don vi"
            )
            closeUnitMenu()
            local previousUnit = unitOptions[currentUnitIndex]
            unitOptions = normalizeUnitOptions(newOptions)
            local index = resolveUnitIndex(selected)
                or resolveUnitIndex(previousUnit and previousUnit.Name)
                or 1
            currentUnitIndex = math.clamp(
                index,
                1,
                math.max(#unitOptions, 1)
            )
            updateSliderLayout()
            updateUnitDisplay()
            if fireCallback ~= false
                and unitOptions[currentUnitIndex]
            then
                safeCallback(
                    unitCallback,
                    unitOptions[currentUnitIndex].Name,
                    currentUnitIndex,
                    previousUnit and previousUnit.Name
                )
            end
        end,
        SetUnitEnabled = function(enabled)
            unitEnabled = enabled == true
            updateSliderLayout()
        end,
        SetUnitSelectorEnabled = function(enabled)
            unitSelectorEnabled = enabled == true
            updateSliderLayout()
        end,
        SetUnitFormat = function(formatFn)
            unitGlobalFormat = type(formatFn) == "function"
                and formatFn
                or nil
            updateUnitDisplay()
        end,
        SetUnitCallback = function(callback)
            unitCallback = type(callback) == "function"
                and callback
                or nil
        end,
        Close = closeUnitMenu,
        Destroy = function()
            dragging = false
            activeTouch = nil
            closeUnitMenu()
            if unitOverlay then
                unitOverlay:Destroy()
                unitOverlay = nil
                unitMenu = nil
                unitMenuList = nil
                unitMenuPadding = nil
            end
            for index = #globalConnections, 1, -1 do
                local connection = globalConnections[index]
                if connection.Connected then
                    connection:Disconnect()
                end
                globalConnections[index] = nil
            end
        end,
    }
end

local function createLibraryToggleRow(config)
    local row, main, label = buildFixedRow(config.Name, config.Name)
    label.Size = UDim2.fromScale(0.72, 0.64)

    local switch = Instance.new("Frame")
    switch.Name = "Switch"
    switch.Active = false
    switch.AnchorPoint = Vector2.new(0.5, 0.5)
    switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    switch.BorderSizePixel = 0
    switch.Position = UDim2.fromScale(0.915, 0.5)
    switch.Size = UDim2.fromScale(0.142, 0.75)
    switch.ZIndex = 3
    switch.Parent = main
    addScaledStroke(switch, Enum.ApplyStrokeMode.Border, 0.06)

    local offGradient = Instance.new("UIGradient")
    offGradient.Name = "OFF"
    offGradient.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
    offGradient.Rotation = 90
    offGradient.Transparency = NumberSequence.new(0.6)
    offGradient.Parent = switch

    local onGradient = Instance.new("UIGradient")
    onGradient.Name = "ON"
    onGradient.Color = ACCENT_GRADIENT
    onGradient.Rotation = 90
    onGradient.Parent = switch

    local knob = Instance.new("Frame")
    knob.Name = "Hold"
    knob.Active = false
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    knob.BorderSizePixel = 0
    knob.Size = UDim2.fromScale(0.72, 0.72)
    knob.ZIndex = 5
    knob.Parent = switch
    addScaledStroke(knob, Enum.ApplyStrokeMode.Border, 0.09)

    local knobAspect = Instance.new("UIAspectRatioConstraint")
    knobAspect.AspectRatio = 1
    knobAspect.AspectType = Enum.AspectType.FitWithinMaxSize
    knobAspect.DominantAxis = Enum.DominantAxis.Width
    knobAspect.Parent = knob

    local knobColor = Instance.new("Frame")
    knobColor.Name = "Color"
    knobColor.Active = false
    knobColor.AnchorPoint = Vector2.new(0.5, 0)
    knobColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knobColor.BorderSizePixel = 0
    knobColor.Position = UDim2.fromScale(0.5, 0)
    knobColor.Size = UDim2.fromScale(1, 0.9)
    knobColor.ZIndex = 6
    knobColor.Parent = knob

    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Active = true
    button.AutoButtonColor = false
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Position = UDim2.fromScale(0.5, 0.5)
    button.Size = UDim2.fromScale(1, 1)
    button.Text = ""
    button.ZIndex = 99
    button.Parent = switch

    local enabled = config.Default == true

    local function setValue(value, fireCallback, animated)
        enabled = value == true
        offGradient.Enabled = not enabled
        onGradient.Enabled = enabled
        local target = UDim2.fromScale(enabled and 0.72 or 0.28, 0.5)
        if animated == false then
            knob.Position = target
        else
            TweenService:Create(
                knob,
                TweenInfo.new(
                    0.12,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    Position = target,
                }
            ):Play()
        end
        if fireCallback ~= false then
            safeCallback(config.Callback, enabled)
        end
    end

    connectSafeActivation(button, function()
        setValue(not enabled, true, true)
    end)

    setValue(enabled, false, false)

    return row, {
        GetValue = function()
            return enabled
        end,
        SetValue = function(value, fireCallback)
            setValue(value, fireCallback, true)
        end,
    }
end

local function createLibraryTextRow(config)
    local displayText = tostring(config.Text or config.Value or config.Name)
    local row, main, label = buildFixedRow(config.Name, displayText)
    label.Size = UDim2.fromScale(0.94, 0.64)
    label.TextXAlignment = config.Alignment or Enum.TextXAlignment.Left

    local note = Instance.new("TextLabel")
    note.Name = "Note"
    note.Active = false
    note.AnchorPoint = Vector2.new(0, 0.5)
    note.BackgroundTransparency = 1
    note.BorderSizePixel = 0
    note.Position = UDim2.fromScale(0.025, 0.755)
    note.Size = UDim2.fromScale(0.94, 0.3)
    note.Text = ""
    note.TextWrapped = false
    note.TextXAlignment = Enum.TextXAlignment.Left
    note.TextYAlignment = Enum.TextYAlignment.Center
    note.Visible = false
    note.ZIndex = 5
    note.Parent = main
    applyPlainTextStyle(note)
    note.TextTransparency = 0.32

    local noteStroke = note:FindFirstChildOfClass("UIStroke")
    if noteStroke then
        noteStroke.Thickness = 0.06
        noteStroke.Transparency = 0.2
    end

    local currentNote = ""
    local vScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local function setNote(value)
        currentNote = tostring(value or "")
        local hasNote = currentNote ~= ""
        note.Text = currentNote
        note.Visible = hasNote
        row:SetAttribute(
            "ChilliResponsiveAspect",
            hasNote and ROW_ASPECT_WITH_NOTE or ROW_ASPECT
        )
        if hasNote then
            label.Position = UDim2.fromScale(0.025, 0.34)
            label.Size = UDim2.fromScale(
                0.94,
                0.64 * vScale * NOTE_TITLE_SCALE
            )
        else
            label.Position = UDim2.fromScale(0.025, 0.5)
            label.Size = UDim2.fromScale(0.94, 0.64)
        end
    end

    setNote(config.Note or config.Description or "")

    return row, {
        GetValue = function()
            return label.Text
        end,
        SetValue = function(value)
            label.Text = tostring(value)
        end,
        GetNote = function()
            return currentNote
        end,
        SetNote = setNote,
    }
end










local NOTE_LEFT = 0.025
local NOTE_GAP = 0.02
local NOTE_MAX_WIDTH = 0.94
local NOTE_MIN_WIDTH = 0.3

local function noteWidthFor(control)
    if not control then
        return NOTE_MAX_WIDTH
    end

    local controlLeft = control.Position.X.Scale
        - control.Size.X.Scale * control.AnchorPoint.X

    return math.clamp(
        controlLeft - NOTE_LEFT - NOTE_GAP,
        NOTE_MIN_WIDTH,
        NOTE_MAX_WIDTH
    )
end

local function addNoteToButtonRow(row, config, button)
    local vScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local aspect = row:FindFirstChildOfClass(
        "UIAspectRatioConstraint"
    )
    local main = findDescendant(row, "Main")
    local title = main:FindFirstChild("Label")
    assert(title and title:IsA("TextLabel"), "Button row thieu Label")

    if aspect then
        aspect.AspectRatio = ROW_ASPECT_WITH_NOTE
    end
    row:SetAttribute(
        "ChilliResponsiveAspect",
        ROW_ASPECT_WITH_NOTE
    )

    title.Position = UDim2.fromScale(0.025, 0.34)
    title.Size = UDim2.fromScale(
        0.62,
        0.64 * vScale * NOTE_TITLE_SCALE
    )

    local note = Instance.new("TextLabel")
    note.Name = "Note"
    note.Active = false
    note.AnchorPoint = Vector2.new(0, 0.5)
    note.BackgroundTransparency = 1
    note.BorderSizePixel = 0
    note.Position = UDim2.fromScale(NOTE_LEFT, 0.755)
    note.Size = UDim2.fromScale(noteWidthFor(button), 0.3)
    note.Text = ""
    note.TextWrapped = false
    note.TextXAlignment = Enum.TextXAlignment.Left
    note.TextYAlignment = Enum.TextYAlignment.Center
    note.ZIndex = 5
    note.Parent = main
    applyPlainTextStyle(note)
    note.TextTransparency = 0.32

    local noteStroke = note:FindFirstChildOfClass("UIStroke")
    if noteStroke then
        noteStroke.Thickness = 0.06
        noteStroke.Transparency = 0.2
    end

    button.Size = UDim2.new(
        button.Size.X.Scale,
        button.Size.X.Offset,
        button.Size.Y.Scale * vScale,
        button.Size.Y.Offset
    )

    local currentNote = ""
    local function setNote(value)
        currentNote = tostring(value or "")
        note.Text = currentNote
    end
    setNote(config.Note or config.Description or "")

    return {
        GetNote = function()
            return currentNote
        end,
        SetNote = setNote,
    }
end

local function createLibraryButtonRow(config)
    local row, playPress = createButtonRow(
        config.Name,
        config.Name,
        tostring(config.ButtonText or config.Text or "Click"),
        tostring(config.ConfirmText or "Clicked!")
    )
    local button = findDescendant(row, "Action")
    local noteController = nil
    if config.Note ~= nil or config.Description ~= nil then
        noteController = addNoteToButtonRow(row, config, button)
    end
    connectSafeActivation(button, function()
        safeCallback(config.Callback)
    end)

    return row, {
        Press = function()
            
            if playPress then
                playPress()
            end
            safeCallback(config.Callback)
        end,
        GetNote = noteController and noteController.GetNote,
        SetNote = noteController and noteController.SetNote,
    }
end

local function createLibraryInputRow(config)
    local row, normalizeText = createInputRow(
        config.Name,
        config.Name,
        tostring(config.Placeholder or "Type...")
    )
    local input = findDescendant(row, "Input")
    input.Text = normalizeText(config.Default)

    local main = row:FindFirstChild("Main")
    local title = main:FindFirstChild("Label")
    local field = main:FindFirstChild("Field")
    local aspect = row:FindFirstChildOfClass("UIAspectRatioConstraint")
    local noteVScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local fieldLeft = CONTROL_LAYOUT.WideCenterX - CONTROL_LAYOUT.WideWidth / 2
    local currentNote = ""

    local noteLabel = Instance.new("TextLabel")
    noteLabel.Name = "Note"
    noteLabel.Active = false
    noteLabel.AnchorPoint = Vector2.new(0, 0.5)
    noteLabel.BackgroundTransparency = 1
    noteLabel.BorderSizePixel = 0
    noteLabel.Position = UDim2.fromScale(0.025, 0.755)
    noteLabel.Size = UDim2.fromScale(math.max(0.3, fieldLeft - 0.045), 0.3)
    noteLabel.Text = ""
    noteLabel.TextWrapped = false
    noteLabel.TextXAlignment = Enum.TextXAlignment.Left
    noteLabel.TextYAlignment = Enum.TextYAlignment.Center
    noteLabel.Visible = false
    noteLabel.ZIndex = 5
    noteLabel.Parent = main
    applyPlainTextStyle(noteLabel)
    noteLabel.TextTransparency = 0.32

    local noteStroke = noteLabel:FindFirstChildOfClass("UIStroke")
    if noteStroke then
        noteStroke.Thickness = 0.06
        noteStroke.Transparency = 0.2
    end

    local function setNote(value)
        currentNote = tostring(value or "")
        local hasNote = currentNote ~= ""
        noteLabel.Text = currentNote
        noteLabel.Visible = hasNote
        if aspect and aspect.Parent then
            aspect.AspectRatio = hasNote and ROW_ASPECT_WITH_NOTE or ROW_ASPECT
        end
        row:SetAttribute(
            "ChilliResponsiveAspect",
            hasNote and ROW_ASPECT_WITH_NOTE or ROW_ASPECT
        )
        if hasNote then
            title.Position = UDim2.fromScale(0.025, 0.34)
            title.Size = UDim2.fromScale(0.65, 0.64 * noteVScale * NOTE_TITLE_SCALE)
            field.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62 * noteVScale)
        else
            title.Position = UDim2.fromScale(0.025, 0.5)
            title.Size = UDim2.fromScale(0.65, 0.64)
            field.Size = UDim2.fromScale(CONTROL_LAYOUT.WideWidth, 0.62)
        end
    end

    setNote(config.Note or config.Description or "")

    input.FocusLost:Connect(function(enterPressed)
        input.Text = normalizeText(input.Text)
        safeCallback(config.Callback, input.Text, enterPressed)
    end)

    return row, {
        GetValue = function()
            return input.Text
        end,
        GetNote = function()
            return currentNote
        end,
        SetNote = setNote,
        SetValue = function(value, fireCallback)
            input.Text = normalizeText(value)
            if fireCallback ~= false then
                safeCallback(config.Callback, input.Text, false)
            end
        end,
    }
end

local function createLibraryNoteToggleRow(config)
    
    
    local row, controller = createLibraryToggleRow(config)
    local vScale = ROW_ASPECT_WITH_NOTE / ROW_ASPECT
    local aspect = row:FindFirstChildOfClass("UIAspectRatioConstraint")
    local main = findDescendant(row, "Main")
    local title = findDescendant(main, "Label")
    local switch = findDescendant(main, "Switch")

    if aspect then
        aspect.AspectRatio = ROW_ASPECT_WITH_NOTE
    end

    title.Position = UDim2.fromScale(0.025, 0.34)
    title.Size = UDim2.fromScale(
        0.62,
        0.64 * vScale * NOTE_TITLE_SCALE
    )

    local note = Instance.new("TextLabel")
    note.Name = "Note"
    note.Active = false
    note.AnchorPoint = Vector2.new(0, 0.5)
    note.BackgroundTransparency = 1
    note.BorderSizePixel = 0
    note.Position = UDim2.fromScale(NOTE_LEFT, 0.755)
    note.Size = UDim2.fromScale(noteWidthFor(switch), 0.3)
    note.Text = tostring(config.Note or config.Description or "")
    note.TextWrapped = false
    note.TextXAlignment = Enum.TextXAlignment.Left
    note.TextYAlignment = Enum.TextYAlignment.Center
    note.ZIndex = 5
    note.Parent = main
    applyPlainTextStyle(note)
    note.TextTransparency = 0.32

    local noteStroke = note:FindFirstChildOfClass("UIStroke")
    if noteStroke then
        noteStroke.Thickness = 0.06
        noteStroke.Transparency = 0.2
    end

    switch.Size = UDim2.fromScale(0.142, 0.75 * vScale)

    
    
    
    local currentNote = note.Text
    controller.GetNote = function()
        return currentNote
    end
    controller.SetNote = function(value)
        currentNote = tostring(value or "")
        note.Text = currentNote
    end
    return row, controller
end





local function createLibraryDropdownRow(config, forceMulti, actionMode)
    local rawOptions = config.Options or config.Values or config.List
    assert(type(rawOptions) == "table", "Dropdown features must be provided as a table")
    assert(#rawOptions > 0, "Dropdown requires at least one feature")

    local function copyOptions(source)
        local result = {}
        for index, option in ipairs(source) do
            result[index] = tostring(option)
        end
        return result
    end

    local options = copyOptions(rawOptions)
    local multiSelect = forceMulti == true or config.Multi == true
    local currentNote = tostring(config.Note or config.Description or "")

    
    
    local actionSpec = nil
    if actionMode then
        actionSpec = {
            Hint = tostring(
                config.Hint
                    or config.Guide
                    or config.Prompt
                    or (
                        multiSelect
                and "Tick the features you want, then press the button"
                or "Pick a feature, then press the button"
                    )
            ),
            ButtonText = tostring(
                config.ButtonText or config.ActionText or "Apply"
            ),
            OnApply = function(values, indices)
                safeCallback(config.Callback, values, indices)
            end,
        }
    end

    local function findOptionIndex(choice)
        if type(choice) == "number" then
            return math.clamp(math.floor(choice), 1, #options)
        end
        for index, option in ipairs(options) do
            if option == tostring(choice) then
                return index
            end
        end
        return nil
    end

    local function normalizeDefault(choice)
        if multiSelect and type(choice) == "table" then
            local validChoices = {}
            for _, item in ipairs(choice) do
                local index = findOptionIndex(item)
                if index then
                    table.insert(validChoices, options[index])
                end
            end
            return validChoices
        end
        return findOptionIndex(choice) or 1
    end

    
    
    
    
    local row = Instance.new("Frame")
    row.Name = config.Name
    row.Active = false
    row.AnchorPoint = Vector2.new(0.5, 0.5)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.ClipsDescendants = false
    row.Position = UDim2.fromScale(0.5, 0.5)
    row.Size = UDim2.new(ROW_WIDTH_SCALE, 0, 0, 1)
    row.ZIndex = 3

    
    
    
    local function hostWidthScale()
        if RESIZE_KEEPS_OPTION_WIDTH then
            return ROW_WIDTH_SCALE / ContentScale.X
        end
        return ROW_WIDTH_SCALE
    end

    ContentScale.OnChanged(function()
        if row.Parent == nil then
            return false
        end
        row.Size = UDim2.new(
            hostWidthScale(),
            0,
            0,
            math.max(1, row.Size.Y.Offset)
        )
    end)

    local primitiveRow = nil
    local primitiveController = nil
    local mountSerial = 0

    local function mountDropdown(selectedValue)
        closeActiveDropdown()
        mountSerial = mountSerial + 1
        local serial = mountSerial

        if primitiveRow then
            primitiveRow:Destroy()
        end

        local mountedRow, mountedController = createDropdownRow(
            config.Name .. "Dropdown",
            config.Name,
            options,
            normalizeDefault(selectedValue),
            multiSelect,
            actionSpec,
            currentNote
        )
        primitiveRow = mountedRow
        primitiveController = mountedController
        primitiveRow.AnchorPoint = Vector2.new(0.5, 0)
        primitiveRow.Position = UDim2.fromScale(0.5, 0)
        primitiveRow.Size = UDim2.new(1, 0, 0, 1)
        primitiveRow.Parent = row

        local function syncHostHeight()
            if serial ~= mountSerial
                or primitiveRow ~= mountedRow
                or mountedRow.Parent == nil
            then
                return
            end
            row.Size = UDim2.new(
                hostWidthScale(),
                0,
                0,
                math.max(1, math.ceil(mountedRow.AbsoluteSize.Y))
            )
        end

        mountedRow:GetPropertyChangedSignal("AbsoluteSize"):Connect(
            syncHostHeight
        )
        
        
        
        for index = 1, (actionSpec and 0 or #options) do
            local item = findDescendant(mountedRow, "Option" .. index)
            connectSafeActivation(item, function()
                
                
                
                
                
                
                task.defer(function()
                    RunService.Heartbeat:Wait()
                    if serial ~= mountSerial
                        or primitiveController ~= mountedController
                        or mountedRow.Parent == nil
                    then
                        return
                    end
                    safeCallback(
                        config.Callback,
                        mountedController.GetValue()
                    )
                end)
            end)
        end

        syncHostHeight()
        task.defer(syncHostHeight)
    end

    mountDropdown(config.Default)

    return row, {
        GetValue = function()
            return primitiveController.GetValue()
        end,
        SetValue = function(value, fireCallback)
            primitiveController.SetValue(value)
            
            if fireCallback ~= false and not actionSpec then
                safeCallback(config.Callback, primitiveController.GetValue())
            end
        end,
        SetOptions = function(newOptions, selectedValue, fireCallback)
            assert(
                type(newOptions) == "table" and #newOptions > 0,
                "Dropdown SetOptions can danh sach khong rong"
            )
            local previousValue = primitiveController.GetValue()
            options = copyOptions(newOptions)
            mountDropdown(selectedValue or previousValue)
            if fireCallback ~= false and not actionSpec then
                safeCallback(config.Callback, primitiveController.GetValue())
            end
        end,
        Close = function()
            closeActiveDropdown()
        end,
        GetNote = function()
            return currentNote
        end,
        SetNote = function(value)
            currentNote = tostring(value or "")
            if primitiveController and primitiveController.SetNote then
                primitiveController.SetNote(currentNote)
            end
        end,
        
        Apply = actionSpec and function()
            primitiveController.Apply()
        end or nil,
        SetHint = actionSpec and function(text)
            actionSpec.Hint = tostring(text or "")
            primitiveController.SetHint(actionSpec.Hint)
        end or nil,
        SetActionText = actionSpec and function(text)
            actionSpec.ButtonText = tostring(
                text or actionSpec.ButtonText
            )
            primitiveController.SetActionText(actionSpec.ButtonText)
        end or nil,
    }
end





local TAB_LAYOUT = {
    Span = 0.895,
    NormalHeight = 0.130,
    GapRatio = 0.023 / 0.130,
}
local SECTION_ARROW = {
    Scale = 0.65,
    Spacing = 0.15,
    Arm = 0.22,
}
local SECTION_HEADER_ASPECT = 16

local sideButtonLayout = Instance.new("UIListLayout")
sideButtonLayout.FillDirection = Enum.FillDirection.Vertical
sideButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

sideButtonLayout.VerticalAlignment = Enum.VerticalAlignment.Top
sideButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
sideButtonLayout.Parent = sideButtons

local sideButtonPadding = Instance.new("UIPadding")
sideButtonPadding.Name = "TabPadding"
sideButtonPadding.PaddingTop = UDim.new(0.067, 0)
sideButtonPadding.Parent = sideButtons






local TabColumns = {}
do
    local function buildColumn(name, anchorX, edgeX)
        local frame = Instance.new("Frame")
        frame.Name = name
        frame.Active = false
        frame.AnchorPoint = Vector2.new(anchorX, 0.5)
        frame.BackgroundTransparency = 1
        frame.BorderSizePixel = 0
        frame.Position = UDim2.new(edgeX, 0, 0.558, 0)
        frame.Size = UDim2.new(0.2612044513, 0, 1, 0)
        frame.ZIndex = 99
        frame.Parent = mainFrame

        local layout = Instance.new("UIListLayout")
        layout.Name = "TabLayout"
        layout.FillDirection = Enum.FillDirection.Vertical
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.VerticalAlignment = Enum.VerticalAlignment.Top
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = frame

        local padding = Instance.new("UIPadding")
        padding.Name = "TabPadding"
        padding.PaddingTop = UDim.new(0.077, 0)
        padding.Parent = frame

        return {
            Frame = frame,
            Layout = layout,
            Padding = padding,
            AnchorX = anchorX,
            EdgeX = edgeX,
        }
    end

    TabColumns.Left = {
        Frame = sideButtons,
        Layout = sideButtonLayout,
        Padding = sideButtonPadding,
        AnchorX = 1,
        EdgeX = -0.025,
        CenterY = 0.558,
        TopPadding = 0.067,
        Width = 0.2612044513,
        GapRatio = TAB_LAYOUT.GapRatio,
    }
    TabColumns.Right = buildColumn("SideButtonsRight", 0, 1.025)
    TabColumns.Right.CenterY = 0.558
    TabColumns.Right.TopPadding = 0.067
    TabColumns.Right.Width = 0.2612044513
end



ContentScale.OnChanged(function(scaleX, scaleY)
    for _, column in pairs(TabColumns) do
        local gap = (column.EdgeX < 0) and (-0.025 / scaleX)
            or (1 + 0.025 / scaleX)
        column.Frame.Position = UDim2.new(
            gap,
            0,
            column.CenterY or 0.558,
            0
        )
        column.Frame.Size = UDim2.new(
            (column.Width or 0.2612044513) / scaleX,
            0,
            1,
            0
        )
        column.Padding.PaddingTop = UDim.new(
            (column.TopPadding or 0.067) / scaleY,
            0
        )
    end
end)


local function createSectionHeader(title, layoutOrder, clipViewport)
    local header = Instance.new("TextLabel")
    header.Name = title
    header.Active = false
    header.AnchorPoint = Vector2.new(0.5, 0.5)
    header.BackgroundTransparency = 1
    header.BorderSizePixel = 0
    header.LayoutOrder = layoutOrder
    
    
    
    header.Size = UDim2.new(0.97, 0, 0, 36)
    header.Text = title
    header.TextWrapped = true
    header.TextXAlignment = Enum.TextXAlignment.Center
    header.TextYAlignment = Enum.TextYAlignment.Center
    header.ZIndex = 4

    applyShinyTextStyle(header, normalTextFont)

    
    
    local arrowClip = Instance.new("Frame")
    arrowClip.Name = "ArrowClip"
    arrowClip.Active = false
    arrowClip.AnchorPoint = Vector2.new(0.5, 0.5)
    arrowClip.BackgroundTransparency = 1
    arrowClip.BorderSizePixel = 0
    arrowClip.ClipsDescendants = true
    arrowClip.Position = UDim2.fromScale(0.4, 0.5)
    arrowClip.Size = UDim2.fromOffset(1, 1)
    arrowClip.ZIndex = header.ZIndex + 2
    arrowClip.Parent = header

    local arrow = Instance.new("Frame")
    arrow.Name = "Arrow"
    arrow.Active = false
    arrow.AnchorPoint = Vector2.new(0.5, 0.5)
    arrow.BackgroundTransparency = 1
    arrow.BorderSizePixel = 0
    arrow.Position = UDim2.fromScale(0.5, 0.5)
    arrow.Size = UDim2.fromOffset(1, 1)
    arrow.ZIndex = header.ZIndex + 2
    arrow.Parent = arrowClip

    local armThickness = SECTION_ARROW.Arm
    local armInset = armThickness / 2
    local armLength = 0.56569 + armInset
    local armCenterX = 0.30 + 0.35355 * armInset
    local armCenterY = 0.50 + 0.35355 * armInset
    local outlineWidth = 0.06499999761581421 / SECTION_ARROW.Scale

    local function addChevronLayer(thickness, length, colors, zIndex)
        for _, arm in ipairs({
            {
                armCenterX,
                45,
            },
            {
                1 - armCenterX,
                -45,
            },
        }) do
            local piece = Instance.new("Frame")
            piece.Name = "Arm"
            piece.Active = false
            piece.AnchorPoint = Vector2.new(0.5, 0.5)
            piece.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            piece.BorderSizePixel = 0
            piece.Position = UDim2.fromScale(arm[1], armCenterY)
            piece.Rotation = arm[2]
            piece.Size = UDim2.fromScale(length, thickness)
            piece.ZIndex = zIndex
            piece.Parent = arrow

            local gradient = Instance.new("UIGradient")
            gradient.Color = colors
            gradient.Rotation = 90
            gradient.Parent = piece
        end
    end

    addChevronLayer(
        armThickness + outlineWidth * 2,
        armLength + outlineWidth * 2,
        blueStrokeGradient,
        header.ZIndex + 2
    )
    addChevronLayer(
        armThickness,
        armLength,
        shinyTextGradient,
        header.ZIndex + 3
    )

    local visualHalfWidth = 0.5
        - (
            armCenterX
            - (armLength + armThickness + outlineWidth * 4) * 0.35355
        )

    local function layoutArrow()
        local width = header.AbsoluteSize.X
        local height = header.AbsoluteSize.Y
        if width <= 0 or height <= 0 then
            return
        end
        local size = height * SECTION_ARROW.Scale
        local spacing = height * SECTION_ARROW.Spacing
        local textWidth = math.min(header.TextBounds.X, width)
        local reach = size * visualHalfWidth
        local centerX = (width - textWidth) / 2 - spacing - reach
        
        
        arrowClip.Size = UDim2.fromOffset(size * 1.35, size * 1.35)
        arrowClip.Position = UDim2.new(
            0,
            math.max(centerX, reach),
            0.5,
            0
        )
        arrow.Size = UDim2.fromOffset(size, size)
    end

    local function updateArrowVisibility()
        if not clipViewport then
            arrowClip.Visible = true
            return
        end

        local viewportTop = clipViewport.AbsolutePosition.Y
        local viewportBottom = viewportTop + clipViewport.AbsoluteSize.Y
        local arrowTop = arrowClip.AbsolutePosition.Y
        local arrowBottom = arrowTop + arrowClip.AbsoluteSize.Y
        arrowClip.Visible = arrowTop >= viewportTop
            and arrowBottom <= viewportBottom
    end

    header:GetPropertyChangedSignal("TextBounds"):Connect(layoutArrow)
    header:GetPropertyChangedSignal("AbsoluteSize"):Connect(layoutArrow)
    header:GetPropertyChangedSignal("AbsolutePosition"):Connect(
        updateArrowVisibility
    )
    arrowClip:GetPropertyChangedSignal("AbsolutePosition"):Connect(
        updateArrowVisibility
    )
    arrowClip:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        updateArrowVisibility
    )
    if clipViewport then
        clipViewport:GetPropertyChangedSignal("CanvasPosition"):Connect(
            updateArrowVisibility
        )
        clipViewport:GetPropertyChangedSignal("AbsolutePosition"):Connect(
            updateArrowVisibility
        )
        clipViewport:GetPropertyChangedSignal("AbsoluteSize"):Connect(
            updateArrowVisibility
        )
    end
    task.defer(layoutArrow)
    task.defer(updateArrowVisibility)

    local button = Instance.new("TextButton")
    button.Name = "SectionButton"
    button.Active = true
    button.AutoButtonColor = false
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Position = UDim2.fromScale(0, 0)
    button.Size = UDim2.fromScale(1, 1)
    button.Text = ""
    button.ZIndex = header.ZIndex + 4
    button.Parent = header

    return header, arrow, button
end




local function installApi()
local WindowMethods = {}
local TabMethods = {}
local SectionMethods = {}
local OptionMethods = {}
local StateMethods = {}
local ExclusiveGroupMethods = {}
local SurfaceMethods = {}
local ApiImpl = {}
Runtime.optionChangedHook = nil
Runtime.stateChangedHook = nil


Runtime.configLoadedHook = nil


Runtime.quickRefreshHook = nil

WindowMethods.__index = WindowMethods
TabMethods.__index = TabMethods
SectionMethods.__index = SectionMethods
OptionMethods.__index = OptionMethods
StateMethods.__index = StateMethods
ExclusiveGroupMethods.__index = ExclusiveGroupMethods
SurfaceMethods.__index = SurfaceMethods

local STATE_NO_CHANGE = {}
local MAX_STATE_TRANSACTION_STEPS = 256

local function assertObject(object, expectedKind)
    assert(
        type(object) == "table"
            and object._kind == expectedKind
            and not object._destroyed,
        ("API nay chi dung duoc tren %s con hoat dong"):format(expectedKind)
    )
end

local function copyLinkedValue(value, visited)
    if type(value) ~= "table" then
        return value
    end
    visited = visited or {}
    if visited[value] then
        return nil
    end
    visited[value] = true
    local result = {}
    for key, child in pairs(value) do
        local copiedKey = copyLinkedValue(key, visited)
        if copiedKey ~= nil then
            result[copiedKey] = copyLinkedValue(child, visited)
        end
    end
    visited[value] = nil
    return result
end

local function linkedValuesEqual(left, right, visited)
    if left == right then
        return true
    end
    if type(left) ~= type(right) or type(left) ~= "table" then
        return false
    end
    visited = visited or {}
    if visited[left] == right then
        return true
    end
    visited[left] = right
    for key, value in pairs(left) do
        if not linkedValuesEqual(value, right[key], visited) then
            return false
        end
    end
    for key in pairs(right) do
        if left[key] == nil then
            return false
        end
    end
    return true
end

local function callStateTransform(callback, fallback, ...)
    if type(callback) ~= "function" then
        return fallback
    end
    local arguments = table.pack(...)
    local ok, result = xpcall(function()
        return callback(table.unpack(arguments, 1, arguments.n))
    end, function(message)
        return debug.traceback(tostring(message), 2)
    end)
    if not ok then
        return fallback
    end
    return result
end

local function resolveState(object)
    if type(object) == "table" and object._kind == "State" then
        assertObject(object, "State")
        return object
    end
    if type(object) == "table" and object._kind == "Option" then
        assertObject(object, "Option")
        assert(object.State, "This feature has no state to link")
        return object.State
    end
    error("Provide a State or a feature with a state", 3)
end

local function choosePrimaryOption(state)
    state._primaryOption = nil
    local fallback = nil
    for option in pairs(state._views) do
        if not option._destroyed and option.Instance ~= nil then
            if not fallback then
                fallback = option
            end
            if type(option._userCallback) == "function" then
                state._primaryOption = option
                return
            end
        end
    end
    state._primaryOption = fallback
end

local function syncStateViews(state)
    for option, binding in pairs(state._views) do
        if option._destroyed or option.Instance == nil then
            state._views[option] = nil
        elseif option._controller.SetValue then
            local mappedValue = callStateTransform(
                binding.ToOption,
                state.Value,
                copyLinkedValue(state.Value),
                option,
                state
            )
            option._stateApplying = true
            local ok, problem = xpcall(function()
                option._controller.SetValue(
                    copyLinkedValue(mappedValue),
                    false
                )
            end, function(message)
                return debug.traceback(tostring(message), 2)
            end)
            option._stateApplying = false
            if not ok then
            end
        end
    end
    if state._primaryOption
        and (
            state._primaryOption._destroyed
            or state._primaryOption.Instance == nil
        )
    then
        choosePrimaryOption(state)
    end
end

local function markStateChanged(transaction, state)
    if transaction.changed[state] then
        return
    end
    transaction.changed[state] = true
    table.insert(transaction.order, state)
end

ApiImpl[1] = function(self, value, transaction, sourceOption)
    if self._destroyed then
        return false
    end
    if transaction.steps >= MAX_STATE_TRANSACTION_STEPS then
        if not transaction.warned then
            transaction.warned = true
            
            
        end
        return false
    end

    local normalized = callStateTransform(
        self.Normalize,
        value,
        copyLinkedValue(value),
        self
    )
    if normalized == STATE_NO_CHANGE then
        return false
    end

    for group in pairs(self._groups) do
        if not ApiImpl[17](group, self, normalized) then
            syncStateViews(self)
            return false
        end
    end

    if linkedValuesEqual(self.Value, normalized) then
        syncStateViews(self)
        return false
    end

    transaction.steps = transaction.steps + 1
    self.Value = copyLinkedValue(normalized)
    markStateChanged(transaction, self)
    syncStateViews(self)

    for group in pairs(self._groups) do
        ApiImpl[18](group, self, transaction)
    end

    for _, link in ipairs(self._links) do
        if link.Connected then
            local targetValue = callStateTransform(
                link.Transform,
                self.Value,
                copyLinkedValue(self.Value),
                copyLinkedValue(link.Target.Value),
                self,
                link.Target
            )
            if targetValue ~= STATE_NO_CHANGE then
                ApiImpl[1](link.Target, targetValue, transaction, sourceOption)
            end
        end
    end
    return true
end

local function stateUsesPrimaryCallback(state)
    return not state._registered or type(state.Callback) ~= "function"
end

local function runStateTransaction(
    state,
    value,
    fireCallback,
    sourceOption,
    sourceArguments
)
    local transaction = {
        changed = {},
        fireCallback = fireCallback ~= false,
        order = {},
        sourceArguments = sourceArguments,
        sourceOption = sourceOption,
        steps = 0,
        warned = false,
    }
    ApiImpl[1](state, value, transaction, sourceOption)
    if not transaction.fireCallback then
        for _, changedState in ipairs(transaction.order) do
            for _, subscriber in ipairs(changedState._subscribers) do
                if subscriber.Connected and subscriber.Internal then
                    safeCallback(subscriber.Callback, copyLinkedValue(changedState.Value), changedState, sourceOption)
                end
            end
        end
    end
    if transaction.fireCallback then
        for _, changedState in ipairs(transaction.order) do
            safeCallback(
                changedState.Callback,
                copyLinkedValue(changedState.Value),
                changedState,
                sourceOption
            )
            local primaryOption = changedState._primaryOption
            if stateUsesPrimaryCallback(changedState)
                and primaryOption
                and not primaryOption._destroyed
                and type(primaryOption._userCallback) == "function"
            then
                if primaryOption == sourceOption
                    and sourceArguments
                then
                    safeCallback(
                        primaryOption._userCallback,
                        table.unpack(
                            sourceArguments,
                            1,
                            sourceArguments.n
                        )
                    )
                else
                    safeCallback(
                        primaryOption._userCallback,
                        primaryOption._controller.GetValue()
                    )
                end
            end
            for _, subscriber in ipairs(changedState._subscribers) do
                if subscriber.Connected then
                    safeCallback(
                        subscriber.Callback,
                        copyLinkedValue(changedState.Value),
                        changedState,
                        sourceOption
                    )
                end
            end
        end

        local changedOption = sourceOption
        if not changedOption or changedOption._destroyed then
            for _, changedState in ipairs(transaction.order) do
                for option in pairs(changedState._views) do
                    if not option._destroyed and not option._configIgnored then
                        changedOption = option
                        break
                    end
                end
                if changedOption then
                    break
                end
            end
        end
        if changedOption and Runtime.optionChangedHook then
            Runtime.optionChangedHook(changedOption)
        elseif #transaction.order > 0 and Runtime.stateChangedHook then
            Runtime.stateChangedHook(transaction.order[1])
        end
    end
    return #transaction.order > 0
end

local function createStateObject(window, config, registered)
    local state = setmetatable({
        _kind = "State",
        _destroyed = false,
        _configIgnored = config.Save == false or config.Config == false,
        _groups = setmetatable({}, { __mode = "k" }),
        _links = {},
        _registered = registered == true,
        _subscribers = {},
        _views = setmetatable({}, { __mode = "k" }),
        Callback = config.Callback,
        Name = tostring(config.Name or "State"),
        Normalize = config.Normalize,
        Value = copyLinkedValue(config.Default),
        Window = window,
    }, StateMethods)
    window._stateObjects[state] = true
    return state
end

ApiImpl[2] = function(self)
    assertObject(self, "State")
    return copyLinkedValue(self.Value)
end

ApiImpl[3] = function(self, value, fireCallback)
    assertObject(self, "State")
    runStateTransaction(self, value, fireCallback, nil)
    return self
end

ApiImpl[4] = function(self, callback)
    assertObject(self, "State")
    assert(type(callback) == "function", "Subscribe can callback function")
    local connection = {
        Callback = callback,
        Connected = true,
    }
    function connection:Disconnect()
        self.Connected = false
    end
    table.insert(self._subscribers, connection)
    return connection
end

ApiImpl[5] = function(self, target, transform, options)
    assertObject(self, "State")
    target = resolveState(target)
    assert(target.Window == self.Window, "Hai State phai thuoc cung Window")
    options = type(options) == "table" and options or {}
    local link = {
        Connected = true,
        Source = self,
        Target = target,
        Transform = type(transform) == "function" and transform or nil,
    }
    function link:Disconnect()
        self.Connected = false
    end
    table.insert(self._links, link)
    if options.Immediate == true then
        local mapped = callStateTransform(
            link.Transform,
            self.Value,
            copyLinkedValue(self.Value),
            copyLinkedValue(target.Value),
            self,
            target
        )
        if mapped ~= STATE_NO_CHANGE then
            ApiImpl[3](target, mapped, options.FireCallback)
        end
    end
    return link
end

ApiImpl[6] = function(self, target, targetValue, options)
    if targetValue == nil then
        targetValue = true
    end
    return ApiImpl[5](self, target, function(value)
        if value == true then
            return copyLinkedValue(targetValue)
        end
        return STATE_NO_CHANGE
    end, options)
end

ApiImpl[7] = function(self, target, targetValue, options)
    if targetValue == nil then
        targetValue = false
    end
    return ApiImpl[5](self, target, function(value)
        if value == false then
            return copyLinkedValue(targetValue)
        end
        return STATE_NO_CHANGE
    end, options)
end

ApiImpl[8] = function(self,
    target,
    predicate,
    targetValue,
    options
)
    assert(type(predicate) == "function", "LinkWhen can predicate function")
    return ApiImpl[5](self, target, function(value, currentTarget, source, targetState)
        if predicate(value, currentTarget, source, targetState) then
            if type(targetValue) == "function" then
                return targetValue(
                    value,
                    currentTarget,
                    source,
                    targetState
                )
            end
            return copyLinkedValue(targetValue)
        end
        return STATE_NO_CHANGE
    end, options)
end

ApiImpl[9] = function(self, targets, transform, options)
    assert(type(targets) == "table", "LinkMany can danh sach target")
    local bundle = {
        Connected = true,
        Links = {},
    }
    for _, target in ipairs(targets) do
        table.insert(bundle.Links, ApiImpl[5](self, target, transform, options))
    end
    function bundle:Disconnect()
        self.Connected = false
        for _, link in ipairs(self.Links) do
            link:Disconnect()
        end
    end
    return bundle
end

ApiImpl[10] = function(self, targets, targetValue, options)
    assert(type(targets) == "table", "LinkManyWhenTrue can danh sach target")
    local bundle = {
        Connected = true,
        Links = {},
    }
    for _, target in ipairs(targets) do
        table.insert(
            bundle.Links,
            ApiImpl[6](self, target, targetValue, options)
        )
    end
    function bundle:Disconnect()
        self.Connected = false
        for _, link in ipairs(self.Links) do
            link:Disconnect()
        end
    end
    return bundle
end

ApiImpl[11] = function(self, target, options)
    return ApiImpl[5](self, target, function(value)
        return not value
    end, options)
end

ApiImpl[12] = function(self,
    target,
    forwardTransform,
    backwardTransform,
    options
)
    target = resolveState(target)
    local forward = ApiImpl[5](self, target, forwardTransform, options)
    local backward = ApiImpl[5](target, self, backwardTransform, {
        Immediate = false,
    })
    local pair = {
        Connected = true,
        Forward = forward,
        Backward = backward,
    }
    function pair:Disconnect()
        self.Connected = false
        self.Forward:Disconnect()
        self.Backward:Disconnect()
    end
    return pair
end



ApiImpl[13] = function(self)
    assertObject(self, "State")
    local window = self.Window
    local groups = {}
    for group in pairs(self._groups) do
        table.insert(groups, group)
    end
    for _, group in ipairs(groups) do
        if not group._destroyed then
            group:Remove(self)
        end
    end
    for _, link in ipairs(self._links) do
        link.Connected = false
    end
    for state in pairs(window._stateObjects) do
        for _, link in ipairs(state._links) do
            if link.Source == self or link.Target == self then
                link.Connected = false
            end
        end
    end
    for _, subscriber in ipairs(self._subscribers) do
        subscriber.Connected = false
    end
    for option in pairs(self._views) do
        option.State = nil
        option._stateBinding = nil
    end
    self._views = {}
    self._links = {}
    self._subscribers = {}
    self._groups = {}
    self._destroyed = true
    window._stateObjects[self] = nil
    if self._registered then
        window._stateByName[self.Name] = nil
        for index, state in ipairs(window.States) do
            if state == self then
                table.remove(window.States, index)
                break
            end
        end
    end
end

ApiImpl[14] = function(self)
    local count = 0
    for member in pairs(self._members) do
        if member.Value == true then
            count = count + 1
        end
    end
    return count
end

ApiImpl[15] = function(self, excludedState)
    local oldestState = nil
    local oldestOrder = math.huge
    for member in pairs(self._members) do
        if member ~= excludedState and member.Value == true then
            local order = self._activationOrder[member] or 0
            if order < oldestOrder then
                oldestOrder = order
                oldestState = member
            end
        end
    end
    return oldestState
end

ApiImpl[16] = function(self,
    preferredState,
    transaction,
    fireCallback
)
    while ApiImpl[14](self) > self.MaxActive do
        
        local oldestState = ApiImpl[15](self, preferredState)
            or ApiImpl[15](self, nil)
        if not oldestState then
            break
        end

        local changed = false
        if transaction then
            changed = ApiImpl[1](oldestState, false, transaction, nil)
        else
            local wasActive = oldestState.Value == true
            ApiImpl[3](oldestState, false, fireCallback)
            changed = wasActive and oldestState.Value ~= true
        end
        if not changed then
            break
        end
    end
end

ApiImpl[17] = function(self, state, value)
    if value ~= false or state.Value ~= true then
        return true
    end
    return ApiImpl[14](self) - 1 >= self.MinActive
end

ApiImpl[18] = function(self, state, transaction)
    if state.Value == true then
        self._nextActivationOrder = self._nextActivationOrder + 1
        self._activationOrder[state] = self._nextActivationOrder
        ApiImpl[16](self, state, transaction, nil)
    else
        self._activationOrder[state] = nil
    end
end

ApiImpl[19] = function(self, object)
    assertObject(self, "ExclusiveGroup")
    local state = resolveState(object)
    assert(state.Window == self.Window, "State and Feature must belong to the same Window")
    if self._members[state] then
        return self
    end
    self._members[state] = true
    state._groups[self] = true
    if state.Value == true then
        self._nextActivationOrder = self._nextActivationOrder + 1
        self._activationOrder[state] = self._nextActivationOrder
        ApiImpl[16](self, state, nil, false)
    end
    return self
end

ApiImpl[20] = function(self, object)
    assertObject(self, "ExclusiveGroup")
    local state = resolveState(object)
    self._members[state] = nil
    self._activationOrder[state] = nil
    state._groups[self] = nil
    return self
end

ApiImpl[21] = function(self, objects)
    assertObject(self, "ExclusiveGroup")
    assert(type(objects) == "table", "AddMany requires a State/Feature list")
    for _, object in ipairs(objects) do
        ApiImpl[19](self, object)
    end
    return self
end



ApiImpl[22] = function(self, object, fireCallback)
    assertObject(self, "ExclusiveGroup")
    local state = resolveState(object)
    assert(self._members[state], "This State/Feature is not in the group")
    ApiImpl[3](state, true, fireCallback)
    return self
end

ApiImpl[23] = function(self)
    assertObject(self, "ExclusiveGroup")
    local active = {}
    for state in pairs(self._members) do
        if state.Value == true then
            table.insert(active, state)
        end
    end
    table.sort(active, function(left, right)
        return (self._activationOrder[left] or 0)
            < (self._activationOrder[right] or 0)
    end)
    return active
end

ApiImpl[24] = function(self)
    assertObject(self, "ExclusiveGroup")
    return self.MinActive, self.MaxActive
end

ApiImpl[25] = function(self, maximum, fireCallback)
    assertObject(self, "ExclusiveGroup")
    local parsed = tonumber(maximum)
    assert(parsed, "MaxActive phai la mot so")
    self.MaxActive = math.max(1, math.floor(parsed))
    if self.MinActive > self.MaxActive then
        self.MinActive = self.MaxActive
    end
    self.AllowNone = self.MinActive == 0
    ApiImpl[16](self, nil, nil, fireCallback)
    return self
end

ApiImpl[26] = function(self, minimum)
    assertObject(self, "ExclusiveGroup")
    local parsed = tonumber(minimum)
    assert(parsed, "MinActive phai la mot so")
    self.MinActive = math.clamp(
        math.floor(parsed),
        0,
        self.MaxActive
    )
    self.AllowNone = self.MinActive == 0
    return self
end

ApiImpl[27] = function(self, allowNone)
    assertObject(self, "ExclusiveGroup")
    self.MinActive = allowNone and 0 or math.max(1, self.MinActive)
    self.AllowNone = self.MinActive == 0
    return self
end


ApiImpl[28] = function(self)
    assertObject(self, "ExclusiveGroup")
    self._destroyed = true
    for state in pairs(self._members) do
        state._groups[self] = nil
    end
    self._members = {}
    self._activationOrder = {}
    if self.Window then
        self.Window._exclusiveGroupByName[self.Name] = nil
        for index, group in ipairs(self.Window.ExclusiveGroups) do
            if group == self then
                table.remove(self.Window.ExclusiveGroups, index)
                break
            end
        end
    end
end

local function bindOptionToState(option, state, config)
    assertObject(state, "State")
    assert(
        state.Window == option.Section.Tab.Window,
        "State and Feature must belong to the same Window"
    )
    local binding = {
        FromOption = config.OptionToState,
        ToOption = config.StateToOption,
    }
    option.State = state
    option._stateBinding = binding
    state._views[option] = binding
    if not state._primaryOption
        or (
            type(state._primaryOption._userCallback) ~= "function"
            and type(option._userCallback) == "function"
        )
    then
        state._primaryOption = option
    end
    syncStateViews(state)
end

local function createOptionHandle(section, optionType, row, controller)
    local option = setmetatable({
        _kind = "Option",
        _destroyed = false,
        _controller = controller or {},
        _manualVisible = true,
        _resolvedVisible = true,
        _visibilityDependencies = {},
        _visibilityDependents = {},
        Section = section,
        Type = optionType,
        Name = row.Name,
        Instance = row,
    }, OptionMethods)

    table.insert(section.Options, option)
    return option
end

ApiImpl[29] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetValue
    if getter then
        return getter()
    end
    return nil
end

ApiImpl[30] = function(self, value, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetValue
    assert(setter, ("%s khong ho tro Set()"):format(self.Type))
    if self.State and not self._stateApplying then
        setter(value, false)
        local optionValue = self._controller.GetValue()
        local stateValue = callStateTransform(
            self._stateBinding.FromOption,
            optionValue,
            copyLinkedValue(optionValue),
            self,
            self.State
        )
        runStateTransaction(self.State, stateValue, fireCallback, self)
        if fireCallback ~= false
            and not stateUsesPrimaryCallback(self.State)
        then
            safeCallback(self._userCallback, self._controller.GetValue())
        end
        return self
    end
    setter(value, fireCallback)
    return self
end

ApiImpl[31] = function(self)
    assertObject(self, "Option")
    assert(self.State, ("%s khong co state"):format(self.Type))
    return self.State
end

ApiImpl[32] = function(self, state, config)
    assertObject(self, "Option")
    assert(self._controller.GetValue and self._controller.SetValue,
        ("%s khong ho tro State"):format(self.Type))
    state = resolveState(state)
    assert(state.Window == self.Section.Tab.Window,
        "State and Feature must belong to the same Window")
    local oldState = self.State
    if oldState then
        oldState._views[self] = nil
        choosePrimaryOption(oldState)
        if not oldState._registered
            and next(oldState._views) == nil
            and not oldState._destroyed
        then
            ApiImpl[13](oldState)
        end
    end
    bindOptionToState(self, state, type(config) == "table" and config or {})
    return self
end

ApiImpl[33] = function(self, other, config)
    return ApiImpl[32](self, resolveState(other), config)
end


ApiImpl[34] = function(self, target, transform, options)
    return ApiImpl[5](ApiImpl[31](self), target, transform, options)
end

ApiImpl[35] = function(self, target, targetValue, options)
    return ApiImpl[6](ApiImpl[31](self), target, targetValue, options)
end

ApiImpl[36] = function(self, target, targetValue, options)
    return ApiImpl[7](ApiImpl[31](self), target, targetValue, options)
end

ApiImpl[37] = function(self, target, predicate, targetValue, options)
    return ApiImpl[8](ApiImpl[31](self),
        target,
        predicate,
        targetValue,
        options
    )
end

ApiImpl[38] = function(self, targets, transform, options)
    return ApiImpl[9](ApiImpl[31](self), targets, transform, options)
end

ApiImpl[39] = function(self, targets, targetValue, options)
    return ApiImpl[10](ApiImpl[31](self),
        targets,
        targetValue,
        options
    )
end

ApiImpl[40] = function(self, target, options)
    return ApiImpl[11](ApiImpl[31](self), target, options)
end

ApiImpl[41] = function(self,
    target,
    forwardTransform,
    backwardTransform,
    options
)
    return ApiImpl[12](ApiImpl[31](self),
        target,
        forwardTransform,
        backwardTransform,
        options
    )
end

ApiImpl[42] = function(self, group)
    assertObject(self, "Option")
    assertObject(group, "ExclusiveGroup")
    ApiImpl[19](group, self)
    return self
end



local function dependencyMatches(dependency)
    local value = ApiImpl[2](dependency.Source)
    if dependency.Predicate then
        local ok, result = pcall(
            dependency.Predicate,
            copyLinkedValue(value),
            dependency.Source,
            dependency.Child
        )
        return ok and result == true
    end
    return linkedValuesEqual(value, dependency.Expected)
end















local function resolvedOptionVisibility(option, seen)
    if option._manualVisible == false then
        return false
    end
    for _, dependency in ipairs(option._visibilityDependencies or {}) do
        if dependency.Connected then
            if not dependencyMatches(dependency) then
                return false
            end
            local sourceOption = dependency.SourceOption
            if sourceOption and not sourceOption._destroyed then
                seen = seen or {}
                if not seen[sourceOption] then
                    seen[sourceOption] = true
                    if not resolvedOptionVisibility(sourceOption, seen) then
                        return false
                    end
                end
            end
        end
    end
    return true
end

ApiImpl[43] = function(self)
    
    
    
    
    local hostWidth = #(self._visibilityDependencies or {}) > 0 and 0.96 or 1
    if self._subOfParent then
        hostWidth = 0.9
    end
    self._visibilityHostWidth = hostWidth
    if self._visibilityHost and self._visibilityHost.Parent then
        local oldSize = self._visibilityHost.Size
        self._visibilityHost.Size = UDim2.new(
            hostWidth,
            0,
            oldSize.Y.Scale,
            oldSize.Y.Offset
        )
        return self._visibilityHost
    end

    local row = self.Instance
    local parent = row and row.Parent
    if not row or not parent then
        return row
    end

    local host = Instance.new("Frame")
    host.Name = row.Name .. "CollapsibleContent"
    host.Active = false
    host.BackgroundTransparency = 1
    host.BorderSizePixel = 0
    host.ClipsDescendants = true
    host.LayoutOrder = row.LayoutOrder
    host.Size = UDim2.new(
        hostWidth,
        0,
        0,
        math.max(1, row.AbsoluteSize.Y)
    )
    host.Visible = row.Visible
    host.ZIndex = row.ZIndex
    host.Parent = parent

    row.LayoutOrder = 1
    row.AnchorPoint = Vector2.new(0.5, 0)
    row.Position = UDim2.fromScale(0.5, 0)
    row.Visible = true
    row.Parent = host

    self._visibilityHost = host
    self._visibilityAnimating = false
    self._visibilityHostConnections = self._visibilityHostConnections or {}

    local function syncExpandedHeight()
        if self._destroyed or not host.Parent or not row.Parent then
            return
        end
        local height = math.max(1, row.AbsoluteSize.Y, row.Size.Y.Offset)
        self._visibilityExpandedHeight = height
        if not self._visibilityAnimating and self._resolvedVisible ~= false then
            host.Size = UDim2.new(
                self._visibilityHostWidth or 1,
                0,
                0,
                height
            )
        end
    end
    table.insert(
        self._visibilityHostConnections,
        row:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncExpandedHeight)
    )
    table.insert(
        self._visibilityHostConnections,
        row:GetPropertyChangedSignal("Size"):Connect(syncExpandedHeight)
    )
    syncExpandedHeight()
    return host
end

ApiImpl[44] = function(self, animated)
    assertObject(self, "Option")
    local previous = self._resolvedVisible
    local visible = resolvedOptionVisibility(self)
    self._resolvedVisible = visible

    
    
    
    
    
    
    
    
    if previous ~= visible and not self._cascadingVisibility then
        self._cascadingVisibility = true
        for _, dependency in ipairs(self._visibilityDependents or {}) do
            local child = dependency.Child
            if dependency.Connected
                and child
                and not child._destroyed
            then
                ApiImpl[44](child, animated)
            end
        end
        self._cascadingVisibility = false
    end

    local host = ApiImpl[43](self)
    if not host then
        return self
    end

    
    
    if self._preSearchVisible ~= nil then
        self._preSearchVisible = visible
        host.Visible = self._searchMatched == true and visible
        task.defer(self.Section._refreshHeight)
        return self
    end

    self._visibilityRevision = (self._visibilityRevision or 0) + 1
    local revision = self._visibilityRevision
    local wasAnimating = self._visibilityTween ~= nil
    if self._visibilityTween then
        self._visibilityTween:Cancel()
        self._visibilityTween = nil
    end
    if host.Visible == visible and not wasAnimating then
        return self
    end
    if not visible and self._controller.Close then
        self._controller.Close()
    end

    local row = self.Instance
    local expandedHeight = math.max(
        1,
        self._visibilityExpandedHeight or 0,
        row and row.AbsoluteSize.Y or 0,
        row and row.Size.Y.Offset or 0
    )
    self._visibilityExpandedHeight = expandedHeight
    local targetSize = UDim2.new(
        self._visibilityHostWidth or 1,
        0,
        0,
        visible and expandedHeight or 0
    )

    if visible then
        
        
        host.Visible = true
    end
    if animated == false then
        self._visibilityAnimating = false
        host.Size = targetSize
        host.Visible = visible
        task.defer(self.Section._refreshHeight)
        return self
    end

    self._visibilityAnimating = true
    local info = TweenInfo.new(
        0.28,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )
    self._visibilityTween = TweenService:Create(host, info, {
        Size = targetSize,
    })
    self._visibilityTween.Completed:Connect(function()
        if self._destroyed
            or revision ~= self._visibilityRevision
            or not self._visibilityHost
        then
            return
        end
        self._visibilityTween = nil
        self._visibilityAnimating = false
        host.Visible = visible
        if visible then
            host.Size = UDim2.new(
                self._visibilityHostWidth or 1,
                0,
                0,
                self._visibilityExpandedHeight or expandedHeight
            )
        end
        self.Section._refreshHeight()
        if self.Section._stabilizeLayout then
            self.Section._stabilizeLayout()
        end
    end)
    self._visibilityTween:Play()
    task.defer(self.Section._refreshHeight)
    return self
end

ApiImpl[45] = function(self, visible, animated)
    assertObject(self, "Option")
    self._manualVisible = visible == true
    return ApiImpl[44](self, animated)
end

ApiImpl[46] = function(self)
    assertObject(self, "Option")
    local visibilityObject = self._visibilityHost or self.Instance
    return visibilityObject.Visible == true
end





ApiImpl[47] = function(self, source, options)
    assertObject(self, "Option")
    options = type(options) == "table" and options or {}
    if type(source) == "string" then
        source = self.Section._optionByName[source]
    end
    local sourceOption = source
    local sourceState = resolveState(source)
    assert(
        sourceState.Window == self.Section.Tab.Window,
        "Visibility source and Feature must belong to the same Window"
    )
    if sourceOption and sourceOption._kind == "Option" then
        assert(
            sourceOption.Type == "toggle" or sourceOption.Type == "switch",
            "ShowWhen source must be a Toggle/Switch or State"
        )
    end

    local expected = options.Value
    if expected == nil then
        expected = options.Equals
    end
    if expected == nil then
        expected = true
    end
    local dependency = {
        Child = self,
        Connected = true,
        Expected = copyLinkedValue(expected),
        Predicate = type(options.Predicate) == "function"
            and options.Predicate
            or nil,
        Source = sourceState,
        
        
        
        SourceOption = sourceOption
            and sourceOption._kind == "Option"
            and sourceOption
            or nil,
    }
    function dependency:Disconnect()
        if not self.Connected then
            return
        end
        self.Connected = false
        if self.Connection then
            self.Connection:Disconnect()
        end
        if self.Child and not self.Child._destroyed then
            ApiImpl[44](self.Child, false)
        end
    end

    table.insert(self._visibilityDependencies, dependency)
    if sourceOption and sourceOption._kind == "Option" then
        table.insert(sourceOption._visibilityDependents, dependency)
    end
    dependency.Connection = ApiImpl[4](sourceState, function()
        if dependency.Connected and not self._destroyed then
            ApiImpl[44](self, options.Animated ~= false)
        end
    end)
    dependency.Connection.Internal = true
    ApiImpl[44](self, false)
    return dependency
end


















ApiImpl[48] = function(self, source)
    assertObject(self, "Option")
    if type(source) == "string" then
        source = self.Section._optionByName[source]
    end
    assertObject(source, "Option")
    assert(
        source.Section.Tab.Window == self.Section.Tab.Window,
        "SubOf parent and child must belong to the same Window"
    )
    assert(source ~= self, "An option cannot be a sub-option of itself")

    self._subOfParent = source
    source._subOptions = source._subOptions or {}
    table.insert(source._subOptions, self)

    
    
    
    
    if not self._subAspectApplied then
        local aspect = self.Instance
            and self.Instance:FindFirstChildOfClass("UIAspectRatioConstraint")
        if aspect then
            self._subAspectApplied = true
            aspect.AspectRatio = aspect.AspectRatio * 1.16
        end
    end

    
    
    
    ApiImpl[44](self, false)
    return self
end



ApiImpl[49] = function(self)
    assertObject(self, "Option")
    local list = {}
    for index, child in ipairs(self._subOptions or {}) do
        list[index] = child
    end
    return list
end

ApiImpl[50] = function(self, ...)
    assertObject(self, "Option")
    for index = 1, select("#", ...) do
        local child = select(index, ...)
        assertObject(child, "Option")
        ApiImpl[48](child, self)
    end
    return self
end

ApiImpl[51] = function(self, ...)
    assertObject(self, "Option")
    assert(
        self.Type == "toggle" or self.Type == "switch",
        "ShowOptions can only be called from a Toggle/Switch"
    )
    for index = 1, select("#", ...) do
        local child = select(index, ...)
        assertObject(child, "Option")
        ApiImpl[47](child, self)
    end
    return self
end

ApiImpl[52] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetNote
    assert(getter, ("%s khong ho tro Note"):format(self.Type))
    return getter()
end

ApiImpl[53] = function(self, note)
    assertObject(self, "Option")
    local setter = self._controller.SetNote
    assert(setter, ("%s khong ho tro SetNote()"):format(self.Type))
    setter(note)
    task.defer(self.Section._refreshHeight)
    if self.Section._stabilizeLayout then
        self.Section._stabilizeLayout()
    end
    return self
end

ApiImpl[54] = function(self, options, selectedValue, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetOptions
    assert(setter, ("%s khong ho tro SetOptions()"):format(self.Type))
    setter(options, selectedValue, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end

ApiImpl[55] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetRange
    assert(getter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    return getter()
end

ApiImpl[56] = function(self, minimum, maximum, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetRange
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(minimum, maximum, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end

ApiImpl[57] = function(self, minimum, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetMin
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(minimum, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end

ApiImpl[58] = function(self, maximum, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetMax
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(maximum, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end

ApiImpl[59] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetDecimals
    assert(getter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    return getter()
end

ApiImpl[60] = function(self, enabled, decimalPlaces, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetDecimals
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(enabled, decimalPlaces, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end

ApiImpl[61] = function(self, increment, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetIncrement
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(increment, false)
    ApiImpl[30](self, ApiImpl[29](self), fireCallback)
    return self
end





ApiImpl[62] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetUnit
    assert(getter, ("%s khong ho tro Unit"):format(self.Type))
    return getter()
end

ApiImpl[63] = function(self, unit, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetUnit
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(unit, fireCallback)
    return self
end

ApiImpl[64] = function(self, units, selected, fireCallback)
    assertObject(self, "Option")
    local setter = self._controller.SetUnits
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(units, selected, fireCallback)
    return self
end

ApiImpl[65] = function(self, enabled)
    assertObject(self, "Option")
    local setter = self._controller.SetUnitEnabled
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(enabled)
    return self
end

ApiImpl[66] = function(self, enabled)
    assertObject(self, "Option")
    local setter = self._controller.SetUnitSelectorEnabled
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(enabled)
    return self
end

ApiImpl[67] = function(self, formatFn)
    assertObject(self, "Option")
    local setter = self._controller.SetUnitFormat
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(formatFn)
    return self
end

ApiImpl[68] = function(self, callback)
    assertObject(self, "Option")
    local setter = self._controller.SetUnitCallback
    assert(setter, ("%s khong ho tro Unit"):format(self.Type))
    setter(callback)
    return self
end

ApiImpl[69] = function(self, formatFn)
    assertObject(self, "Option")
    local setter = self._controller.SetValueFormat
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(formatFn)
    return self
end

ApiImpl[70] = function(self, parseFn)
    assertObject(self, "Option")
    local setter = self._controller.SetValueParse
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(parseFn)
    return self
end

ApiImpl[71] = function(self)
    assertObject(self, "Option")
    local getter = self._controller.GetValueColors
    assert(getter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    return getter()
end

ApiImpl[72] = function(self, colors)
    assertObject(self, "Option")
    local setter = self._controller.SetValueColors
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(colors)
    return self
end

ApiImpl[73] = function(self, enabled)
    assertObject(self, "Option")
    local setter = self._controller.SetValueColorEnabled
    assert(setter, ("%s khong phai Slider/Slidebar"):format(self.Type))
    setter(enabled)
    return self
end




ApiImpl[74] = function(self)
    assertObject(self, "Option")
    return ("%s > %s > %s"):format(
        self.Section.Tab.Name,
        self.Section.Name,
        self.Name
    )
end

ApiImpl[75] = function(self)
    assertObject(self, "Option")
    return self._quickName or self.DisplayName or self.Name
end

ApiImpl[76] = function(self, name)
    assertObject(self, "Option")
    self._quickName = name ~= nil and tostring(name) or nil
    if Runtime.quickRefreshHook then
        Runtime.quickRefreshHook()
    end
    return self
end

ApiImpl[77] = function(self)
    assertObject(self, "Option")
    return self._keybindGroup
end

ApiImpl[78] = function(self, name)
    assertObject(self, "Option")
    self._keybindGroup = name ~= nil and tostring(name) or nil
    return self
end

ApiImpl[79] = function(self)
    assertObject(self, "Option")
    return self._quickIgnored ~= true
end

ApiImpl[80] = function(self, enabled)
    assertObject(self, "Option")
    self._quickIgnored = enabled == false
    if Runtime.quickRefreshHook then
        Runtime.quickRefreshHook()
    end
    return self
end

ApiImpl[81] = function(self)
    assertObject(self, "Option")
    local press = self._controller.Press
    assert(press, ("%s khong phai Button"):format(self.Type))
    press()
    return self
end




ApiImpl[82] = function(self)
    assertObject(self, "Option")
    local apply = self._controller.Apply
    assert(apply, ("%s khong ho tro Apply()"):format(self.Type))
    apply()
    return self
end

ApiImpl[83] = function(self, text)
    assertObject(self, "Option")
    local setter = self._controller.SetHint
    assert(setter, ("%s khong ho tro SetHint()"):format(self.Type))
    setter(text)
    return self
end

ApiImpl[84] = function(self, text)
    assertObject(self, "Option")
    local setter = self._controller.SetActionText
    assert(setter, ("%s khong ho tro SetActionText()"):format(self.Type))
    setter(text)
    return self
end

ApiImpl[85] = function(self)
    assertObject(self, "Option")
    local section = self.Section
    self._destroyed = true

    self._visibilityRevision = (self._visibilityRevision or 0) + 1
    if self._visibilityTween then
        self._visibilityTween:Cancel()
        self._visibilityTween = nil
    end
    for _, connection in ipairs(self._visibilityHostConnections or {}) do
        if connection.Connected then
            connection:Disconnect()
        end
    end
    self._visibilityHostConnections = {}
    for _, dependency in ipairs(self._visibilityDependencies or {}) do
        dependency.Connected = false
        if dependency.Connection then
            dependency.Connection:Disconnect()
        end
    end
    self._visibilityDependencies = {}
    for _, dependency in ipairs(self._visibilityDependents or {}) do
        dependency:Disconnect()
    end
    self._visibilityDependents = {}

    if self._controller.Close then
        self._controller.Close()
    end
    if self._controller.Destroy then
        local ok, problem = pcall(self._controller.Destroy)
        if not ok then
        end
    end

    local state = self.State
    if state then
        state._views[self] = nil
        choosePrimaryOption(state)
        self.State = nil
        self._stateBinding = nil
        if not state._registered
            and next(state._views) == nil
            and not state._destroyed
        then
            ApiImpl[13](state)
        end
    end

    section._optionByName[self.Name] = nil
    for index, option in ipairs(section.Options) do
        if option == self then
            table.remove(section.Options, index)
            break
        end
    end
    if self._visibilityHost then
        self._visibilityHost:Destroy()
        self._visibilityHost = nil
        self.Instance = nil
    elseif self.Instance then
        self.Instance:Destroy()
        self.Instance = nil
    end
    self._controller = {}
    if not section._destroyed then
        task.defer(section._refreshHeight)
    end
end


local function bindResponsiveFixedRowHeight(section, row)
    local callback = Protected[1]
    assert(type(callback) == "function", "Protected UI engine is not ready.")
    return callback(section, row)
end


local function addRowToSection(section, optionType, row, controller)
    assertObject(section, "Section")
    section._nextOptionOrder = section._nextOptionOrder + 1
    row.LayoutOrder = section._nextOptionOrder
    row.Parent = section._content
    local cleanupResponsive = bindResponsiveFixedRowHeight(section, row)
    
    
    local rowSizeConnection = row:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        section._refreshHeight
    )
    controller = controller or {}
    local originalDestroy = controller.Destroy
    local controllerDestroyed = false
    controller.Destroy = function()
        if controllerDestroyed then
            return
        end
        controllerDestroyed = true
        if originalDestroy then
            originalDestroy()
        end
        cleanupResponsive()
        if rowSizeConnection.Connected then
            rowSizeConnection:Disconnect()
        end
    end
    task.defer(section._refreshHeight)
    if section._stabilizeLayout then
        section._stabilizeLayout()
    end
    return createOptionHandle(section, optionType, row, controller)
end


local optionFactories = {
    [1] = function(config) return createLibraryButtonRow(config) end,
    [2] = function(config) return createLibraryDropdownRow(config, false) end,
    [3] = function(config) return createLibraryDropdownRow(config, true) end,
    [4] = function(config) return createLibraryDropdownRow(config, false, true) end,
    [5] = function(config) return createLibraryDropdownRow(config, true, true) end,
    [6] = function(config) return createLibraryInputRow(config) end,
    [7] = function(config) return createLibraryTextRow(config) end,
    [8] = function(config) return createLibrarySliderRow(config) end,
    [9] = function(config)
        if config.Note ~= nil or config.Description ~= nil then
            return createLibraryNoteToggleRow(config)
        end
        return createLibraryToggleRow(config)
    end,
}

optionFactories[10] = (function()
    local DEFAULT_STYLE = {
        TextScale = 1,
        TitleScale = 1,
        Font = "Gotham",
        LineHeight = 1.16,
        Padding = 1,
        Alignment = "Left",
        BackgroundTransparency = 0.5,
        TextColor = Color3.fromRGB(235, 235, 235),
        TextStrokeTransparency = 0.7,
        GroupColor = Color3.fromRGB(58, 255, 55),
        GroupSpacing = true,
        MaxLines = 0,
        ImageLines = 2.3,
        ItemSpacing = 0.35,
        SpotlightLines = 5,
        SpotlightBackgroundColor = Color3.fromRGB(0, 0, 0),
        SpotlightBackgroundTransparency = 1,
        SpotlightModelScale = 1,
        SpotlightDividerColor = false,
        ScrollBarColor = Color3.fromRGB(255, 255, 255),
        ItemBackgroundColor = Color3.fromRGB(255, 255, 255),
        ItemBackgroundTransparency = 1,
        SelectedBackgroundColor = Color3.fromRGB(58, 255, 55),
        SelectedBackgroundTransparency = 0.86,
        HoverBackgroundColor = Color3.fromRGB(255, 255, 255),
        HoverBackgroundTransparency = 0.93,
        TitlePartSpacing = 0.34,
    }

    local BODY_RATIO = 0.026
    local SPIN_RATE = 20
    local SPIN_SPEED = math.rad(28)
    local VISIBILITY_CHECK = 0.5

    local SELECTED_COLOR = Color3.fromRGB(58, 255, 55)
    local HOVER_COLOR = Color3.fromRGB(255, 255, 255)
    local DEFAULT_IMAGE_COLOR = Color3.fromRGB(90, 90, 110)

    local FONTS = {
        ["gotham"] = normalTextFont,
        ["gotham medium"] = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        ["fredoka"] = Font.new(
            "rbxasset://fonts/families/FredokaOne.json",
            Enum.FontWeight.Regular,
            Enum.FontStyle.Normal
        ),
        ["code"] = Font.new(
            "rbxasset://fonts/families/RobotoMono.json",
            Enum.FontWeight.Bold,
            Enum.FontStyle.Normal
        ),
    }

    local ALIGNMENTS = {
        left = Enum.TextXAlignment.Left,
        center = Enum.TextXAlignment.Center,
        right = Enum.TextXAlignment.Right,
    }

    local function resolveFont(value)
        if typeof(value) == "Font" then
            return value
        end
        if typeof(value) == "EnumItem" then
            local ok, font = pcall(Font.fromEnum, value)
            if ok then
                return font
            end
        end
        return FONTS[string.lower(tostring(value))] or normalTextFont
    end

    local function mergeStyle(style, patch)
        if type(patch) ~= "table" then
            return
        end
        for key, value in pairs(patch) do
            if DEFAULT_STYLE[key] ~= nil then
                style[key] = value
            end
        end
    end

    local function toHex(color, fallback)
        if typeof(color) == "Color3" then
            return "#" .. color:ToHex()
        end
        if type(color) == "string" and color ~= "" then
            return color
        end
        return fallback
    end

    local function toColor3(value, fallback)
        if typeof(value) == "Color3" then
            return value
        end
        if type(value) == "string" then
            local ok, color = pcall(Color3.fromHex, value)
            if ok then
                return color
            end
        end
        return fallback
    end

    local function escapeText(text)
        return (string.gsub(tostring(text), "[<>&]", {
            ["<"] = "&lt;",
            [">"] = "&gt;",
            ["&"] = "&amp;",
        }))
    end

    local function plainText(text)
        local plain = string.gsub(tostring(text), "<[^>]*>", "")
        plain = string.gsub(plain, "&lt;", "<")
        plain = string.gsub(plain, "&gt;", ">")
        plain = string.gsub(plain, "&amp;", "&")
        return string.lower(plain)
    end

    local function splitLines(text)
        local lines = {}
        for line in string.gmatch(tostring(text) .. "\n", "(.-)\n") do
            table.insert(lines, { Text = line })
        end
        return lines
    end

    local function normalizeItem(item)
        if type(item) == "table" then
            return {
                Text = tostring(item.Text or ""),
                Title = item.Title ~= nil and tostring(item.Title) or nil,
                Gradient = item.Gradient,
                TitleParts = item.TitleParts,
                TopRightText = item.TopRightText ~= nil and tostring(item.TopRightText) or nil,
                Image = item.Image ~= nil and tostring(item.Image) or nil,
                ImageColor = item.ImageColor,
                Id = item.Id,
            }
        end
        return { Text = tostring(item) }
    end

    -- Generic title-part data used by callers that need independently styled
    -- pieces (for example two labels with different fonts and gradients).
    -- This is rendering capability only; callers own all feature semantics.
    local function normalizeTitleParts(parts)
        local list = {}
        if type(parts) ~= "table" then
            return list
        end
        for _, part in ipairs(parts) do
            if type(part) == "table" and part.Text ~= nil then
                table.insert(list, {
                    Text = tostring(part.Text),
                    Color = part.Color,
                    Gradient = part.Gradient,
                    StrokeGradient = part.StrokeGradient,
                    Font = part.Font,
                    Scale = part.Scale,
                    StrokeColor = part.StrokeColor,
                    StrokeTransparency = part.StrokeTransparency,
                    StrokeThickness = part.StrokeThickness,
                })
            end
        end
        return list
    end

    local function normalizeItems(items)
        local list = {}
        if type(items) == "table" then
            for _, item in ipairs(items) do
                table.insert(list, normalizeItem(item))
            end
        end
        return list
    end

    local function normalizeGroups(groups)
        local list = {}
        if type(groups) == "table" then
            for _, group in ipairs(groups) do
                if type(group) == "table" then
                    table.insert(list, {
                        Title = tostring(group.Title or group.Name or ""),
                        Color = group.Color,
                        Items = normalizeItems(group.Items),
                    })
                end
            end
        end
        return list
    end

    local function cloneForViewport(template)
        if typeof(template) ~= "Instance" then
            return nil
        end
        local ok, copy = pcall(function()
            return template:Clone()
        end)
        if not ok or not copy then
            return nil
        end
        for _, descendant in ipairs(copy:GetDescendants()) do
            if descendant:IsA("LuaSourceContainer")
                or descendant:IsA("ParticleEmitter")
                or descendant:IsA("Trail")
                or descendant:IsA("Beam")
                or descendant:IsA("Light")
                or descendant:IsA("Sound")
                or descendant:IsA("Fire")
                or descendant:IsA("Smoke")
                or descendant:IsA("Sparkles")
            then
                descendant:Destroy()
            elseif descendant:IsA("BasePart") then
                descendant.Anchored = true
                descendant.CanCollide = false
                descendant.CastShadow = false
            end
        end
        if copy:IsA("BasePart") then
            copy.Anchored = true
        end
        return copy
    end

    local function isShown(gui)
        if not gui:IsDescendantOf(game) then
            return false
        end
        local node = gui
        while node do
            if node:IsA("GuiObject") and not node.Visible then
                return false
            end
            if node:IsA("LayerCollector") then
                return node.Enabled
            end
            node = node.Parent
        end
        return false
    end

    local function makeCorner(parent)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = parent
        return corner
    end

    local function makeFixedStroke(parent, color)
        local stroke = Instance.new("UIStroke")
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Color = color
        stroke.LineJoinMode = Enum.LineJoinMode.Round
        stroke.Thickness = 1
        stroke.Parent = parent
        return stroke
    end

    local function makeTextStroke(label)
        local stroke = Instance.new("UIStroke")
        stroke.Name = "TextOutline"
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.LineJoinMode = Enum.LineJoinMode.Round
        pcall(function()
            stroke.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
        end)
        stroke.Thickness = 1
        stroke.Transparency = 0
        stroke.Parent = label
        return stroke
    end

    local function applyGradient(label, source)
        local existing = label:FindFirstChild("ChilliGradient")
        if source == nil then
            if existing then
                existing:Destroy()
            end
            return
        end
        if typeof(source) == "Instance" and source:IsA("UIGradient") then
            if existing then
                existing:Destroy()
            end
            local ok, copy = pcall(function()
                return source:Clone()
            end)
            if ok and copy then
                copy.Name = "ChilliGradient"
                copy.Parent = label
            end
            return
        end
        if typeof(source) == "ColorSequence" then
            local gradient = existing
            if not gradient then
                gradient = Instance.new("UIGradient")
                gradient.Name = "ChilliGradient"
                gradient.Parent = label
            end
            gradient.Color = source
        end
    end

    local function createLibraryParagraphRow(config)
        local style = {}
        for key, value in pairs(DEFAULT_STYLE) do
            style[key] = value
        end
        mergeStyle(style, config.Style)

        local content = {
            Title = config.Title ~= nil and tostring(config.Title) or tostring(config.Name),
            ShowTitle = config.ShowTitle ~= false,
            Header = config.Header ~= nil and tostring(config.Header) or "",
            Text = "",
            Items = {},
            Groups = nil,
            SearchEnabled = config.Search == true,
            SearchPlaceholder = tostring(config.SearchPlaceholder or "Search..."),
            Query = "",
            Selected = config.Selected,
            Spotlight = nil,
        }
        if type(config.Groups) == "table" then
            content.Groups = normalizeGroups(config.Groups)
        elseif type(config.Items) == "table" then
            content.Items = normalizeItems(config.Items)
        else
            content.Text = tostring(config.Text or config.Value or "")
            content.Items = splitLines(content.Text)
        end
        local onItemClick = type(config.OnItemClick) == "function" and config.OnItemClick or nil

        local row = createLibraryTextRow({
            Name = config.Name,
            Text = content.Title,
        })
        local labelAspect = row:FindFirstChildOfClass("UIAspectRatioConstraint")
        if labelAspect then
            labelAspect:Destroy()
        end
        row:SetAttribute("ChilliResponsiveAspect", nil)
        row.ClipsDescendants = false
        row.Size = UDim2.new(ROW_WIDTH_SCALE, 0, 0, 1)

        local main = row:FindFirstChild("Main")
        local title = main:FindFirstChild("Label")
        local plateStroke = main:FindFirstChildOfClass("UIStroke")
        main.ClipsDescendants = true
        title.AnchorPoint = Vector2.new(0, 0)

        local function hostWidthScale()
            if RESIZE_KEEPS_OPTION_WIDTH then
                return ROW_WIDTH_SCALE / ContentScale.X
            end
            return ROW_WIDTH_SCALE
        end

        local searchField = Instance.new("Frame")
        searchField.Name = "SearchField"
        searchField.Active = false
        searchField.AnchorPoint = Vector2.new(0.5, 0.5)
        searchField.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        searchField.BackgroundTransparency = 0.6
        searchField.BorderSizePixel = 0
        searchField.Visible = false
        searchField.ZIndex = 4
        searchField.Parent = main
        addScaledStroke(searchField, Enum.ApplyStrokeMode.Border, 0.1)

        local searchUnderline = Instance.new("Frame")
        searchUnderline.Name = "Underline"
        searchUnderline.Active = false
        searchUnderline.AnchorPoint = Vector2.new(0.5, 1)
        searchUnderline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        searchUnderline.BorderSizePixel = 0
        searchUnderline.Position = UDim2.fromScale(0.5, 1)
        searchUnderline.Size = UDim2.fromScale(0, 0.11)
        searchUnderline.ZIndex = 6
        searchUnderline.Parent = searchField

        local searchBox = Instance.new("TextBox")
        searchBox.Name = "SearchInput"
        searchBox.Active = true
        searchBox.AnchorPoint = Vector2.new(0.5, 0.5)
        searchBox.BackgroundTransparency = 1
        searchBox.BorderSizePixel = 0
        searchBox.ClearTextOnFocus = false
        searchBox.MultiLine = false
        searchBox.Position = UDim2.fromScale(0.5, 0.5)
        searchBox.Size = UDim2.fromScale(0.9, 0.56)
        searchBox.Text = ""
        searchBox.PlaceholderText = content.SearchPlaceholder
        searchBox.PlaceholderColor3 = Color3.fromRGB(198, 198, 198)
        searchBox.TextXAlignment = Enum.TextXAlignment.Center
        searchBox.TextYAlignment = Enum.TextYAlignment.Center
        searchBox.ZIndex = 5
        searchBox.Parent = searchField
        applyPlainTextStyle(searchBox)

        local function tweenSearchFocus(focused)
            TweenService:Create(searchField, TweenInfo.new(0.16), {
                BackgroundTransparency = focused and 0.42 or 0.6,
            }):Play()
            TweenService:Create(
                searchUnderline,
                TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Size = UDim2.fromScale(focused and 1 or 0, 0.11) }
            ):Play()
        end

        local spotFrame = Instance.new("Frame")
        spotFrame.Name = "Spotlight"
        spotFrame.Active = false
        spotFrame.BackgroundTransparency = 1
        spotFrame.BorderSizePixel = 0
        spotFrame.Visible = false
        spotFrame.ZIndex = 5
        spotFrame.Parent = main

        local spotView = Instance.new("ViewportFrame")
        spotView.Name = "Model"
        spotView.Ambient = Color3.fromRGB(170, 170, 180)
        spotView.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        spotView.BackgroundTransparency = 1
        spotView.BorderSizePixel = 0
        spotView.LightColor = Color3.fromRGB(255, 255, 255)
        spotView.LightDirection = Vector3.new(-0.6, -1, -0.4)
        spotView.ZIndex = 6
        spotView.Parent = spotFrame
        local spotViewCorner = makeCorner(spotView)
        local spotCamera = Instance.new("Camera")
        spotCamera.FieldOfView = 40
        spotCamera.Parent = spotView
        spotView.CurrentCamera = spotCamera

        local spotText = Instance.new("TextLabel")
        spotText.Name = "Info"
        spotText.Active = false
        spotText.BackgroundTransparency = 1
        spotText.BorderSizePixel = 0
        spotText.RichText = true
        spotText.Text = ""
        spotText.TextScaled = false
        spotText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        spotText.TextWrapped = true
        spotText.TextXAlignment = Enum.TextXAlignment.Left
        spotText.TextYAlignment = Enum.TextYAlignment.Center
        spotText.ZIndex = 6
        spotText.Parent = spotFrame

        local spotTitle = Instance.new("TextLabel")
        spotTitle.Name = "SpotlightTitle"
        spotTitle.Active = false
        spotTitle.BackgroundTransparency = 1
        spotTitle.BorderSizePixel = 0
        spotTitle.FontFace = normalTextFont
        spotTitle.Text = ""
        spotTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        spotTitle.TextScaled = false
        spotTitle.TextStrokeTransparency = 1
        spotTitle.TextWrapped = false
        spotTitle.TextXAlignment = Enum.TextXAlignment.Left
        spotTitle.TextYAlignment = Enum.TextYAlignment.Center
        spotTitle.Visible = false
        spotTitle.ZIndex = 6
        spotTitle.Parent = spotFrame
        local spotTitleStroke = makeTextStroke(spotTitle)
        local spotTitleParts = {
            { Label = spotTitle, Stroke = spotTitleStroke, GradientSource = nil, Spec = nil },
        }

        local spotDivider = Instance.new("Frame")
        spotDivider.Name = "SpotlightDivider"
        spotDivider.Active = false
        spotDivider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        spotDivider.BackgroundTransparency = 0.45
        spotDivider.BorderSizePixel = 0
        spotDivider.Visible = false
        spotDivider.ZIndex = 6
        spotDivider.Parent = main

        local viewport = Instance.new("ScrollingFrame")
        viewport.Name = "BodyViewport"
        viewport.Active = true
        viewport.BackgroundTransparency = 1
        viewport.BorderSizePixel = 0
        viewport.CanvasSize = UDim2.new()
        viewport.ElasticBehavior = Enum.ElasticBehavior.Never
        viewport.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
        viewport.ScrollBarImageTransparency = 0
        viewport.ScrollingDirection = Enum.ScrollingDirection.Y
        viewport.ZIndex = 5
        viewport.Parent = main

        local destroyed = false
        local titleDirty = true
        local searchDirty = true
        local contentDirty = true
        local layoutDirty = true
        local selectionDirty = false
        local spotlightDirty = false
        local lastWidth = -1

        local rows = {}
        local specs = {}

        local function createTitlePart(parent, zIndex)
            local label = Instance.new("TextLabel")
            label.Name = "TitlePart"
            label.Active = false
            label.BackgroundTransparency = 1
            label.BorderSizePixel = 0
            label.FontFace = normalTextFont
            label.Text = ""
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextScaled = false
            label.TextStrokeTransparency = 1
            label.TextTruncate = Enum.TextTruncate.AtEnd
            label.TextWrapped = false
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.TextYAlignment = Enum.TextYAlignment.Center
            label.Visible = false
            label.ZIndex = zIndex
            label.Parent = parent
            return {
                Label = label,
                Stroke = makeTextStroke(label),
                GradientSource = nil,
                StrokeGradientSource = nil,
                Spec = nil,
            }
        end

        local function syncTitleParts(records, parent, parts, legacyTitle, legacyGradient, zIndex)
            local normalized = normalizeTitleParts(parts)
            if #normalized == 0 and legacyTitle ~= nil then
                normalized[1] = { Text = tostring(legacyTitle), Gradient = legacyGradient }
            end
            local changed = false
            for index, part in ipairs(normalized) do
                local titlePart = records[index]
                if not titlePart then
                    titlePart = createTitlePart(parent, zIndex)
                    records[index] = titlePart
                    changed = true
                end
                if titlePart.Label.Text ~= part.Text then
                    titlePart.Label.Text = part.Text
                    changed = true
                end
                if titlePart.GradientSource ~= part.Gradient then
                    titlePart.GradientSource = part.Gradient
                    applyGradient(titlePart.Label, part.Gradient)
                    changed = true
                end
                if titlePart.StrokeGradientSource ~= part.StrokeGradient then
                    titlePart.StrokeGradientSource = part.StrokeGradient
                    applyGradient(titlePart.Stroke, part.StrokeGradient)
                    changed = true
                end
                if titlePart.Spec ~= part then
                    changed = true
                end
                titlePart.Spec = part
                titlePart.Label.Visible = true
            end
            for index = #normalized + 1, #records do
                local titlePart = records[index]
                if titlePart.Label.Visible then
                    titlePart.Label.Visible = false
                    changed = true
                end
                titlePart.Spec = nil
            end
            return #normalized > 0, changed
        end

        local function layoutTitleParts(records, x, y, width, height, baseSize, defaultFont, alignment, spacing)
            local visible = {}
            local totalWidth = 0
            for _, titlePart in ipairs(records) do
                local part = titlePart.Spec
                if part then
                    local label = titlePart.Label
                    local partSize = math.max(8, math.floor(baseSize * math.max(0.3, tonumber(part.Scale) or 1) + 0.5))
                    label.FontFace = resolveFont(part.Font or defaultFont)
                    label.TextSize = partSize
                    label.TextColor3 = toColor3(part.Color, Color3.fromRGB(255, 255, 255))
                    -- TextBounds is zero while a fresh unwrapped label still has
                    -- zero width. Give it the available box before measuring.
                    label.Size = UDim2.fromOffset(math.max(1, width), math.max(1, height))
                    local stroke = titlePart.Stroke
                    stroke.Color = toColor3(part.StrokeColor, Color3.fromRGB(0, 0, 0))
                    stroke.Transparency = math.clamp(tonumber(part.StrokeTransparency) or 0, 0, 1)
                    stroke.Thickness = math.max(0.5, tonumber(part.StrokeThickness) or math.max(1, partSize * 0.1))
                    local measuredWidth = label.TextBounds.X
                    if measuredWidth <= 0 then
                        local characterCount = utf8.len(label.Text) or #label.Text
                        measuredWidth = characterCount * partSize * 0.62
                        -- Roblox updates TextBounds after the label has a real
                        -- width. Reflow on the next frame to replace the safe
                        -- estimate with the exact font measurement.
                        layoutDirty = true
                    end
                    local measured = math.max(1, math.ceil(measuredWidth + partSize * 0.08))
                    table.insert(visible, { Part = titlePart, Width = measured })
                    totalWidth += measured
                end
            end
            if #visible == 0 then
                return
            end
            local gap = math.max(0, spacing) * (#visible - 1)
            local naturalWidth = totalWidth + gap
            local scale = naturalWidth > width and math.max(0.2, (width - gap) / math.max(1, totalWidth)) or 1
            local usedWidth = gap
            for _, entry in ipairs(visible) do
                entry.Width = math.max(1, math.floor(entry.Width * scale))
                usedWidth += entry.Width
            end
            local cursor = x
            if alignment == Enum.TextXAlignment.Center then
                cursor = x + math.max(0, (width - usedWidth) / 2)
            elseif alignment == Enum.TextXAlignment.Right then
                cursor = x + math.max(0, width - usedWidth)
            end
            for _, entry in ipairs(visible) do
                local label = entry.Part.Label
                label.Position = UDim2.fromOffset(cursor, y)
                label.Size = UDim2.fromOffset(entry.Width, height)
                cursor += entry.Width + spacing
            end
        end

        local function trimmedQuery()
            if not content.SearchEnabled then
                return ""
            end
            return string.lower(string.match(content.Query, "^%s*(.-)%s*$") or "")
        end

        local function matches(text, query)
            return query == "" or string.find(plainText(text), query, 1, true) ~= nil
        end

        local function paintRow(record)
            local spec = record.Spec
            local isItem = spec ~= nil and spec.Kind == "item"
            if isItem and spec.Id ~= nil and spec.Id == content.Selected then
                record.Frame.BackgroundColor3 = toColor3(style.SelectedBackgroundColor, SELECTED_COLOR)
                record.Frame.BackgroundTransparency = math.clamp(
                    tonumber(style.SelectedBackgroundTransparency) or 0.86,
                    0,
                    1
                )
            elseif isItem and record.Hovered and onItemClick then
                record.Frame.BackgroundColor3 = toColor3(style.HoverBackgroundColor, HOVER_COLOR)
                record.Frame.BackgroundTransparency = math.clamp(
                    tonumber(style.HoverBackgroundTransparency) or 0.93,
                    0,
                    1
                )
            elseif isItem then
                record.Frame.BackgroundColor3 = toColor3(style.ItemBackgroundColor, HOVER_COLOR)
                record.Frame.BackgroundTransparency = math.clamp(
                    tonumber(style.ItemBackgroundTransparency) or 1,
                    0,
                    1
                )
            else
                record.Frame.BackgroundTransparency = 1
            end
        end

        local function newRow()
            local frame = Instance.new("Frame")
            frame.Name = "Entry"
            frame.Active = false
            frame.BackgroundColor3 = HOVER_COLOR
            frame.BackgroundTransparency = 1
            frame.BorderSizePixel = 0
            frame.ZIndex = 6
            frame.Parent = viewport
            local corner = makeCorner(frame)

            local image = Instance.new("ImageLabel")
            image.Name = "Icon"
            image.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            image.BackgroundTransparency = 0.45
            image.BorderSizePixel = 0
            image.ScaleType = Enum.ScaleType.Fit
            image.Visible = false
            image.ZIndex = 7
            image.Parent = frame
            local imageCorner = makeCorner(image)
            local imageStroke = makeFixedStroke(image, DEFAULT_IMAGE_COLOR)

            local label = Instance.new("TextLabel")
            label.Name = "Text"
            label.Active = false
            label.BackgroundTransparency = 1
            label.BorderSizePixel = 0
            label.RichText = true
            label.Text = ""
            label.TextScaled = false
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.TextWrapped = true
            label.TextYAlignment = Enum.TextYAlignment.Top
            label.ZIndex = 7
            label.Parent = frame

            local titleLabel = Instance.new("TextLabel")
            titleLabel.Name = "Title"
            titleLabel.Active = false
            titleLabel.BackgroundTransparency = 1
            titleLabel.BorderSizePixel = 0
            titleLabel.FontFace = normalTextFont
            titleLabel.Text = ""
            titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            titleLabel.TextScaled = false
            titleLabel.TextStrokeTransparency = 1
            titleLabel.TextWrapped = false
            titleLabel.TextYAlignment = Enum.TextYAlignment.Center
            titleLabel.Visible = false
            titleLabel.ZIndex = 7
            titleLabel.Parent = frame
            local titleStroke = makeTextStroke(titleLabel)

            local topRightLabel = Instance.new("TextLabel")
            topRightLabel.Name = "TopRightText"
            topRightLabel.Active = false
            topRightLabel.BackgroundTransparency = 1
            topRightLabel.BorderSizePixel = 0
            topRightLabel.RichText = true
            topRightLabel.Text = ""
            topRightLabel.TextScaled = false
            topRightLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            topRightLabel.TextWrapped = false
            topRightLabel.TextXAlignment = Enum.TextXAlignment.Right
            topRightLabel.TextYAlignment = Enum.TextYAlignment.Center
            topRightLabel.Visible = false
            topRightLabel.ZIndex = 7
            topRightLabel.Parent = frame

            local button = Instance.new("TextButton")
            button.Name = "Hit"
            button.AutoButtonColor = false
            button.BackgroundTransparency = 1
            button.BorderSizePixel = 0
            button.Size = UDim2.fromScale(1, 1)
            button.Text = ""
            button.Visible = false
            button.ZIndex = 8
            button.Parent = frame

            local record = {
                Frame = frame,
                Corner = corner,
                Image = image,
                ImageCorner = imageCorner,
                ImageStroke = imageStroke,
                Label = label,
                TitleLabel = titleLabel,
                TitleStroke = titleStroke,
                TitleParts = {
                    { Label = titleLabel, Stroke = titleStroke, GradientSource = nil, Spec = nil },
                },
                TopRightLabel = topRightLabel,
                TopRightText = nil,
                TitleText = nil,
                GradientSource = nil,
                Button = button,
                Text = nil,
                ImageId = nil,
                MeasuredWidth = -1,
                MeasuredKey = nil,
                MeasuredHeight = 0,
                Hovered = false,
                Spec = nil,
            }

            button.MouseEnter:Connect(function()
                record.Hovered = true
                paintRow(record)
            end)
            button.MouseLeave:Connect(function()
                record.Hovered = false
                paintRow(record)
            end)
            button.Activated:Connect(function()
                local spec = record.Spec
                if spec and spec.Kind == "item" and spec.Id ~= nil then
                    content.Selected = spec.Id
                    selectionDirty = true
                    if onItemClick then
                        pcall(onItemClick, spec.Id, spec.Source)
                    end
                end
            end)
            return record
        end

        local function composeSpecs()
            local query = trimmedQuery()
            local list = {}
            local shown = 0

            if content.Header ~= "" then
                table.insert(list, { Kind = "header", Text = content.Header })
            end

            local function pushItem(item)
                table.insert(list, {
                    Kind = "item",
                    Text = item.Text,
                    Title = item.Title,
                    Gradient = item.Gradient,
                    TitleParts = item.TitleParts,
                    TopRightText = item.TopRightText,
                    Image = item.Image,
                    ImageColor = item.ImageColor,
                    Id = item.Id,
                    Source = item,
                })
                shown += 1
            end

            local function itemMatches(item)
                if matches(item.Text, query)
                    or (item.Title and matches(item.Title, query))
                    or (item.TopRightText and matches(item.TopRightText, query))
                then
                    return true
                end
                for _, part in ipairs(normalizeTitleParts(item.TitleParts)) do
                    if matches(part.Text, query) then
                        return true
                    end
                end
                return false
            end

            if content.Groups then
                local defaultHex = toHex(style.GroupColor, "#3AFF37")
                for _, group in ipairs(content.Groups) do
                    local titleHit = query ~= "" and matches(group.Title, query)
                    local visible = {}
                    for _, item in ipairs(group.Items) do
                        if titleHit or itemMatches(item) then
                            table.insert(visible, item)
                        end
                    end
                    if #visible > 0 or (query == "" and group.Title ~= "") then
                        if group.Title ~= "" then
                            table.insert(list, {
                                Kind = "group",
                                Gap = style.GroupSpacing and #list > 0,
                                Text = string.format(
                                    '<b><font color="%s">%s</font></b> <font color="#AAAAAA">(%d)</font>',
                                    toHex(group.Color, defaultHex),
                                    group.Title,
                                    #group.Items
                                ),
                            })
                        end
                        for _, item in ipairs(visible) do
                            pushItem(item)
                        end
                    end
                end
            else
                for _, item in ipairs(content.Items) do
                    if itemMatches(item) then
                        pushItem(item)
                    end
                end
            end

            if query ~= "" and shown == 0 then
                table.insert(list, {
                    Kind = "message",
                    Text = string.format('<font color="#888899">No results for "%s"</font>', escapeText(query)),
                })
            end
            return list
        end

        local function applySpecs(list)
            local changed = #list ~= #specs
            specs = list
            for index, spec in ipairs(list) do
                local record = rows[index]
                if not record then
                    record = newRow()
                    rows[index] = record
                    changed = true
                end
                if record.Spec == nil or record.Spec.Kind ~= spec.Kind or (record.Spec.Gap ~= spec.Gap) then
                    changed = true
                end
                record.Spec = spec
                if not record.Frame.Visible then
                    record.Frame.Visible = true
                    changed = true
                end
                if record.Text ~= spec.Text then
                    record.Text = spec.Text
                    record.Label.Text = spec.Text
                    record.MeasuredWidth = -1
                    changed = true
                end
                local topRightText = spec.Kind == "item" and spec.TopRightText or nil
                if record.TopRightText ~= topRightText then
                    record.TopRightText = topRightText
                    record.TopRightLabel.Text = topRightText or ""
                    record.TopRightLabel.Visible = topRightText ~= nil and topRightText ~= ""
                    record.MeasuredWidth = -1
                    changed = true
                end
                local imageId = spec.Kind == "item" and spec.Image or nil
                if record.ImageId ~= imageId then
                    record.ImageId = imageId
                    record.Image.Image = imageId or ""
                    record.Image.Visible = imageId ~= nil
                    record.MeasuredWidth = -1
                    changed = true
                end
                if imageId then
                    local color = toColor3(spec.ImageColor, DEFAULT_IMAGE_COLOR)
                    if record.ImageStroke.Color ~= color then
                        record.ImageStroke.Color = color
                    end
                end
                local hasTitleParts, titleChanged = syncTitleParts(
                    record.TitleParts,
                    record.Frame,
                    spec.Kind == "item" and spec.TitleParts or nil,
                    spec.Kind == "item" and spec.Title or nil,
                    spec.Kind == "item" and spec.Gradient or nil,
                    7
                )
                record.TitleText = hasTitleParts and true or nil
                if titleChanged then
                    record.MeasuredWidth = -1
                    changed = true
                end
                record.Button.Visible = spec.Kind == "item" and spec.Id ~= nil
                paintRow(record)
            end
            for index = #list + 1, #rows do
                local record = rows[index]
                if record.Frame.Visible then
                    record.Frame.Visible = false
                    changed = true
                end
                record.Spec = nil
            end
            return changed
        end

        local spotTemplate = nil
        local spotGradientSource = nil
        local spotModel = nil
        local spotCenter = Vector3.zero
        local spotDistance = 10
        local spinAngle = 0

        local function updateCamera()
            if not spotModel then
                return
            end
            local direction = Vector3.new(math.sin(spinAngle), 0.35, math.cos(spinAngle)).Unit
            spotCamera.CFrame = CFrame.lookAt(spotCenter + direction * spotDistance, spotCenter)
        end

        local function applySpotlight()
            local spot = content.Spotlight
            local hadModel = spotModel ~= nil
            local hadTitle = spotTitle.Visible
            local wasShown = spotFrame.Visible
            if not spot then
                if spotModel then
                    spotModel:Destroy()
                    spotModel = nil
                end
                spotTemplate = nil
                spotGradientSource = nil
                spotFrame.Visible = false
                spotDivider.Visible = false
                return wasShown
            end

            spotFrame.Visible = true
            local text = tostring(spot.Text or "")
            if spotText.Text ~= text then
                spotText.Text = text
            end
            local hasTitleParts = syncTitleParts(
                spotTitleParts,
                spotFrame,
                spot.TitleParts,
                spot.Title ~= nil and tostring(spot.Title) or nil,
                spot.Gradient,
                6
            )
            spotTitle.Visible = hasTitleParts
            spotDivider.BackgroundColor3 = typeof(style.SpotlightDividerColor) == "Color3"
                and style.SpotlightDividerColor
                or toColor3(spot.Color, Color3.fromRGB(255, 255, 255))

            if spot.Model ~= spotTemplate then
                spotTemplate = spot.Model
                if spotModel then
                    spotModel:Destroy()
                    spotModel = nil
                end
                local copy = cloneForViewport(spot.Model)
                if copy then
                    local boxCFrame, boxSize
                    if copy:IsA("Model") then
                        boxCFrame, boxSize = copy:GetBoundingBox()
                    elseif copy:IsA("BasePart") then
                        boxCFrame, boxSize = copy.CFrame, copy.Size
                    end
                    if boxCFrame then
                        spotCenter = boxCFrame.Position
                        local modelScale = math.max(0.25, tonumber(style.SpotlightModelScale) or 1)
                        spotDistance = (boxSize.Magnitude * 0.5)
                            / math.tan(math.rad(spotCamera.FieldOfView / 2))
                            * 1.05
                            / modelScale
                        copy.Parent = spotView
                        spotModel = copy
                        updateCamera()
                    else
                        copy:Destroy()
                    end
                end
            end
            spotView.Visible = spotModel ~= nil
            return (not wasShown) or hadModel ~= (spotModel ~= nil) or hadTitle ~= hasTitleParts
        end

        local function layout()
            local host = row.Parent
            local rowWidth = row.AbsoluteSize.X
            if not host or rowWidth <= 0 then
                return
            end
            lastWidth = rowWidth

            local referenceWidth = host.AbsoluteSize.X * ROW_WIDTH_SCALE / math.max(ContentScale.X, 0.001)
            if referenceWidth <= 0 then
                referenceWidth = rowWidth
            end

            local bandHeight = referenceWidth / ROW_ASPECT * 0.85
            local sideInset = rowWidth * 0.025
            local padY = bandHeight * 0.2 * math.max(0, tonumber(style.Padding) or 1)
            local showTitle = content.ShowTitle and content.Title ~= ""
            local showSearch = content.SearchEnabled
            local headerHeight = (showTitle or showSearch) and bandHeight or 0
            local alignment = ALIGNMENTS[string.lower(tostring(style.Alignment))] or Enum.TextXAlignment.Left
            local textSize = math.max(
                8,
                math.floor(referenceWidth * BODY_RATIO * math.max(0.3, tonumber(style.TextScale) or 1) + 0.5)
            )
            local lineHeight = math.max(0.8, tonumber(style.LineHeight) or 1.16)
            local lineUnit = textSize * lineHeight
            local barWidth = math.max(2, math.floor(referenceWidth * 0.006 + 0.5))
            local font = resolveFont(style.Font)
            local textColor = typeof(style.TextColor) == "Color3" and style.TextColor or DEFAULT_STYLE.TextColor
            local strokeTransparency = math.clamp(tonumber(style.TextStrokeTransparency) or 0.7, 0, 1)
            local imageSize = math.floor(lineUnit * math.max(1, tonumber(style.ImageLines) or 2.3) + 0.5)
            local itemGap = math.floor(lineUnit * math.max(0, tonumber(style.ItemSpacing) or 0.35) + 0.5)
            local cornerRadius = UDim.new(0, math.max(2, math.floor(lineUnit * 0.35)))
            local fineStroke = math.max(1, math.floor(textSize * 0.1 + 0.5))
            local titleSize = math.max(textSize, math.floor(textSize * 1.2 + 0.5))
            local titleLineHeight = math.ceil(titleSize * lineHeight)
            local titleStrokeThickness = math.max(1, math.floor(titleSize * 0.14 + 0.5))
            local titlePartSpacing = math.floor(lineUnit * math.max(0, tonumber(style.TitlePartSpacing) or 0.34) + 0.5)

            if plateStroke then
                pcall(function()
                    plateStroke.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
                end)
                plateStroke.Thickness = math.max(1, bandHeight * 0.05)
            end
            main.BackgroundTransparency = math.clamp(tonumber(style.BackgroundTransparency) or 0.5, 0, 1)
            spotView.BackgroundColor3 = toColor3(style.SpotlightBackgroundColor, Color3.fromRGB(0, 0, 0))
            spotView.BackgroundTransparency = math.clamp(
                tonumber(style.SpotlightBackgroundTransparency) or 1,
                0,
                1
            )
            viewport.ScrollBarImageColor3 = toColor3(style.ScrollBarColor, Color3.fromRGB(255, 255, 255))

            local fieldWidth = rowWidth * CONTROL_LAYOUT.WideWidth
            local fieldCenterX = rowWidth * CONTROL_LAYOUT.WideCenterX
            searchField.Visible = showSearch
            if showSearch then
                searchField.Size = UDim2.fromOffset(fieldWidth, bandHeight * 0.62)
                searchField.Position = UDim2.fromOffset(fieldCenterX, bandHeight / 2)
            end

            local titleHeight = bandHeight * 0.64 * math.max(0.3, tonumber(style.TitleScale) or 1)
            local titleRight = showSearch and (fieldCenterX - fieldWidth / 2 - sideInset) or (rowWidth - sideInset)
            title.Visible = showTitle
            title.Position = UDim2.fromOffset(sideInset, (bandHeight - titleHeight) / 2)
            title.Size = UDim2.fromOffset(math.max(1, titleRight - sideInset), titleHeight)
            title.TextXAlignment = showSearch and Enum.TextXAlignment.Left or alignment

            local viewWidth = math.max(1, rowWidth - sideInset * 2)
            local y = headerHeight > 0 and headerHeight or padY

            if spotFrame.Visible then
                local spotHeight = math.floor(lineUnit * math.max(3, tonumber(style.SpotlightLines) or 5) + 0.5)
                local hasModel = spotModel ~= nil
                local textLeft = hasModel and (spotHeight + math.floor(lineUnit * 0.8)) or 0
                local infoWidth = math.max(1, viewWidth - textLeft)
                local spotTitleHeight = spotTitle.Visible and titleLineHeight or 0
                spotFrame.Position = UDim2.fromOffset(sideInset, y)
                spotFrame.Size = UDim2.fromOffset(viewWidth, spotHeight)
                spotView.Size = UDim2.fromOffset(spotHeight, spotHeight)
                spotViewCorner.CornerRadius = cornerRadius
                spotTitle.Position = UDim2.fromOffset(textLeft, 0)
                spotTitle.Size = UDim2.fromOffset(infoWidth, spotTitleHeight)
                layoutTitleParts(
                    spotTitleParts,
                    textLeft,
                    0,
                    infoWidth,
                    spotTitleHeight,
                    titleSize,
                    font,
                    alignment,
                    titlePartSpacing
                )
                spotText.Position = UDim2.fromOffset(textLeft, spotTitleHeight)
                spotText.Size = UDim2.fromOffset(infoWidth, math.max(1, spotHeight - spotTitleHeight))
                spotText.FontFace = font
                spotText.TextSize = textSize
                spotText.LineHeight = lineHeight
                spotText.TextColor3 = textColor
                spotText.TextStrokeTransparency = strokeTransparency
                spotText.TextYAlignment = spotTitleHeight > 0 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
                y += spotHeight + itemGap
                local dividerHeight = math.max(1, math.floor(textSize * 0.12 + 0.5))
                spotDivider.Visible = true
                spotDivider.Position = UDim2.fromOffset(sideInset, y)
                spotDivider.Size = UDim2.fromOffset(viewWidth, dividerHeight)
                y += dividerHeight + itemGap
            else
                spotDivider.Visible = false
            end

            local styleKey = table.concat({
                tostring(style.Font),
                textSize,
                lineHeight,
                strokeTransparency,
                tostring(alignment),
                tostring(textColor),
                imageSize,
            }, "|")

            local function placeRows(availableWidth)
                local offset = 0
                for index, spec in ipairs(specs) do
                    local record = rows[index]
                    local isItem = spec.Kind == "item"
                    local hasImage = record.ImageId ~= nil
                    local innerPad = isItem and math.floor(lineUnit * 0.25) or 0
                    local vPad = isItem and math.floor(lineUnit * 0.18) or 0
                    local textX = hasImage and (imageSize + math.floor(lineUnit * 0.6)) or 0
                    local labelWidth = math.max(1, availableWidth - textX - innerPad * 2)

                    if record.MeasuredWidth ~= labelWidth or record.MeasuredKey ~= styleKey then
                        local label = record.Label
                        label.FontFace = font
                        label.TextSize = textSize
                        label.LineHeight = lineHeight
                        label.TextColor3 = textColor
                        label.TextStrokeTransparency = strokeTransparency
                        label.TextXAlignment = alignment
                        label.Size = UDim2.fromOffset(labelWidth, 100000)
                        record.MeasuredHeight = math.max(textSize, math.ceil(label.TextBounds.Y))
                        record.MeasuredWidth = labelWidth
                        record.MeasuredKey = styleKey
                    end

                    local rowTitleHeight = 0
                    if record.TitleText or record.TopRightText then
                        rowTitleHeight = titleLineHeight
                    end

                    if spec.Kind == "group" and spec.Gap then
                        offset += math.floor(lineUnit * 0.5)
                    end
                    local textHeight = record.MeasuredHeight
                    local rowHeight = math.max(textHeight + rowTitleHeight, hasImage and imageSize or 0) + vPad * 2

                    record.Frame.Position = UDim2.fromOffset(0, offset)
                    record.Frame.Size = UDim2.fromOffset(availableWidth, rowHeight)
                    record.Corner.CornerRadius = cornerRadius
                    if hasImage then
                        record.Image.Position = UDim2.fromOffset(innerPad, math.floor((rowHeight - imageSize) / 2))
                        record.Image.Size = UDim2.fromOffset(imageSize, imageSize)
                        record.ImageCorner.CornerRadius = cornerRadius
                        record.ImageStroke.Thickness = fineStroke
                    end
                    local textTop = math.floor((rowHeight - textHeight - rowTitleHeight) / 2)
                    local topRightWidth = 0
                    if record.TopRightText then
                        local topRightLabel = record.TopRightLabel
                        topRightLabel.FontFace = font
                        topRightLabel.TextSize = textSize
                        topRightLabel.TextColor3 = textColor
                        topRightLabel.TextStrokeTransparency = strokeTransparency
                        topRightLabel.Size = UDim2.fromOffset(labelWidth, rowTitleHeight)
                        local measuredWidth = topRightLabel.TextBounds.X
                        if measuredWidth <= 0 then
                            local plain = plainText(record.TopRightText)
                            measuredWidth = (utf8.len(plain) or #plain) * textSize * 0.55
                            layoutDirty = true
                        end
                        topRightWidth = math.min(
                            labelWidth * 0.42,
                            math.max(textSize * 3, math.ceil(measuredWidth + textSize * 0.25))
                        )
                        topRightLabel.Position = UDim2.fromOffset(
                            innerPad + textX + labelWidth - topRightWidth,
                            textTop
                        )
                        topRightLabel.Size = UDim2.fromOffset(topRightWidth, rowTitleHeight)
                    end
                    if record.TitleText then
                        local titleWidth = math.max(
                            1,
                            labelWidth - topRightWidth - (topRightWidth > 0 and titlePartSpacing or 0)
                        )
                        layoutTitleParts(
                            record.TitleParts,
                            innerPad + textX,
                            textTop,
                            titleWidth,
                            rowTitleHeight,
                            titleSize,
                            font,
                            alignment,
                            titlePartSpacing
                        )
                    end
                    record.Label.Position = UDim2.fromOffset(innerPad + textX, textTop + rowTitleHeight)
                    record.Label.Size = UDim2.fromOffset(labelWidth, textHeight)

                    offset += rowHeight + (isItem and itemGap or math.floor(itemGap * 0.5))
                end
                return math.max(textSize, offset)
            end

            local maxLines = math.max(0, math.floor(tonumber(style.MaxLines) or 0))
            local limit = maxLines > 0 and math.ceil(lineUnit * maxLines) or math.huge
            local contentHeight = placeRows(viewWidth)
            local scrolls = contentHeight > limit
            if scrolls then
                contentHeight = placeRows(math.max(1, viewWidth - barWidth * 3))
            end
            local viewHeight = math.min(contentHeight, limit)

            viewport.Position = UDim2.fromOffset(sideInset, y)
            viewport.Size = UDim2.fromOffset(viewWidth, viewHeight)
            viewport.CanvasSize = UDim2.fromOffset(0, contentHeight)
            viewport.ScrollBarThickness = scrolls and barWidth or 0
            viewport.ScrollingEnabled = scrolls

            local plateHeight = y + viewHeight + padY
            row.Size = UDim2.new(hostWidthScale(), 0, 0, math.max(1, math.ceil(plateHeight / 0.85)))
        end

        searchBox.Focused:Connect(function()
            tweenSearchFocus(true)
        end)
        searchBox.FocusLost:Connect(function()
            tweenSearchFocus(false)
        end)
        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            if content.Query ~= searchBox.Text then
                content.Query = searchBox.Text
                contentDirty = true
            end
        end)

        row:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if math.abs(row.AbsoluteSize.X - lastWidth) >= 0.5 then
                layoutDirty = true
            end
        end)

        ContentScale.OnChanged(function()
            if destroyed then
                return false
            end
            layoutDirty = true
        end)

        local onScreen = true
        local visibilityClock = VISIBILITY_CHECK
        local spinClock = 0

        local heartbeat = RunService.Heartbeat:Connect(function(deltaTime)
            if destroyed or not row.Parent then
                return
            end
            visibilityClock += deltaTime
            if visibilityClock >= VISIBILITY_CHECK then
                visibilityClock = 0
                onScreen = isShown(row)
            end

            if titleDirty then
                titleDirty = false
                title.Text = content.Title
                layoutDirty = true
            end
            if searchDirty then
                searchDirty = false
                searchBox.PlaceholderText = content.SearchPlaceholder
                if searchBox.Text ~= content.Query then
                    searchBox.Text = content.Query
                end
                contentDirty = true
                layoutDirty = true
            end
            if contentDirty then
                contentDirty = false
                if applySpecs(composeSpecs()) then
                    layoutDirty = true
                end
            end
            if selectionDirty then
                selectionDirty = false
                for _, record in ipairs(rows) do
                    if record.Spec then
                        paintRow(record)
                    end
                end
            end
            if spotlightDirty then
                spotlightDirty = false
                if applySpotlight() then
                    layoutDirty = true
                end
            end
            if layoutDirty then
                layoutDirty = false
                if not pcall(layout) then
                    layoutDirty = true
                end
            end

            local spot = content.Spotlight
            if spotModel and onScreen and spot and spot.Spin ~= false then
                spinClock += deltaTime
                if spinClock >= 1 / SPIN_RATE then
                    spinAngle = (spinAngle + SPIN_SPEED * spinClock) % (math.pi * 2)
                    spinClock = 0
                    updateCamera()
                end
            end
        end)

        local controller = {}

        function controller.GetValue()
            return content.Text
        end

        function controller.SetValue(value)
            content.Text = tostring(value or "")
            content.Items = splitLines(content.Text)
            content.Groups = nil
            contentDirty = true
        end

        function controller.GetTitle()
            return content.Title
        end

        function controller.SetTitle(value)
            content.Title = tostring(value or "")
            titleDirty = true
        end

        function controller.GetStyle()
            local copy = {}
            for key, value in pairs(style) do
                copy[key] = value
            end
            return copy
        end

        function controller.SetStyle(patch)
            mergeStyle(style, patch)
            contentDirty = true
            layoutDirty = true
        end

        function controller.SetHeader(value)
            content.Header = tostring(value or "")
            contentDirty = true
        end

        function controller.SetItems(items)
            content.Items = normalizeItems(items)
            content.Groups = nil
            contentDirty = true
        end

        function controller.SetGroups(groups)
            content.Groups = normalizeGroups(groups)
            contentDirty = true
        end

        function controller.AppendItem(item, groupTitle)
            local entry = normalizeItem(item)
            if groupTitle ~= nil then
                content.Groups = content.Groups or {}
                local target = nil
                for _, group in ipairs(content.Groups) do
                    if group.Title == tostring(groupTitle) then
                        target = group
                        break
                    end
                end
                if not target then
                    target = { Title = tostring(groupTitle), Items = {} }
                    table.insert(content.Groups, target)
                end
                table.insert(target.Items, entry)
            else
                table.insert(content.Items, entry)
            end
            contentDirty = true
        end

        function controller.SetSearchEnabled(enabled)
            content.SearchEnabled = enabled == true
            contentDirty = true
            layoutDirty = true
        end

        function controller.SetSearchQuery(query)
            content.Query = tostring(query or "")
            searchDirty = true
        end

        function controller.GetSearchQuery()
            return content.Query
        end

        function controller.SetSpotlight(spot)
            if type(spot) == "table" then
                content.Spotlight = {
                    Model = spot.Model,
                    Title = spot.Title,
                    Gradient = spot.Gradient,
                    TitleParts = spot.TitleParts,
                    Text = spot.Text,
                    Color = spot.Color,
                    Spin = spot.Spin,
                }
            else
                content.Spotlight = nil
            end
            spotlightDirty = true
        end

        function controller.SetSelected(id)
            content.Selected = id
            selectionDirty = true
        end

        function controller.GetSelected()
            return content.Selected
        end

        function controller.Destroy()
            destroyed = true
            heartbeat:Disconnect()
            if spotModel then
                spotModel:Destroy()
                spotModel = nil
            end
        end

        return row, controller
    end

    return createLibraryParagraphRow
end)()

optionFactories[11] = (function()
    local CANVAS_STYLE = {
        TextScale = 1,
        TitleScale = 1,
        Font = "Gotham",
        LineHeight = 1.16,
        Padding = 1,
        Alignment = "Left",
        BackgroundColor = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        StrokeColor = Color3.fromRGB(0, 0, 0),
        StrokeTransparency = 0,
        StrokeScale = 0.05,
        CornerScale = 0.35,
        ScrollBarColor = Color3.fromRGB(255, 255, 255),
        ScrollBarTransparency = 0,
        TextColor = Color3.fromRGB(235, 235, 235),
        TextStrokeTransparency = 0.7,
        MinLines = 4,
        MaxLines = 0,
        AutoHeight = true,
        ClipContent = true,
    }

    local CANVAS_BODY_RATIO = 0.026
    local CANVAS_VISIBILITY_CHECK = 0.5
    local CANVAS_SPIN_RATE = 20
    local CANVAS_SPIN_SPEED = math.rad(28)

    local CANVAS_FONTS = {
        ["gotham"] = normalTextFont,
        ["gotham medium"] = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        ["fredoka"] = Font.new(
            "rbxasset://fonts/families/FredokaOne.json",
            Enum.FontWeight.Regular,
            Enum.FontStyle.Normal
        ),
        ["code"] = Font.new(
            "rbxasset://fonts/families/RobotoMono.json",
            Enum.FontWeight.Bold,
            Enum.FontStyle.Normal
        ),
    }

    local CANVAS_ALIGN = {
        left = Enum.TextXAlignment.Left,
        center = Enum.TextXAlignment.Center,
        right = Enum.TextXAlignment.Right,
    }

    local function canvasFont(value)
        if typeof(value) == "Font" then
            return value
        end
        if typeof(value) == "EnumItem" then
            local ok, font = pcall(Font.fromEnum, value)
            if ok then
                return font
            end
        end
        if type(value) == "string" then
            return CANVAS_FONTS[string.lower(value)] or normalTextFont
        end
        return nil
    end

    local function canvasColor(value, fallback)
        if typeof(value) == "Color3" then
            return value
        end
        if type(value) == "string" then
            local ok, color = pcall(Color3.fromHex, value)
            if ok then
                return color
            end
        end
        return fallback
    end

    local function canvasNumber(value, fallback)
        local number = tonumber(value)
        if number == nil then
            return fallback
        end
        return number
    end

    local function canvasMerge(style, patch)
        if type(patch) ~= "table" then
            return false
        end
        local changed = false
        for key, value in pairs(patch) do
            if CANVAS_STYLE[key] ~= nil and style[key] ~= value then
                style[key] = value
                changed = true
            end
        end
        return changed
    end

    local function canvasGradient(target, source, rotation)
        local existing = target:FindFirstChild("ChilliCanvasGradient")
        if source == nil then
            if existing then
                existing:Destroy()
            end
            return
        end
        if typeof(source) == "Instance" and source:IsA("UIGradient") then
            if existing then
                existing:Destroy()
            end
            local ok, copy = pcall(function()
                return source:Clone()
            end)
            if ok and copy then
                copy.Name = "ChilliCanvasGradient"
                if rotation ~= nil then
                    copy.Rotation = rotation
                end
                copy.Parent = target
            end
            return
        end
        if typeof(source) == "ColorSequence" then
            local gradient = existing
            if not gradient then
                gradient = Instance.new("UIGradient")
                gradient.Name = "ChilliCanvasGradient"
                gradient.Parent = target
            end
            gradient.Color = source
            if rotation ~= nil then
                gradient.Rotation = rotation
            end
        end
    end

    local function canvasCorner(target, radius)
        local corner = target:FindFirstChildOfClass("UICorner")
        if radius == nil or radius <= 0 then
            if corner then
                corner:Destroy()
            end
            return nil
        end
        if not corner then
            corner = Instance.new("UICorner")
            corner.Parent = target
        end
        corner.CornerRadius = UDim.new(0, math.floor(radius + 0.5))
        return corner
    end

    local function canvasStroke(target, color, thickness, transparency, mode)
        local stroke = target:FindFirstChildOfClass("UIStroke")
        if thickness == nil or thickness <= 0 then
            if stroke then
                stroke:Destroy()
            end
            return nil
        end
        if not stroke then
            stroke = Instance.new("UIStroke")
            stroke.LineJoinMode = Enum.LineJoinMode.Round
            stroke.Parent = target
        end
        stroke.ApplyStrokeMode = mode or Enum.ApplyStrokeMode.Contextual
        stroke.Color = color or Color3.fromRGB(0, 0, 0)
        stroke.Thickness = math.max(0.01, thickness)
        stroke.Transparency = math.clamp(canvasNumber(transparency, 0), 0, 1)
        return stroke
    end

    local function canvasClone(template)
        if typeof(template) ~= "Instance" then
            return nil
        end
        local ok, copy = pcall(function()
            return template:Clone()
        end)
        if not ok or not copy then
            return nil
        end
        for _, descendant in ipairs(copy:GetDescendants()) do
            if descendant:IsA("LuaSourceContainer")
                or descendant:IsA("ParticleEmitter")
                or descendant:IsA("Trail")
                or descendant:IsA("Beam")
                or descendant:IsA("Light")
                or descendant:IsA("Sound")
                or descendant:IsA("Fire")
                or descendant:IsA("Smoke")
                or descendant:IsA("Sparkles")
            then
                descendant:Destroy()
            elseif descendant:IsA("BasePart") then
                descendant.Anchored = true
                descendant.CanCollide = false
                descendant.CastShadow = false
            end
        end
        if copy:IsA("BasePart") then
            copy.Anchored = true
        end
        return copy
    end

    local function canvasShown(gui)
        if typeof(gui) ~= "Instance" or not gui:IsDescendantOf(game) then
            return false
        end
        local node = gui
        while node do
            if node:IsA("GuiObject") and not node.Visible then
                return false
            end
            if node:IsA("LayerCollector") then
                return node.Enabled
            end
            node = node.Parent
        end
        return false
    end

    local function canvasSizeOf(spec, metrics)
        if typeof(spec.Size) == "UDim2" then
            return spec.Size
        end
        local widthScale = tonumber(spec.WidthScale)
        local width = tonumber(spec.Width)
        local heightScale = tonumber(spec.HeightScale)
        local height = tonumber(spec.Height)
        local x
        if widthScale then
            x = UDim.new(widthScale, 0)
        elseif width then
            x = UDim.new(0, math.floor(width * metrics.Unit + 0.5))
        else
            x = UDim.new(1, 0)
        end
        local y
        if heightScale then
            y = UDim.new(heightScale, 0)
        else
            y = UDim.new(0, math.floor((height or 1) * metrics.Unit + 0.5))
        end
        return UDim2.new(x.Scale, x.Offset, y.Scale, y.Offset)
    end

    local function canvasPositionOf(spec, metrics)
        if typeof(spec.Position) == "UDim2" then
            return spec.Position
        end
        return UDim2.fromOffset(
            math.floor(tonumber(spec.X or 0) * metrics.Unit + 0.5),
            math.floor(tonumber(spec.Y or 0) * metrics.Unit + 0.5)
        )
    end

    local function canvasParentOf(surface, value)
        if type(value) == "table" and type(value.Get) == "function" then
            value = value.Get()
        end
        if typeof(value) == "Instance" then
            return value
        end
        return surface._root
    end

    local function canvasQueueParent(surface, instance, parent)
        table.insert(surface._pendingParents, { instance, parent })
        surface._dirty = true
    end

    local function canvasBaseApply(surface, instance, spec)
        local metrics = surface._metrics
        instance.Size = canvasSizeOf(spec, metrics)
        instance.Position = canvasPositionOf(spec, metrics)
        if typeof(spec.AnchorPoint) == "Vector2" then
            instance.AnchorPoint = spec.AnchorPoint
        end
        if spec.LayoutOrder ~= nil then
            instance.LayoutOrder = tonumber(spec.LayoutOrder) or 0
        end
        if spec.ZIndex ~= nil then
            instance.ZIndex = tonumber(spec.ZIndex) or instance.ZIndex
        end
        if spec.Visible ~= nil then
            instance.Visible = spec.Visible ~= false
        end
        local background = canvasColor(spec.Background, nil)
        if background then
            instance.BackgroundColor3 = background
            instance.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 0), 0, 1)
        elseif spec.BackgroundTransparency ~= nil then
            instance.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 1), 0, 1)
        end
        if spec.Corner ~= nil then
            canvasCorner(instance, canvasNumber(spec.Corner, 0) * metrics.Unit)
        end
        if spec.Clip ~= nil then
            instance.ClipsDescendants = spec.Clip == true
        end
    end

    local function canvasMakeHandle(surface, instance, kind, spec, apply)
        local handle = { Kind = kind, Spec = spec }

        function handle.Get()
            return instance
        end

        function handle.Apply()
            apply()
            return handle
        end

        function handle.Set(patch)
            if type(patch) == "table" then
                for key, value in pairs(patch) do
                    spec[key] = value
                end
            end
            surface._queue(handle)
            return handle
        end

        function handle.SetVisible(visible)
            spec.Visible = visible ~= false
            instance.Visible = visible ~= false
            return handle
        end

        function handle.Destroy()
            for index = #surface._elements, 1, -1 do
                if surface._elements[index] == handle then
                    table.remove(surface._elements, index)
                end
            end
            instance:Destroy()
            surface._dirty = true
        end

        table.insert(surface._elements, handle)
        surface._queue(handle)
        return handle
    end

    local function canvasCreateFrame(surface, spec)
        local frame = Instance.new(spec.Scrolling == true and "ScrollingFrame" or "Frame")
        frame.Name = tostring(spec.Name or "Panel")
        frame.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(0, 0, 0))
        frame.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 1), 0, 1)
        frame.BorderSizePixel = 0
        frame.ZIndex = tonumber(spec.ZIndex) or 6
        if frame:IsA("ScrollingFrame") then
            frame.Active = true
            frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            frame.CanvasSize = UDim2.new()
            frame.ElasticBehavior = Enum.ElasticBehavior.Never
            frame.ScrollBarImageColor3 = canvasColor(spec.ScrollBarColor, surface._style.ScrollBarColor)
            frame.ScrollingDirection = Enum.ScrollingDirection.Y
        end
        if spec.Layout ~= nil then
            local layout = Instance.new("UIListLayout")
            layout.FillDirection = string.lower(tostring(spec.Layout)) == "row"
                    and Enum.FillDirection.Horizontal
                or Enum.FillDirection.Vertical
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.VerticalAlignment = Enum.VerticalAlignment.Top
            layout.Parent = frame
        end
        canvasQueueParent(surface, frame, canvasParentOf(surface, spec.Parent))

        local handle = canvasMakeHandle(surface, frame, "Frame", spec, function()
            canvasBaseApply(surface, frame, spec)
            if spec.StrokeColor ~= nil or spec.StrokeThickness ~= nil then
                canvasStroke(
                    frame,
                    canvasColor(spec.StrokeColor, Color3.fromRGB(0, 0, 0)),
                    canvasNumber(spec.StrokeThickness, 0.06) * surface._metrics.Unit,
                    spec.StrokeTransparency,
                    Enum.ApplyStrokeMode.Border
                )
            end
            if spec.Gradient ~= nil then
                canvasGradient(frame, spec.Gradient, spec.GradientRotation)
            end
            local layout = frame:FindFirstChildOfClass("UIListLayout")
            if layout then
                layout.Padding = UDim.new(0, math.floor(canvasNumber(spec.Spacing, 0.2) * surface._metrics.Unit + 0.5))
            end
            if frame:IsA("ScrollingFrame") then
                frame.ScrollBarThickness = math.max(2, math.floor(surface._metrics.TextSize * 0.5))
            end
            if spec.AutoHeight == true then
                frame.AutomaticSize = Enum.AutomaticSize.Y
            end
        end)
        return handle
    end

    local function canvasCreateText(surface, spec)
        local label = Instance.new("TextLabel")
        label.Name = tostring(spec.Name or "Text")
        label.Active = false
        label.BackgroundTransparency = 1
        label.BorderSizePixel = 0
        label.RichText = spec.Rich ~= false
        label.Text = ""
        label.TextScaled = false
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.TextStrokeTransparency = 1
        label.TextWrapped = spec.Wrap ~= false
        label.TextYAlignment = Enum.TextYAlignment.Top
        label.ZIndex = tonumber(spec.ZIndex) or 7
        canvasQueueParent(surface, label, canvasParentOf(surface, spec.Parent))

        return canvasMakeHandle(surface, label, "Text", spec, function()
            local metrics = surface._metrics
            local style = surface._style
            label.Text = tostring(spec.Text or "")
            label.RichText = spec.Rich ~= false
            label.TextWrapped = spec.Wrap ~= false
            label.FontFace = canvasFont(spec.Font) or metrics.Font
            label.TextSize = math.max(6, math.floor(metrics.TextSize * canvasNumber(spec.Scale, 1) + 0.5))
            label.LineHeight = canvasNumber(spec.LineHeight, metrics.LineHeight)
            label.TextColor3 = canvasColor(spec.Color, style.TextColor)
            label.TextTransparency = math.clamp(canvasNumber(spec.Transparency, 0), 0, 1)
            label.TextStrokeColor3 = canvasColor(spec.TextStrokeColor, Color3.fromRGB(0, 0, 0))
            label.TextStrokeTransparency = math.clamp(
                canvasNumber(spec.TextStrokeTransparency, style.TextStrokeTransparency),
                0,
                1
            )
            label.TextXAlignment = CANVAS_ALIGN[string.lower(tostring(spec.Align or ""))] or metrics.Align
            local vAlign = string.lower(tostring(spec.VAlign or "top"))
            label.TextYAlignment = vAlign == "center" and Enum.TextYAlignment.Center
                or (vAlign == "bottom" and Enum.TextYAlignment.Bottom or Enum.TextYAlignment.Top)
            canvasGradient(label, spec.Gradient, spec.GradientRotation)
            if spec.StrokeThickness ~= nil or spec.StrokeColor ~= nil then
                canvasStroke(
                    label,
                    canvasColor(spec.StrokeColor, Color3.fromRGB(0, 0, 0)),
                    canvasNumber(spec.StrokeThickness, 0.1) * label.TextSize,
                    spec.StrokeTransparency,
                    Enum.ApplyStrokeMode.Contextual
                )
            end
            canvasBaseApply(surface, label, spec)
            if typeof(spec.Size) ~= "UDim2" and spec.Height == nil and spec.HeightScale == nil then
                local width = label.Size.X
                label.Size = UDim2.new(width.Scale, width.Offset, 0, 100000)
                local measured = math.max(label.TextSize, math.ceil(label.TextBounds.Y))
                label.Size = UDim2.new(width.Scale, width.Offset, 0, measured)
            end
        end)
    end

    local function canvasCreateButton(surface, spec)
        local button = Instance.new("TextButton")
        button.Name = tostring(spec.Name or "Button")
        button.AutoButtonColor = false
        button.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(0, 0, 0))
        button.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 0.35), 0, 1)
        button.BorderSizePixel = 0
        button.RichText = spec.Rich ~= false
        button.Text = ""
        button.TextScaled = false
        button.TextStrokeTransparency = 1
        button.ZIndex = tonumber(spec.ZIndex) or 8
        canvasQueueParent(surface, button, canvasParentOf(surface, spec.Parent))

        local hovered, pressed, enabled = false, false, true

        local function paint()
            local base = math.clamp(canvasNumber(spec.BackgroundTransparency, 0.35), 0, 1)
            local target = base
            if not enabled then
                target = math.clamp(base + 0.25, 0, 1)
            elseif pressed then
                target = math.clamp(canvasNumber(spec.PressTransparency, base - 0.18), 0, 1)
            elseif hovered then
                target = math.clamp(canvasNumber(spec.HoverTransparency, base - 0.12), 0, 1)
            end
            button.BackgroundTransparency = target
            button.TextTransparency = enabled and math.clamp(canvasNumber(spec.Transparency, 0), 0, 1) or 0.4
        end

        local handle = canvasMakeHandle(surface, button, "Button", spec, function()
            local metrics = surface._metrics
            button.Text = tostring(spec.Text or "")
            button.RichText = spec.Rich ~= false
            button.FontFace = canvasFont(spec.Font) or metrics.Font
            button.TextSize = math.max(6, math.floor(metrics.TextSize * canvasNumber(spec.Scale, 1) + 0.5))
            button.TextColor3 = canvasColor(spec.Color, Color3.fromRGB(255, 255, 255))
            button.TextXAlignment = CANVAS_ALIGN[string.lower(tostring(spec.Align or "center"))]
                or Enum.TextXAlignment.Center
            canvasGradient(button, spec.Gradient, spec.GradientRotation)
            canvasStroke(
                button,
                canvasColor(spec.StrokeColor, Color3.fromRGB(0, 0, 0)),
                canvasNumber(spec.StrokeThickness, 0.05) * metrics.Unit,
                spec.StrokeTransparency,
                Enum.ApplyStrokeMode.Border
            )
            canvasCorner(button, canvasNumber(spec.Corner, 0.3) * metrics.Unit)
            local size = canvasSizeOf(spec, metrics)
            if typeof(spec.Size) ~= "UDim2" and spec.Width == nil and spec.WidthScale == nil then
                size = UDim2.new(0, math.floor(button.TextBounds.X + metrics.Unit), size.Y.Scale, size.Y.Offset)
            end
            button.Size = size
            button.Position = canvasPositionOf(spec, metrics)
            if spec.LayoutOrder ~= nil then
                button.LayoutOrder = tonumber(spec.LayoutOrder) or 0
            end
            paint()
        end)

        button.MouseEnter:Connect(function()
            hovered = true
            paint()
        end)
        button.MouseLeave:Connect(function()
            hovered, pressed = false, false
            paint()
        end)
        button.MouseButton1Down:Connect(function()
            pressed = true
            paint()
        end)
        button.MouseButton1Up:Connect(function()
            pressed = false
            paint()
        end)
        button.Activated:Connect(function()
            if enabled and type(spec.Callback) == "function" then
                pcall(spec.Callback, handle)
            end
        end)

        function handle.SetText(text)
            spec.Text = tostring(text or "")
            button.Text = spec.Text
            return handle
        end

        function handle.SetCallback(callback)
            spec.Callback = callback
            return handle
        end

        function handle.SetEnabled(value)
            enabled = value ~= false
            paint()
            return handle
        end

        return handle
    end

    local function canvasCreateImage(surface, spec)
        local image = Instance.new("ImageLabel")
        image.Name = tostring(spec.Name or "Image")
        image.Active = false
        image.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(0, 0, 0))
        image.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 1), 0, 1)
        image.BorderSizePixel = 0
        image.ScaleType = Enum.ScaleType.Fit
        image.ZIndex = tonumber(spec.ZIndex) or 7
        canvasQueueParent(surface, image, canvasParentOf(surface, spec.Parent))

        local handle = canvasMakeHandle(surface, image, "Image", spec, function()
            local metrics = surface._metrics
            image.Image = tostring(spec.Image or "")
            image.ImageColor3 = canvasColor(spec.ImageColor, Color3.fromRGB(255, 255, 255))
            image.ImageTransparency = math.clamp(canvasNumber(spec.Transparency, 0), 0, 1)
            if spec.ScaleType ~= nil then
                local mode = string.lower(tostring(spec.ScaleType))
                image.ScaleType = mode == "stretch" and Enum.ScaleType.Stretch
                    or (mode == "crop" and Enum.ScaleType.Crop or Enum.ScaleType.Fit)
            end
            canvasBaseApply(surface, image, spec)
            if typeof(spec.Size) ~= "UDim2" and spec.Width == nil and spec.WidthScale == nil then
                local height = image.Size.Y.Offset
                image.Size = UDim2.fromOffset(height, height)
            end
            if spec.StrokeColor ~= nil or spec.StrokeThickness ~= nil then
                canvasStroke(
                    image,
                    canvasColor(spec.StrokeColor, Color3.fromRGB(255, 255, 255)),
                    canvasNumber(spec.StrokeThickness, 0.08) * metrics.Unit,
                    spec.StrokeTransparency,
                    Enum.ApplyStrokeMode.Border
                )
            end
            canvasCorner(image, canvasNumber(spec.Corner, 0.3) * metrics.Unit)
        end)

        function handle.SetImage(value)
            spec.Image = value
            image.Image = tostring(value or "")
            return handle
        end

        return handle
    end

    local function canvasCreateBar(surface, spec)
        local track = Instance.new("Frame")
        track.Name = tostring(spec.Name or "Bar")
        track.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(40, 40, 55))
        track.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 0.25), 0, 1)
        track.BorderSizePixel = 0
        track.ClipsDescendants = true
        track.ZIndex = tonumber(spec.ZIndex) or 7
        canvasQueueParent(surface, track, canvasParentOf(surface, spec.Parent))

        local fill = Instance.new("Frame")
        fill.Name = "Fill"
        fill.BackgroundColor3 = canvasColor(spec.FillColor, Color3.fromRGB(58, 255, 55))
        fill.BackgroundTransparency = math.clamp(canvasNumber(spec.FillTransparency, 0), 0, 1)
        fill.BorderSizePixel = 0
        fill.Position = UDim2.fromScale(0, 0)
        fill.Size = UDim2.fromScale(0, 1)
        fill.ZIndex = track.ZIndex + 1
        fill.Parent = track

        local handle = canvasMakeHandle(surface, track, "Bar", spec, function()
            local metrics = surface._metrics
            canvasBaseApply(surface, track, spec)
            if typeof(spec.Size) ~= "UDim2" and spec.Height == nil and spec.HeightScale == nil then
                track.Size = UDim2.new(track.Size.X.Scale, track.Size.X.Offset, 0, math.max(2, math.floor(metrics.Unit * 0.32)))
            end
            track.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(40, 40, 55))
            fill.BackgroundColor3 = canvasColor(spec.FillColor, Color3.fromRGB(58, 255, 55))
            fill.Size = UDim2.fromScale(math.clamp(canvasNumber(spec.Alpha, 0), 0, 1), 1)
            canvasCorner(track, canvasNumber(spec.Corner, 0.16) * metrics.Unit)
            canvasCorner(fill, canvasNumber(spec.Corner, 0.16) * metrics.Unit)
            canvasGradient(fill, spec.FillGradient, spec.GradientRotation)
        end)

        function handle.SetAlpha(alpha)
            spec.Alpha = alpha
            fill.Size = UDim2.fromScale(math.clamp(canvasNumber(alpha, 0), 0, 1), 1)
            return handle
        end

        return handle
    end

    local function canvasCreateModel(surface, spec)
        local view = Instance.new("ViewportFrame")
        view.Name = tostring(spec.Name or "Model")
        view.Ambient = canvasColor(spec.Ambient, Color3.fromRGB(170, 170, 180))
        view.BackgroundColor3 = canvasColor(spec.Background, Color3.fromRGB(0, 0, 0))
        view.BackgroundTransparency = math.clamp(canvasNumber(spec.BackgroundTransparency, 1), 0, 1)
        view.BorderSizePixel = 0
        view.LightColor = canvasColor(spec.LightColor, Color3.fromRGB(255, 255, 255))
        view.LightDirection = typeof(spec.LightDirection) == "Vector3" and spec.LightDirection
            or Vector3.new(-0.6, -1, -0.4)
        view.ZIndex = tonumber(spec.ZIndex) or 7
        canvasQueueParent(surface, view, canvasParentOf(surface, spec.Parent))

        local camera = Instance.new("Camera")
        camera.FieldOfView = canvasNumber(spec.FieldOfView, 40)
        camera.Parent = view
        view.CurrentCamera = camera

        local state = {
            Template = nil,
            Model = nil,
            Center = Vector3.zero,
            Radius = nil,
            Distance = 10,
            Angle = 0,
            Spin = spec.Spin ~= false,
            Height = canvasNumber(spec.CameraHeight, 0.35),
            Zoom = canvasNumber(spec.Zoom, 1.05),
        }

        local function place()
            if not state.Model then
                return
            end
            local direction = Vector3.new(math.sin(state.Angle), state.Height, math.cos(state.Angle)).Unit
            camera.CFrame = CFrame.lookAt(state.Center + direction * state.Distance, state.Center)
        end

        local function mount(template)
            if state.Model then
                state.Model:Destroy()
                state.Model = nil
            end
            state.Template = template
            local copy = canvasClone(template)
            if not copy then
                return
            end
            local boxCFrame, boxSize
            if copy:IsA("Model") then
                boxCFrame, boxSize = copy:GetBoundingBox()
            elseif copy:IsA("BasePart") then
                boxCFrame, boxSize = copy.CFrame, copy.Size
            end
            if not boxCFrame then
                copy:Destroy()
                return
            end
            state.Center = boxCFrame.Position
            state.Radius = boxSize.Magnitude * 0.5
            state.Distance = state.Radius / math.tan(math.rad(camera.FieldOfView / 2)) * state.Zoom
            copy.Parent = view
            state.Model = copy
            place()
        end

        local handle = canvasMakeHandle(surface, view, "Model", spec, function()
            local metrics = surface._metrics
            canvasBaseApply(surface, view, spec)
            if typeof(spec.Size) ~= "UDim2" and spec.Width == nil and spec.WidthScale == nil then
                local height = view.Size.Y.Offset
                view.Size = UDim2.fromOffset(height, height)
            end
            if spec.Corner ~= nil then
                canvasCorner(view, canvasNumber(spec.Corner, 0) * metrics.Unit)
            end
            if spec.StrokeColor ~= nil or spec.StrokeThickness ~= nil then
                canvasStroke(
                    view,
                    canvasColor(spec.StrokeColor, Color3.fromRGB(255, 255, 255)),
                    canvasNumber(spec.StrokeThickness, 0.08) * metrics.Unit,
                    spec.StrokeTransparency,
                    Enum.ApplyStrokeMode.Border
                )
            end
            local zoom = canvasNumber(spec.Zoom, 1.05)
            if zoom ~= state.Zoom and state.Radius then
                state.Distance = state.Radius / math.tan(math.rad(camera.FieldOfView / 2)) * zoom
            end
            state.Zoom = zoom
            state.Height = canvasNumber(spec.CameraHeight, 0.35)
            if spec.Model ~= state.Template then
                mount(spec.Model)
            end
            view.Visible = spec.Visible ~= false and state.Model ~= nil
        end)

        function handle.SetModel(template)
            spec.Model = template
            surface._queue(handle)
            return handle
        end

        function handle.SetSpin(value)
            state.Spin = value ~= false
            return handle
        end

        function handle.Step(delta)
            if state.Model and state.Spin then
                state.Angle = (state.Angle + CANVAS_SPIN_SPEED * delta) % (math.pi * 2)
                place()
            end
        end

        table.insert(surface._models, handle)
        return handle
    end

    local function createLibraryCanvasRow(config)
        local style = {}
        for key, value in pairs(CANVAS_STYLE) do
            style[key] = value
        end
        canvasMerge(style, config.Style)

        local titleText = config.Title ~= nil and tostring(config.Title) or tostring(config.Name)
        local titleEnabled = config.ShowTitle ~= false
        local searchEnabled = config.Search == true
        local searchPlaceholder = tostring(config.SearchPlaceholder or "Search...")

        local row = createLibraryTextRow({
            Name = config.Name,
            Text = titleText,
        })
        local aspect = row:FindFirstChildOfClass("UIAspectRatioConstraint")
        if aspect then
            aspect:Destroy()
        end
        row:SetAttribute("ChilliResponsiveAspect", nil)
        row.ClipsDescendants = false
        row.Size = UDim2.new(ROW_WIDTH_SCALE, 0, 0, 1)

        local plate = row:FindFirstChild("Main")
        local title = plate:FindFirstChild("Label")
        local plateStroke = plate:FindFirstChildOfClass("UIStroke")
        plate.ClipsDescendants = style.ClipContent ~= false
        title.AnchorPoint = Vector2.new(0, 0)

        local function hostWidthScale()
            if RESIZE_KEEPS_OPTION_WIDTH then
                return ROW_WIDTH_SCALE / ContentScale.X
            end
            return ROW_WIDTH_SCALE
        end

        local searchField = Instance.new("Frame")
        searchField.Name = "SearchField"
        searchField.AnchorPoint = Vector2.new(0.5, 0.5)
        searchField.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        searchField.BackgroundTransparency = 0.6
        searchField.BorderSizePixel = 0
        searchField.Visible = false
        searchField.ZIndex = 4
        searchField.Parent = plate
        addScaledStroke(searchField, Enum.ApplyStrokeMode.Border, 0.1)

        local searchBox = Instance.new("TextBox")
        searchBox.Name = "SearchInput"
        searchBox.Active = true
        searchBox.AnchorPoint = Vector2.new(0.5, 0.5)
        searchBox.BackgroundTransparency = 1
        searchBox.BorderSizePixel = 0
        searchBox.ClearTextOnFocus = false
        searchBox.MultiLine = false
        searchBox.Position = UDim2.fromScale(0.5, 0.5)
        searchBox.Size = UDim2.fromScale(0.9, 0.56)
        searchBox.Text = ""
        searchBox.PlaceholderText = searchPlaceholder
        searchBox.PlaceholderColor3 = Color3.fromRGB(198, 198, 198)
        searchBox.TextXAlignment = Enum.TextXAlignment.Center
        searchBox.ZIndex = 5
        searchBox.Parent = searchField
        applyPlainTextStyle(searchBox)

        local scroll = Instance.new("ScrollingFrame")
        scroll.Name = "CanvasScroll"
        scroll.Active = true
        scroll.BackgroundTransparency = 1
        scroll.BorderSizePixel = 0
        scroll.CanvasSize = UDim2.new()
        scroll.ElasticBehavior = Enum.ElasticBehavior.Never
        scroll.ScrollBarImageColor3 = style.ScrollBarColor
        scroll.ScrollBarImageTransparency = style.ScrollBarTransparency
        scroll.ScrollingDirection = Enum.ScrollingDirection.Y
        scroll.ZIndex = 5
        scroll.Parent = plate


        local dockFrame = Instance.new("Frame")
        dockFrame.Name = "CanvasDock"
        dockFrame.BackgroundTransparency = 1
        dockFrame.BorderSizePixel = 0
        dockFrame.ClipsDescendants = false
        dockFrame.Visible = false
        dockFrame.ZIndex = 7
        dockFrame.Parent = plate

        local dockRule = Instance.new("Frame")
        dockRule.Name = "CanvasDockRule"
        dockRule.BackgroundColor3 = Color3.fromRGB(170, 174, 184)
        dockRule.BorderSizePixel = 0
        dockRule.Visible = false
        dockRule.ZIndex = 7
        dockRule.Parent = plate
        local root = Instance.new("Frame")
        root.Name = "CanvasRoot"
        root.AutomaticSize = Enum.AutomaticSize.Y
        root.BackgroundTransparency = 1
        root.BorderSizePixel = 0
        root.Position = UDim2.fromScale(0, 0)
        root.Size = UDim2.new(1, 0, 0, 0)
        root.ZIndex = 6
        root.Parent = scroll

        if string.lower(tostring(config.Layout or "stack")) ~= "free" then
            local layout = Instance.new("UIListLayout")
            layout.Name = "CanvasLayout"
            layout.FillDirection = Enum.FillDirection.Vertical
            layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.VerticalAlignment = Enum.VerticalAlignment.Top
            layout.Parent = root
        end

        local surface = setmetatable({
            _kind = "Surface",
            _style = style,
            _root = root,
            _scroll = scroll,
            _plate = plate,
            _row = row,
            _elements = {},
            _models = {},
            _pendingParents = {},
            _pendingApply = {},
            _resizeHandlers = {},
            _metrics = {
                Unit = 16,
                TextSize = 13,
                LineHeight = style.LineHeight,
                Font = normalTextFont,
                Align = Enum.TextXAlignment.Left,
                Width = 0,
            },
            _query = "",
            _dockUnits = 0,
            _dockGap = 0.22,
            _dockRule = true,
            _contentHeight = nil,
            _dirty = true,
            _alive = true,
        }, SurfaceMethods)

        function surface._queue(handle)
            table.insert(surface._pendingApply, handle)
            surface._dirty = true
        end

        local function flushParents()
            local pending = surface._pendingParents
            for index = #pending, 1, -1 do
                local entry = pending[index]
                local instance, parent = entry[1], entry[2]
                if instance.Parent == nil and parent and parent.Parent ~= nil then
                    local ok = pcall(function()
                        instance.Parent = parent
                    end)
                    if ok then
                        table.remove(pending, index)
                    end
                elseif instance.Parent ~= nil then
                    table.remove(pending, index)
                end
            end
        end

        local function layout()
            local host = row.Parent
            local rowWidth = row.AbsoluteSize.X
            if not host or rowWidth <= 0 then
                return
            end
            local referenceWidth = host.AbsoluteSize.X * ROW_WIDTH_SCALE / math.max(ContentScale.X, 0.001)
            if referenceWidth <= 0 then
                referenceWidth = rowWidth
            end

            local bandHeight = referenceWidth / ROW_ASPECT * 0.85
            local sideInset = rowWidth * 0.025
            local padY = bandHeight * 0.2 * canvasNumber(style.Padding, 1)
            local textSize = math.max(
                8,
                math.floor(referenceWidth * CANVAS_BODY_RATIO * canvasNumber(style.TextScale, 1) + 0.5)
            )
            local lineHeight = math.max(0.8, canvasNumber(style.LineHeight, 1.16))
            local unit = textSize * lineHeight
            local contentWidth = math.max(1, rowWidth - sideInset * 2)

            local metrics = surface._metrics
            metrics.TextSize = textSize
            metrics.LineHeight = lineHeight
            metrics.Unit = unit
            metrics.Width = contentWidth
            metrics.Font = canvasFont(style.Font) or normalTextFont
            metrics.Align = CANVAS_ALIGN[string.lower(tostring(style.Alignment))] or Enum.TextXAlignment.Left

            plate.BackgroundColor3 = canvasColor(style.BackgroundColor, Color3.fromRGB(0, 0, 0))
            plate.BackgroundTransparency = math.clamp(canvasNumber(style.BackgroundTransparency, 0.5), 0, 1)
            plate.ClipsDescendants = style.ClipContent ~= false
            if plateStroke then
                pcall(function()
                    plateStroke.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
                end)
                plateStroke.Color = canvasColor(style.StrokeColor, Color3.fromRGB(0, 0, 0))
                plateStroke.Transparency = math.clamp(canvasNumber(style.StrokeTransparency, 0), 0, 1)
                plateStroke.Thickness = math.max(1, bandHeight * canvasNumber(style.StrokeScale, 0.05))
            end

            local showTitle = titleEnabled and titleText ~= ""
            local headerHeight = (showTitle or searchEnabled) and bandHeight or 0
            local fieldWidth = rowWidth * CONTROL_LAYOUT.WideWidth
            local fieldCenterX = rowWidth * CONTROL_LAYOUT.WideCenterX
            searchField.Visible = searchEnabled
            if searchEnabled then
                searchField.Size = UDim2.fromOffset(fieldWidth, bandHeight * 0.62)
                searchField.Position = UDim2.fromOffset(fieldCenterX, bandHeight / 2)
            end

            local titleHeight = bandHeight * 0.64 * canvasNumber(style.TitleScale, 1)
            local titleRight = searchEnabled and (fieldCenterX - fieldWidth / 2 - sideInset)
                or (rowWidth - sideInset)
            title.Visible = showTitle
            title.Text = titleText
            title.Position = UDim2.fromOffset(sideInset, (bandHeight - titleHeight) / 2)
            title.Size = UDim2.fromOffset(math.max(1, titleRight - sideInset), titleHeight)
            title.TextXAlignment = searchEnabled and Enum.TextXAlignment.Left or metrics.Align

            local top = headerHeight > 0 and headerHeight or padY
            if surface._dockUnits > 0 then
                local dockHeight = math.floor(surface._dockUnits * unit + 0.5)
                local dockGap = math.floor(canvasNumber(surface._dockGap, 0.22) * unit + 0.5)
                local dockRuleHeight = surface._dockRule ~= false
                    and math.max(1, math.floor(textSize * 0.12 + 0.5))
                    or 0
                dockFrame.Visible = true
                dockFrame.Position = UDim2.fromOffset(sideInset, top)
                dockFrame.Size = UDim2.fromOffset(contentWidth, dockHeight)
                dockRule.Visible = dockRuleHeight > 0
                if dockRuleHeight > 0 then
                    dockRule.BackgroundColor3 = canvasColor(surface._dockRuleColor, Color3.fromRGB(170, 174, 184))
                    dockRule.Position = UDim2.fromOffset(sideInset, top + dockHeight + dockGap)
                    dockRule.Size = UDim2.fromOffset(contentWidth, dockRuleHeight)
                    top += dockHeight + dockGap * 2 + dockRuleHeight
                else
                    top += dockHeight + dockGap
                end
            else
                dockFrame.Visible = false
                dockRule.Visible = false
            end
            flushParents()

            for _, handler in ipairs(surface._resizeHandlers) do
                pcall(handler, surface._api, contentWidth, unit)
            end
            flushParents()
            for _, handle in ipairs(surface._elements) do
                pcall(handle.Apply)
            end

            local contentHeight = surface._contentHeight
            if contentHeight == nil then
                contentHeight = math.ceil(root.AbsoluteSize.Y)
            end
            contentHeight = math.max(
                contentHeight,
                math.ceil(unit * math.max(0, canvasNumber(style.MinLines, 0))),
                1
            )
            local maxLines = math.max(0, math.floor(canvasNumber(style.MaxLines, 0)))
            local limit = maxLines > 0 and math.ceil(unit * maxLines) or math.huge
            local viewHeight = math.min(contentHeight, limit)
            local scrolls = contentHeight > viewHeight + 0.5
            local barWidth = math.max(2, math.floor(referenceWidth * 0.006 + 0.5))

            scroll.Position = UDim2.fromOffset(sideInset, top)
            scroll.Size = UDim2.fromOffset(contentWidth, viewHeight)
            scroll.CanvasSize = UDim2.fromOffset(0, contentHeight)
            scroll.ScrollBarThickness = scrolls and barWidth or 0
            scroll.ScrollingEnabled = scrolls
            scroll.ScrollBarImageColor3 = canvasColor(style.ScrollBarColor, Color3.fromRGB(255, 255, 255))
            scroll.ScrollBarImageTransparency = math.clamp(canvasNumber(style.ScrollBarTransparency, 0), 0, 1)

            local plateHeight = math.max(1, math.ceil(top + viewHeight + padY))
            local rowGap = math.ceil(bandHeight * 0.15 / 0.85)
            plate.Size = UDim2.new(1, 0, 0, plateHeight)
            row.Size = UDim2.new(hostWidthScale(), 0, 0, plateHeight + rowGap)
        end

        local lastWidth, lastRootHeight = -1, -1
        local visibilityClock, spinClock, onScreen = CANVAS_VISIBILITY_CHECK, 0, true

        row:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if math.abs(row.AbsoluteSize.X - lastWidth) >= 0.5 then
                lastWidth = row.AbsoluteSize.X
                surface._dirty = true
            end
        end)

        root:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if math.abs(root.AbsoluteSize.Y - lastRootHeight) >= 0.5 then
                lastRootHeight = root.AbsoluteSize.Y
                surface._dirty = true
            end
        end)

        ContentScale.OnChanged(function()
            if not surface._alive then
                return false
            end
            surface._dirty = true
        end)

        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            if surface._query ~= searchBox.Text then
                surface._query = searchBox.Text
                if type(config.OnSearch) == "function" then
                    pcall(config.OnSearch, surface, surface._query)
                end
                surface._dirty = true
            end
        end)

        searchBox.Focused:Connect(function()
            TweenService:Create(searchField, TweenInfo.new(0.16), { BackgroundTransparency = 0.42 }):Play()
        end)
        searchBox.FocusLost:Connect(function()
            TweenService:Create(searchField, TweenInfo.new(0.16), { BackgroundTransparency = 0.6 }):Play()
        end)

        local heartbeat = RunService.Heartbeat:Connect(function(deltaTime)
            if not surface._alive or row.Parent == nil then
                return
            end
            visibilityClock += deltaTime
            if visibilityClock >= CANVAS_VISIBILITY_CHECK then
                visibilityClock = 0
                onScreen = canvasShown(row)
            end

            if #surface._pendingParents > 0 then
                flushParents()
                surface._dirty = true
            end

            local pending = surface._pendingApply
            if #pending > 0 then
                for index = 1, #pending do
                    pcall(pending[index].Apply)
                end
                table.clear(pending)
                surface._dirty = true
            end

            if surface._dirty then
                surface._dirty = false
                if not pcall(layout) then
                    surface._dirty = true
                end
            end

            if onScreen and #surface._models > 0 then
                spinClock += deltaTime
                if spinClock >= 1 / CANVAS_SPIN_RATE then
                    local step = spinClock
                    spinClock = 0
                    for _, model in ipairs(surface._models) do
                        pcall(model.Step, step)
                    end
                end
            end
        end)

        surface._impl = {
            Root = function()
                return root
            end,
            Dock = function()
                return dockFrame
            end,
            SetDock = function(units, options)
                surface._dockUnits = math.max(0, canvasNumber(units, 0))
                if type(options) == "table" then
                    if options.Gap ~= nil then
                        surface._dockGap = canvasNumber(options.Gap, 0.22)
                    end
                    if options.Divider ~= nil then
                        surface._dockRule = options.Divider ~= false
                    end
                    if options.DividerColor ~= nil then
                        surface._dockRuleColor = options.DividerColor
                    end
                end
                surface._dirty = true
            end,
            Scroll = function()
                return scroll
            end,
            Plate = function()
                return plate
            end,
            Unit = function()
                return surface._metrics.Unit
            end,
            Width = function()
                return surface._metrics.Width
            end,
            TextSize = function()
                return surface._metrics.TextSize
            end,
            LineHeight = function()
                return surface._metrics.LineHeight
            end,
            Font = function()
                return surface._metrics.Font
            end,
            Query = function()
                return surface._query
            end,
            Metrics = function()
                local metrics = surface._metrics
                return {
                    Unit = metrics.Unit,
                    Width = metrics.Width,
                    TextSize = metrics.TextSize,
                    LineHeight = metrics.LineHeight,
                    Font = metrics.Font,
                }
            end,
            SetContentHeight = function(pixels)
                surface._contentHeight = tonumber(pixels)
                surface._dirty = true
            end,
            SetContentLines = function(lines)
                local count = tonumber(lines)
                surface._contentHeight = count and math.ceil(count * surface._metrics.Unit) or nil
                surface._dirty = true
            end,
            Invalidate = function()
                surface._dirty = true
            end,
            Clear = function()
                for index = #surface._elements, 1, -1 do
                    local handle = surface._elements[index]
                    surface._elements[index] = nil
                    local instance = handle.Get()
                    if instance then
                        instance:Destroy()
                    end
                end
                table.clear(surface._models)
                table.clear(surface._pendingParents)
                table.clear(surface._pendingApply)
                surface._dirty = true
            end,
            OnResize = function(handler)
                if type(handler) == "function" then
                    table.insert(surface._resizeHandlers, handler)
                end
            end,
            SetStyle = function(patch)
                canvasMerge(style, patch)
                surface._dirty = true
            end,
            GetStyle = function()
                local copy = {}
                for key, value in pairs(style) do
                    copy[key] = value
                end
                return copy
            end,
            SetTitle = function(value)
                titleText = tostring(value or "")
                surface._dirty = true
            end,
            SetSearchEnabled = function(value)
                searchEnabled = value == true
                surface._dirty = true
            end,
            SetSearchQuery = function(value)
                surface._query = tostring(value or "")
                searchBox.Text = surface._query
                surface._dirty = true
            end,
            Attach = function(instance, parent)
                if typeof(instance) == "Instance" then
                    canvasQueueParent(surface, instance, canvasParentOf(surface, parent))
                end
                return instance
            end,
            Frame = function(spec)
                return canvasCreateFrame(surface, type(spec) == "table" and spec or {})
            end,
            Text = function(spec)
                return canvasCreateText(surface, type(spec) == "table" and spec or {})
            end,
            Button = function(spec)
                return canvasCreateButton(surface, type(spec) == "table" and spec or {})
            end,
            Image = function(spec)
                return canvasCreateImage(surface, type(spec) == "table" and spec or {})
            end,
            Model = function(spec)
                return canvasCreateModel(surface, type(spec) == "table" and spec or {})
            end,
            Bar = function(spec)
                return canvasCreateBar(surface, type(spec) == "table" and spec or {})
            end,
        }

        surface._api = setmetatable({ _impl = surface._impl }, SurfaceMethods)

        local builder = type(config.Build) == "function" and config.Build or nil
        if builder then
            table.insert(surface._resizeHandlers, 1, function(api, width, unit)
                if builder then
                    local pending = builder
                    builder = nil
                    local ok, problem = pcall(pending, api, width, unit)
                    if not ok then warn("MIKOTOH Canvas Build: " .. tostring(problem)) end
                end
            end)
        end

        local controller = {}

        function controller.GetSurface()
            return surface._api
        end

        function controller.GetTitle()
            return titleText
        end

        function controller.SetTitle(value)
            titleText = tostring(value or "")
            surface._dirty = true
        end

        function controller.GetStyle()
            return surface._impl.GetStyle()
        end

        function controller.SetStyle(patch)
            surface._impl.SetStyle(patch)
        end

        function controller.SetSearchEnabled(value)
            surface._impl.SetSearchEnabled(value)
        end

        function controller.SetSearchQuery(value)
            surface._impl.SetSearchQuery(value)
        end

        function controller.GetSearchQuery()
            return surface._query
        end

        function controller.Destroy()
            surface._alive = false
            heartbeat:Disconnect()
            for _, handle in ipairs(surface._elements) do
                local instance = handle.Get()
                if instance then
                    instance:Destroy()
                end
            end
            table.clear(surface._elements)
            table.clear(surface._models)
        end

        return row, controller
    end

    return createLibraryCanvasRow
end)()
local ACTION_OPTION_TYPES = { [4] = true, [5] = true }

ApiImpl[86] = function(self, optionType, config)
    assertObject(self, "Section")
    local typeCode, normalizedType = Runtime[101](optionType)
    local isActionOption = ACTION_OPTION_TYPES[typeCode] == true
    local factory = optionFactories[typeCode]
    assert(factory, ("Unsupported feature type: %s"):format(optionType))

    local optionConfig = normalizeConfig(config, optionType)
    assert(
        not self._optionByName[optionConfig.Name],
        ("Feature '%s' already exists in Section '%s'")
            :format(optionConfig.Name, self.Name)
    )
    local requestedState = nil
    if optionConfig.State ~= nil then
        assert(
            typeCode ~= 1,
            "Button khong co value nen khong the bind State"
        )
        requestedState = resolveState(optionConfig.State)
        assert(
            requestedState.Window == self.Tab.Window,
            "State and Feature must belong to the same Window"
        )
        optionConfig.Default = callStateTransform(
            optionConfig.StateToOption,
            requestedState.Value,
            copyLinkedValue(requestedState.Value),
            nil,
            requestedState
        )
    end
    local userCallback = optionConfig.Callback
    local optionHandle = nil
    optionConfig.Callback = function(value, ...)
        local callbackArguments = table.pack(value, ...)
        local stateChanged = false
        if optionHandle and optionHandle.State then
            local stateValue = callStateTransform(
                optionHandle._stateBinding.FromOption,
                value,
                copyLinkedValue(value),
                optionHandle,
                optionHandle.State
            )
            stateChanged = runStateTransaction(
                optionHandle.State,
                stateValue,
                true,
                optionHandle,
                callbackArguments
            ) == true
        end

        
        
        
        
        local firedByState = stateChanged
            and optionHandle ~= nil
            and optionHandle.State ~= nil
            and stateUsesPrimaryCallback(optionHandle.State)
            and optionHandle.State._primaryOption == optionHandle

        if (isActionOption and not firedByState)
            or not optionHandle
            or not optionHandle.State
            or not stateUsesPrimaryCallback(optionHandle.State)
        then
            safeCallback(
                userCallback,
                table.unpack(
                    callbackArguments,
                    1,
                    callbackArguments.n
                )
            )
        end
        if optionHandle
            and not optionHandle.State
            and Runtime.optionChangedHook
        then
            Runtime.optionChangedHook(optionHandle)
        end
    end
    
    local rowConfig = optionConfig
    if optionConfig.DisplayName ~= nil then
        rowConfig = copyTable(optionConfig)
        rowConfig.Name = tostring(optionConfig.DisplayName)
    end
    local row, controller = factory(rowConfig)
    row.Name = optionConfig.Name
    optionHandle = addRowToSection(
        self,
        normalizedType,
        row,
        controller
    )
    optionHandle.DisplayName = tostring(
        optionConfig.DisplayName or optionConfig.Name
    )
    optionHandle._userCallback = userCallback
    
    
    
    optionHandle._sourceConfig = optionConfig
    
    
    
    
    
    
    
    
    optionHandle._quickName = optionConfig.QuickName
        and tostring(optionConfig.QuickName)
        or nil
    optionHandle._quickPinDefault = optionConfig.Pin == true
    optionHandle._quickBarDefault = optionConfig.QuickBar
        or optionConfig.QuickGroup
        or optionConfig.Bar
    optionHandle._quickKeyDefault = optionConfig.Keybind
    optionHandle._quickIgnored = optionConfig.QuickIgnore == true
        or optionConfig.Quick == false
    
    
    
    optionHandle._keybindGroup = optionConfig.KeybindGroup ~= nil
        and tostring(optionConfig.KeybindGroup)
        or nil
    self._optionByName[optionHandle.Name] = optionHandle
    if controller.GetValue and controller.SetValue then
        local state = requestedState
        if not state then
            state = createStateObject(self.Tab.Window, {
                Name = (
                    self.Tab.Name
                    .. " > "
                    .. self.Name
                    .. " > "
                    .. optionHandle.Name
                ),
                Default = controller.GetValue(),
                Save = false,
            }, false)
        end
        bindOptionToState(optionHandle, state, optionConfig)
    elseif requestedState then
        error(
            ("%s khong ho tro State vi khong co GetValue/SetValue")
                :format(optionHandle.Type),
            2
        )
    end

    
    
    local visibilitySource = optionConfig.ShowWhen
        or optionConfig.DependsOn
        or optionConfig.VisibleWhen
    if visibilitySource ~= nil then
        local visibilityOptions = type(optionConfig.Visibility) == "table"
                and copyTable(optionConfig.Visibility)
            or {}
        if optionConfig.ShowWhenValue ~= nil then
            visibilityOptions.Value = optionConfig.ShowWhenValue
        elseif optionConfig.VisibleWhenValue ~= nil then
            visibilityOptions.Value = optionConfig.VisibleWhenValue
        end
        if optionConfig.VisibilityPredicate ~= nil then
            visibilityOptions.Predicate = optionConfig.VisibilityPredicate
        end
        if optionConfig.AnimateVisibility ~= nil then
            visibilityOptions.Animated = optionConfig.AnimateVisibility
        end
        ApiImpl[47](optionHandle, visibilitySource, visibilityOptions)
    end

    
    local subSource = optionConfig.SubOf
        or optionConfig.ChildOf
        or optionConfig.Under
    if subSource ~= nil then
        ApiImpl[48](optionHandle, subSource)
    end
    if Runtime.optionStyled then Runtime.optionStyled(optionHandle, optionConfig) end
    return optionHandle
end
































ApiImpl[87] = function(self, expanded, animated)
    assertObject(self, "Section")
    expanded = expanded == true
    if self.Expanded == expanded and animated ~= false then
        return self
    end

    closeActiveDropdown()
    self._measureExpandedHeight()
    self.Expanded = expanded
    self._animationSerial = self._animationSerial + 1
    local serial = self._animationSerial
    local targetHeight = expanded and self._expandedHeight or 0
    local targetRotation = expanded and 0 or -90

    if self._heightTween then
        self._heightTween:Cancel()
    end
    if self._arrowTween then
        self._arrowTween:Cancel()
    end

    
    
    
    self._group.ClipsDescendants = true

    if expanded then
        
        
        self._group.Visible = true
    end

    if animated == false then
        self._group.Size = UDim2.new(1, 0, 0, targetHeight)
        self._group.Visible = expanded
        self._group.ClipsDescendants = not expanded
        self._arrow.Rotation = targetRotation
        task.defer(self._refreshContainer)
        task.defer(self.Tab._updateCanvas)
        return self
    end

    local info = TweenInfo.new(
        0.28,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )
    self._heightTween = TweenService:Create(
        self._group,
        info,
        {
            Size = UDim2.new(1, 0, 0, targetHeight),
        }
    )
    self._arrowTween = TweenService:Create(
        self._arrow,
        TweenInfo.new(
            0.24,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        {
            Rotation = targetRotation,
        }
    )

    self._heightTween.Completed:Connect(function()
        if serial == self._animationSerial then
            self._heightTween = nil
            self._arrowTween = nil
            self._group.Visible = self.Expanded
            self._group.ClipsDescendants = not self.Expanded
            self._refreshHeight()
            self._refreshContainer()
        end
    end)
    self._heightTween:Play()
    self._arrowTween:Play()
    return self
end

ApiImpl[88] = function(self)
    return ApiImpl[87](self, not self.Expanded, true)
end

ApiImpl[89] = function(self)
    assertObject(self, "Section")
    self._destroyed = true
    closeActiveDropdown()
    self._animationSerial = self._animationSerial + 1
    if self._heightTween then
        self._heightTween:Cancel()
        self._heightTween = nil
    end
    if self._arrowTween then
        self._arrowTween:Cancel()
        self._arrowTween = nil
    end
    for index = #self.Options, 1, -1 do
        local option = self.Options[index]
        if option and not option._destroyed then
            ApiImpl[85](option)
        end
    end
    for index = #self._connections, 1, -1 do
        local connection = self._connections[index]
        if connection.Connected then
            connection:Disconnect()
        end
        self._connections[index] = nil
    end
    self.Tab._sectionByName[self.Name] = nil
    for index, section in ipairs(self.Tab.Sections) do
        if section == self then
            table.remove(self.Tab.Sections, index)
            break
        end
    end
    self._container:Destroy()
    if not self.Tab._destroyed then
        task.defer(self.Tab._updateCanvas)
    end
end

ApiImpl[90] = function(self, config)
    assertObject(self, "Tab")
    local sectionConfig = normalizeConfig(config, "Section")
    assert(
        not self._sectionByName[sectionConfig.Name],
        ("Section '%s' da ton tai trong Tab '%s'")
            :format(sectionConfig.Name, self.Name)
    )

    local initiallyExpanded = sectionConfig.Expanded
    if initiallyExpanded == nil then
        initiallyExpanded = self.SectionsExpanded
    end

    self._nextSectionOrder = self._nextSectionOrder + 1

    
    
    
    
    
    
    
    
    
    local container = Instance.new("Frame")
    container.Name = sectionConfig.Name .. "Section"
    container.Active = false
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ClipsDescendants = false
    container.LayoutOrder = self._nextSectionOrder
    container.Size = UDim2.new(1, 0, 0, 0)
    container.ZIndex = 3
    container.Parent = self.Page

    local sectionLayout = Instance.new("UIListLayout")
    sectionLayout.Name = "SectionLayout"
    sectionLayout.FillDirection = Enum.FillDirection.Vertical
    sectionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sectionLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    sectionLayout.Padding = UDim.new(0, 2)
    sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sectionLayout.Parent = container

    local sectionDisplayName = tostring(
        sectionConfig.DisplayName or sectionConfig.Name
    )
    local header, arrow, headerButton = createSectionHeader(
        sectionDisplayName,
        1,
        self.Page
    )
    header.Parent = container

    local lastHeaderWidth = -1
    local function updateHeaderHeight(force)
        if not force and (Runtime.windowAnimating or not self.Page.Visible) then
            return
        end
        local availableWidth = container.AbsoluteSize.X
        if availableWidth <= 0 then
            availableWidth = self.Page.AbsoluteSize.X
        end
        if availableWidth <= 0 then
            return
        end
        local scale = ContentScale.X
        local referenceWidth = availableWidth / scale
        if math.abs(referenceWidth - lastHeaderWidth) < 0.5 then
            return
        end
        lastHeaderWidth = referenceWidth
        local headerHeight = math.max(
            1,
            math.floor(
                referenceWidth * 0.97 / SECTION_HEADER_ASPECT + 0.5
            )
        )
        local headerWidthScale = 0.97
        if RESIZE_KEEPS_OPTION_WIDTH then
            headerWidthScale = 0.97 / scale
        end
        header.Size = UDim2.new(headerWidthScale, 0, 0, headerHeight)
    end

    ContentScale.OnChanged(function()
        if container.Parent == nil then
            return false
        end
        updateHeaderHeight()
    end)

    local group = Instance.new("Frame")
    group.Name = "CollapsibleContent"
    group.Active = false
    group.BackgroundTransparency = 1
    group.BorderSizePixel = 0
    group.ClipsDescendants = true
    group.LayoutOrder = 2
    group.Size = UDim2.new(1, 0, 0, 0)
    group.ZIndex = 3
    group.Parent = container

    local content = Instance.new("Frame")
    content.Name = "Content"
    content.Active = false
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.Position = UDim2.fromScale(0, 0)
    content.Size = UDim2.new(1, 0, 0, 1)
    content.ZIndex = 3
    content.Parent = group

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Name = "OptionLayout"
    contentLayout.FillDirection = Enum.FillDirection.Vertical
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    contentLayout.Padding = UDim.new(0, 0)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Parent = content

    local section = setmetatable({
        _kind = "Section",
        _destroyed = false,
        _container = container,
        _header = header,
        _arrow = arrow,
        _group = group,
        _content = content,
        _connections = {},
        _layout = contentLayout,
        _optionByName = {},
        _sectionLayout = sectionLayout,
        _expandedHeight = 0,
        _nextOptionOrder = 0,
        _animationSerial = 0,
        DisplayName = sectionDisplayName,
        Expanded = initiallyExpanded ~= false,
        Name = sectionConfig.Name,
        Options = {},
        Tab = self,
    }, SectionMethods)

    local containerRefreshQueued = false
    section._refreshContainer = function()
        if containerRefreshQueued or section._destroyed then
            return
        end
        containerRefreshQueued = true
        task.defer(function()
            containerRefreshQueued = false
            if section._destroyed then
                return
            end
            local measuredHeight = math.max(
                0,
                math.ceil(sectionLayout.AbsoluteContentSize.Y)
            )
            local summedHeight = 0
            local visibleCount = 0
            for _, child in ipairs(container:GetChildren()) do
                if child:IsA("GuiObject") and child.Visible then
                    visibleCount = visibleCount + 1
                    summedHeight = summedHeight + math.max(
                        0,
                        child.AbsoluteSize.Y
                    )
                end
            end
            if visibleCount > 1 then
                summedHeight = summedHeight
                    + (visibleCount - 1)
                        * (
                            sectionLayout.Padding.Offset
                            + sectionLayout.Padding.Scale
                                * container.AbsoluteSize.Y
                        )
            end
            local sectionHeight = math.max(
                measuredHeight,
                math.ceil(summedHeight)
            )
            container.Size = UDim2.new(1, 0, 0, sectionHeight)
            self._updateCanvas()
        end)
    end

    
    
    
    local heightRefreshQueued = false
    local heightRefreshAgain = false
    section._measureExpandedHeight = function()
        local measuredHeight = math.max(
            0,
            math.ceil(contentLayout.AbsoluteContentSize.Y)
        )
        local summedHeight = 0
        local visibleCount = 0
        for _, child in ipairs(content:GetChildren()) do
            if child:IsA("GuiObject") and child.Visible then
                visibleCount = visibleCount + 1
                local childHeight = child.AbsoluteSize.Y
                if childHeight <= 0 then
                    childHeight = math.max(0, child.Size.Y.Offset)
                end
                summedHeight = summedHeight + childHeight
            end
        end
        if visibleCount > 1 then
            summedHeight = summedHeight
                + (visibleCount - 1)
                    * (
                        contentLayout.Padding.Offset
                        + contentLayout.Padding.Scale
                            * content.AbsoluteSize.Y
                    )
        end
        section._expandedHeight = math.max(
            measuredHeight,
            math.ceil(summedHeight)
        )
        return section._expandedHeight
    end

    local function applyMeasuredHeight()
        section._measureExpandedHeight()
        content.Size = UDim2.new(
            1,
            0,
            0,
            math.max(section._expandedHeight, 1)
        )
        if not section._heightTween then
            group.Size = UDim2.new(
                1,
                0,
                0,
                section.Expanded and section._expandedHeight or 0
            )
            group.Visible = section.Expanded
            group.ClipsDescendants = not section.Expanded
        end
        section._refreshContainer()
    end

    section._refreshHeight = function()
        if section._destroyed then
            return
        end
        if heightRefreshQueued then
            heightRefreshAgain = true
            return
        end
        heightRefreshQueued = true
        task.defer(function()
            if section._destroyed then
                heightRefreshQueued = false
                return
            end
            
            
            
            
            if Runtime.windowAnimating then
                heightRefreshQueued = false
                task.delay(0.12, section._refreshHeight)
                return
            end
            
            
            if not section.Tab.Page.Visible then
                heightRefreshQueued = false
                return
            end
            applyMeasuredHeight()
            heightRefreshQueued = false
            if heightRefreshAgain then
                heightRefreshAgain = false
                section._refreshHeight()
            end
        end)
    end

    
    section._refreshLayout = function()
        if section._destroyed then
            return
        end
        updateHeaderHeight(true)
        for _, updater in ipairs(section._rowUpdaters or {}) do
            updater(true)
        end
        applyMeasuredHeight()
        section._refreshContainer()
    end

    local stabilizationSerial = 0
    local stabilizationRunning = false
    section._stabilizeLayout = function()
        stabilizationSerial = stabilizationSerial + 1
        if stabilizationRunning then
            return
        end
        stabilizationRunning = true
        task.spawn(function()
            local observedSerial = -1
            local quietFrames = 0
            while quietFrames < 2 and not section._destroyed do
                RunService.Heartbeat:Wait()
                applyMeasuredHeight()
                if observedSerial == stabilizationSerial then
                    quietFrames = quietFrames + 1
                else
                    observedSerial = stabilizationSerial
                    quietFrames = 0
                end
            end
            stabilizationRunning = false
            if not section._destroyed
                and observedSerial ~= stabilizationSerial
            then
                section._stabilizeLayout()
            end
        end)
    end

    table.insert(section._connections, contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        section._refreshHeight
    ))
    table.insert(section._connections, self.Page:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        section._refreshHeight
    ))
    table.insert(section._connections, self.Page:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        updateHeaderHeight
    ))
    table.insert(section._connections, container:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        updateHeaderHeight
    ))
    table.insert(section._connections, sectionLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        section._refreshContainer
    ))
    table.insert(section._connections, header:GetPropertyChangedSignal("AbsoluteSize"):Connect(
        section._refreshContainer
    ))
    table.insert(section._connections, connectSafeActivation(headerButton, function()
        ApiImpl[88](section)
    end))

    table.insert(self.Sections, section)
    self._sectionByName[section.Name] = section
    updateHeaderHeight()
    ApiImpl[87](section, section.Expanded, false)
    task.defer(updateHeaderHeight)
    task.defer(section._refreshHeight)
    task.defer(section._refreshContainer)
    return section
end


ApiImpl[91] = function(self)
    assertObject(self, "Tab")
    ApiImpl[94](self.Window, self)
    return self
end

ApiImpl[92] = function(self)
    assertObject(self, "Tab")
    assert(
        self ~= self.Window.DefaultTab,
        "Khong the xoa DefaultTab; UI luon phai co it nhat 1 tab"
    )
    self._destroyed = true
    for index = #self.Sections, 1, -1 do
        local section = self.Sections[index]
        if section and not section._destroyed then
            ApiImpl[89](section)
        end
    end
    self.Page:Destroy()
    self.Button:Destroy()

    for index, tab in ipairs(self.Window.Tabs) do
        if tab == self then
            table.remove(self.Window.Tabs, index)
            break
        end
    end
    self.Window._tabByName[self.Name] = nil

    if self.Window.SelectedTab == self then
        ApiImpl[94](self.Window, self.Window.DefaultTab)
    end
    ApiImpl[93](self.Window)
end

ApiImpl[93] = function(self)
    assertObject(self, "Window")
    local count = #self.Tabs
    if count == 0 then
        return
    end
    
    
    local scale = ContentScale.Y
    
    for _, column in pairs(TabColumns) do
        local columnTabs = {}
        for _, tab in ipairs(self.Tabs) do
            if tab.Column == column then
                table.insert(columnTabs, tab)
            end
        end
        local columnCount = #columnTabs
        if columnCount > 0 then
            local gapRatio = column.GapRatio or TAB_LAYOUT.GapRatio
            local fittedHeight = TAB_LAYOUT.Span
                * scale
                / (
                    columnCount
                    + math.max(columnCount - 1, 0) * gapRatio
                )
            local tabHeight = math.min(
                TAB_LAYOUT.NormalHeight,
                fittedHeight
            ) / scale
            column.Layout.Padding = UDim.new(
                tabHeight * gapRatio,
                0
            )
            for index, tab in ipairs(columnTabs) do
                tab.Button.LayoutOrder = index
                tab.Button.Size = UDim2.new(1, 0, tabHeight, 0)
            end
        end
    end
end

local function setTabSelected(tab, selected)
    tab.Button:SetAttribute("MikotohSelected", selected)
    if Runtime.themeTabChanged then Runtime.themeTabChanged(tab.Button) end
    tab.Page.Visible = selected
    local base = tab.Button:FindFirstChild("Main")
    if base then
        TweenService:Create(
            base,
            TweenInfo.new(
                0.14,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 = Runtime.themeColor and Runtime.themeColor(selected
                and Color3.fromRGB(255,54,54) or Color3.fromRGB(175,0,0))
                or (selected and Color3.fromRGB(255,54,54) or Color3.fromRGB(175,0,0)),
            }
        ):Play()
    end
end

ApiImpl[94] = function(self, tabOrName)
    assertObject(self, "Window")
    local tab = tabOrName
    if type(tabOrName) == "string" then
        tab = self._tabByName[tabOrName]
    end
    assertObject(tab, "Tab")
    assert(tab.Window == self, "Tab nay khong thuoc Window hien tai")

    closeActiveDropdown()
    for _, candidate in ipairs(self.Tabs) do
        setTabSelected(candidate, candidate == tab)
    end
    self.SelectedTab = tab
    Protected[2](tab)
    task.defer(function()
        for _, section in ipairs(tab.Sections) do
            if section._refreshLayout then
                section._refreshLayout()
            end
        end
        tab._updateCanvas()
    end)
    return tab
end

ApiImpl[95] = function(self, config)
    assertObject(self, "Window")
    local tabConfig = normalizeConfig(config, "Tab")
    assert(
        not self._tabByName[tabConfig.Name],
        ("Tab '%s' da ton tai"):format(tabConfig.Name)
    )

    local page
    if #self.Tabs == 0 then
        page = objects.obj25
    else
        page = Instance.new("ScrollingFrame")
        page.Parent = mainFrame
    end
    local _, updateCanvas = Protected[3](page, tabConfig.Name)
    if not page.Parent then
        page.Parent = mainFrame
    end

    
    local side = tostring(tabConfig.Side or "Left")
    local column = TabColumns[side] or TabColumns.Left
    local tabDisplayName = tostring(tabConfig.DisplayName or tabConfig.Name)
    local button = createRebirthStyleButton(
        column.Frame,
        tabDisplayName,
        #self.Tabs + 1
    )

    local tab = setmetatable({
        _kind = "Tab",
        _destroyed = false,
        _nextSectionOrder = 0,
        _sectionByName = {},
        _updateCanvas = updateCanvas,
        Button = button,
        Column = column,
        DisplayName = tabDisplayName,
        Name = tabConfig.Name,
        Page = page,
        SectionsExpanded = tabConfig.SectionsExpanded ~= false,
        Side = (column == TabColumns.Right) and "Right" or "Left",
        Sections = {},
        Window = self,
    }, TabMethods)

    tab._applySearch = Protected[4](tab)
    tab._searchQuery = ""

    table.insert(self.Tabs, tab)
    self._tabByName[tab.Name] = tab
    connectSafeActivation(button, function()
        ApiImpl[94](self, tab)
    end)

    ApiImpl[93](self)
    if not self.SelectedTab then
        ApiImpl[94](self, tab)
    else
        setTabSelected(tab, false)
    end
    return tab
end


ApiImpl[96] = function(self, name)
    assertObject(self, "Window")
    return self._tabByName[name]
end

ApiImpl[97] = function(self)
    assertObject(self, "Window")
    return self.DefaultTab
end

ApiImpl[98] = function(self, config)
    assertObject(self, "Window")
    local stateConfig = normalizeConfig(config, "State")
    assert(
        not self._stateByName[stateConfig.Name],
        ("State '%s' da ton tai"):format(stateConfig.Name)
    )
    if stateConfig.Default == nil then
        stateConfig.Default = false
    end
    local state = createStateObject(self, stateConfig, true)
    table.insert(self.States, state)
    self._stateByName[state.Name] = state
    return state
end

ApiImpl[99] = function(self, name)
    assertObject(self, "Window")
    return self._stateByName[tostring(name)]
end

ApiImpl[100] = function(self, config)
    assertObject(self, "Window")
    local groupConfig = normalizeConfig(config or {
        Name = "Exclusive Group " .. tostring(#self.ExclusiveGroups + 1),
    }, "Exclusive Group")
    assert(
        not self._exclusiveGroupByName[groupConfig.Name],
        ("ExclusiveGroup '%s' da ton tai"):format(groupConfig.Name)
    )
    local maximum = math.max(
        1,
        math.floor(tonumber(groupConfig.MaxActive) or 1)
    )
    local defaultMinimum = groupConfig.AllowNone == false and 1 or 0
    local minimum = math.clamp(
        math.floor(tonumber(groupConfig.MinActive) or defaultMinimum),
        0,
        maximum
    )
    local group = setmetatable({
        _kind = "ExclusiveGroup",
        _destroyed = false,
        _activationOrder = setmetatable({}, { __mode = "k" }),
        _members = setmetatable({}, { __mode = "k" }),
        _nextActivationOrder = 0,
        AllowNone = minimum == 0,
        MaxActive = maximum,
        MinActive = minimum,
        Name = groupConfig.Name,
        Window = self,
    }, ExclusiveGroupMethods)
    table.insert(self.ExclusiveGroups, group)
    self._exclusiveGroupByName[group.Name] = group
    if type(groupConfig.Members) == "table" then
        for _, member in ipairs(groupConfig.Members) do
            ApiImpl[19](group, member)
        end
    end
    return group
end

ApiImpl[101] = function(self, name)
    assertObject(self, "Window")
    return self._exclusiveGroupByName[tostring(name)]
end





ApiImpl[102] = function(self)
    assertObject(self, "Window")
    playOpenAnimation(function()
        if self._destroyed or not Runtime.chilliIsOpen then
            return
        end
        local tab = self.SelectedTab
        if tab and not tab._destroyed then
            
            for _, section in ipairs(tab.Sections) do
                if section._refreshLayout then
                    section._refreshLayout()
                end
            end
            tab._updateCanvas()
        end
    end)
    return self
end

ApiImpl[103] = function(self)
    assertObject(self, "Window")
    closeActiveDropdown()
    playCloseAnimation()
    return self
end

ApiImpl[104] = function(self)
    assertObject(self, "Window")
    if Runtime.chilliIsOpen then
        return ApiImpl[103](self)
    end
    return ApiImpl[102](self)
end

do
    local function paragraphMethod(index, methodName, returnsValue)
        ApiImpl[index] = function(self, ...)
            assertObject(self, "Option")
            local method = self._controller[methodName]
            assert(
                method,
                ("%s does not support %s()"):format(self.Type, methodName)
            )
            if returnsValue then
                return method(...)
            end
            method(...)
            return self
        end
    end

    paragraphMethod(107, "SetTitle", false)
    paragraphMethod(108, "GetTitle", true)
    paragraphMethod(109, "SetStyle", false)
    paragraphMethod(110, "GetStyle", true)
    paragraphMethod(111, "SetHeader", false)
    paragraphMethod(112, "SetItems", false)
    paragraphMethod(113, "SetGroups", false)
    paragraphMethod(114, "AppendItem", false)
    paragraphMethod(115, "SetSearchEnabled", false)
    paragraphMethod(116, "SetSearchQuery", false)
    paragraphMethod(117, "GetSearchQuery", true)
    paragraphMethod(118, "SetSpotlight", false)
    paragraphMethod(119, "SetSelected", false)
    paragraphMethod(120, "GetSelected", true)
    paragraphMethod(121, "GetSurface", true)
end

do
    local surfaceNames = {
        "Root", "Scroll", "Plate", "Unit", "Width", "TextSize", "LineHeight", "Font",
        "Query", "Metrics", "SetContentHeight", "SetContentLines", "Invalidate", "Clear",
        "OnResize", "SetStyle", "GetStyle", "SetTitle", "SetSearchEnabled", "SetSearchQuery",
        "Attach", "Frame", "Text", "Button", "Image", "Model", "Bar", "Dock", "SetDock",
    }
    for offset, methodName in ipairs(surfaceNames) do
        ApiImpl[121 + offset] = function(self, ...)
            local impl = type(self) == "table" and self._impl or nil
            assert(impl, ("%s() requires a surface"):format(methodName))
            local method = impl[methodName]
            assert(method, ("surface does not support %s()"):format(methodName))
            local result = method(...)
            if result == nil then
                return self
            end
            return result
        end
    end
end

local ChilliLibrary = {
    NoStateChange = STATE_NO_CHANGE,
    Version = "4.4.0",
    SplitDefaultsApi = "manual-defaults-v1",
}

ChilliLibrary.Rich = {
    Bullet = utf8.char(0x2022),
}

function ChilliLibrary.Rich.Escape(text)
    return (string.gsub(tostring(text), "[<>&]", {
        ["<"] = "&lt;",
        [">"] = "&gt;",
        ["&"] = "&amp;",
    }))
end

function ChilliLibrary.Rich.Color(color, text)
    local hex = typeof(color) == "Color3" and ("#" .. color:ToHex()) or tostring(color)
    return string.format('<font color="%s">%s</font>', hex, tostring(text))
end

function ChilliLibrary.Rich.Bold(text)
    return "<b>" .. tostring(text) .. "</b>"
end

function ChilliLibrary.Rich.Italic(text)
    return "<i>" .. tostring(text) .. "</i>"
end

function ChilliLibrary.Rich.Muted(text)
    return ChilliLibrary.Rich.Color("#AAAAAA", text)
end

function ChilliLibrary.Rich.Rule(count)
    return ChilliLibrary.Rich.Color("#444455", string.rep(utf8.char(0x2500), tonumber(count) or 38))
end

function ChilliLibrary.Rich.Join(lines)
    return table.concat(lines, "\n")
end


ApiImpl[105] = function(self)
    assertObject(self, "Window")
    closeActiveDropdown()

    for index = #self.Tabs, 1, -1 do
        local tab = self.Tabs[index]
        if tab ~= self.DefaultTab and not tab._destroyed then
            ApiImpl[92](tab)
        end
    end
    if self.DefaultTab and not self.DefaultTab._destroyed then
        for index = #self.DefaultTab.Sections, 1, -1 do
            local section = self.DefaultTab.Sections[index]
            if not section._destroyed then
                ApiImpl[89](section)
            end
        end
        self.DefaultTab._destroyed = true
    end

    for index = #self.ExclusiveGroups, 1, -1 do
        local group = self.ExclusiveGroups[index]
        if not group._destroyed then
            ApiImpl[28](group)
        end
    end

    local states = {}
    for state in pairs(self._stateObjects) do
        table.insert(states, state)
    end
    for _, state in ipairs(states) do
        if not state._destroyed then
            ApiImpl[13](state)
        end
    end

    self._destroyed = true
    ChilliLibrary.Window = nil
    ContentScale.ReflowTabs = nil
    hudAnimationSerial = hudAnimationSerial + 1
    cancelHudTween()
    if Runtime.windowDragController then
        Runtime.windowDragController.Cancel()
    end
    cancelWindowTween()
    if leftCenterFrame and leftCenterFrame.Parent then
        leftCenterFrame.Position = hudRestorePosition
        leftCenterFrame.Visible = true
    end
    if sourceLeftCenterScreen and sourceLeftCenterScreen.Parent then
        sourceLeftCenterScreen.Enabled = true
    end
    launcherGui:SetAttribute("HudRestorePosition", nil)
    launcherGui:SetAttribute("LeftCenterHiddenByLibrary", nil)
    launcherGui:SetAttribute("LeftCenterScreenDisabledByLibrary", nil)
    disconnectRootConnections()
    disconnectSourceConnections()
    if rootGui.Parent then
        rootGui:Destroy()
    end
    if launcherGui.Parent then
        launcherGui:Destroy()
    end
end

ApiImpl[106] = function(self, config)
    assert(not self.Window, "ChilliLibrary chi quan ly 1 Window cho UI nay")
    local windowConfig = normalizeConfig(config or {
        Name = "MIKOTOH",
    }, "MIKOTOH")
    local window = setmetatable({
        _kind = "Window",
        _destroyed = false,
        _exclusiveGroupByName = {},
        _stateObjects = setmetatable({}, { __mode = "k" }),
        _stateByName = {},
        _tabByName = {},
        ExclusiveGroups = {},
        Name = windowConfig.Name,
        SelectedTab = nil,
        States = {},
        Tabs = {},
    }, WindowMethods)

    self.Window = window
    ContentScale.ReflowTabs = function()
        if not window._destroyed then
            ApiImpl[93](window)
        end
    end
    window.DefaultTab = ApiImpl[95](window,
        tostring(windowConfig.DefaultTab or "Main")
    )
    return window
end








-- Standalone bindings for the visual and state implementations above.
do
    local function bind(target, names, first)
        for offset, name in ipairs(names) do target[name] = ApiImpl[first + offset - 1] end
    end
    bind(StateMethods, {"Get","Set","Subscribe","Link","LinkWhenTrue","LinkWhenFalse","LinkWhen","LinkMany","LinkManyWhenTrue","Invert","Bind","Destroy"}, 2)
    bind(ExclusiveGroupMethods, {"Add","Remove","AddMany","Activate","GetActive","GetLimits","SetMaxActive","SetMinActive","SetAllowNone","Destroy"}, 19)
    bind(OptionMethods, {"Get","Set","GetState","BindState","ShareState","Link","LinkWhenTrue","LinkWhenFalse","LinkWhen","LinkMany","LinkManyWhenTrue","Invert","Bind","AddToExclusiveGroup"}, 29)
    bind(OptionMethods, {"SetVisible","IsVisible","ShowWhen","SubOf","GetSubOptions","AddSubOptions","ShowOptions","GetNote","SetNote","SetOptions","GetRange","SetRange","SetMin","SetMax","GetDecimals","SetDecimals","SetIncrement","GetUnit","SetUnit","SetUnits","SetUnitEnabled","SetUnitSelectorEnabled","SetUnitFormat","SetUnitCallback","SetValueFormat","SetValueParse","GetValueColors","SetValueColors","SetValueColorEnabled","GetQuickPath","GetQuickName","SetQuickName","GetKeybindGroup","SetKeybindGroup","IsQuickEnabled","SetQuickEnabled","Press","Apply","SetHint","SetActionText","Destroy"}, 45)
    bind(SectionMethods, {"CreateFeature","SetExpanded","Toggle","Destroy"}, 86)
    bind(TabMethods, {"CreateSection","Select","Destroy"}, 90)
    bind(WindowMethods, {"ReflowTabs","SelectTab","CreateTab","GetTab","GetDefaultTab","CreateState","GetState","CreateExclusiveGroup","GetExclusiveGroup","Open","Close","ToggleVisible","Destroy"}, 93)
    ChilliLibrary.CreateWindow = ApiImpl[106]
    bind(OptionMethods, {"SetTitle","GetTitle","SetStyle","GetStyle","SetHeader","SetItems","SetGroups","AppendItem","SetSearchEnabled","SetSearchQuery","GetSearchQuery","SetSpotlight","SetSelected","GetSelected","GetSurface"}, 107)
    bind(SurfaceMethods, {"Root","Scroll","Plate","Unit","Width","TextSize","LineHeight","Font","Query","Metrics","SetContentHeight","SetContentLines","Invalidate","Clear","OnResize","SetStyle","GetStyle","SetTitle","SetSearchEnabled","SetSearchQuery","Attach","Frame","Text","Button","Image","Model","Bar","Dock","SetDock"}, 122)
    StateMethods.TwoWay = StateMethods.Bind
    StateMethods.LinkInverse = StateMethods.Invert
    OptionMethods.TwoWay = OptionMethods.Bind
    OptionMethods.LinkTo = OptionMethods.ShareState
    OptionMethods.LinkInverse = OptionMethods.Invert
    OptionMethods.GetValue = OptionMethods.Get
    OptionMethods.SetValue = OptionMethods.Set
    SectionMethods.SetOpen = SectionMethods.SetExpanded
    function WindowMethods:SetVisible(visible) return visible and self:Open() or self:Close() end
    function WindowMethods:IsOpen() return not self._destroyed and Runtime.chilliIsOpen end
    function WindowMethods:Finalize() self:Open(); return self end
    function ChilliLibrary:Finalize() if self.Window then self.Window:Finalize() end; return self end
    local names = {"Button","Dropdown","MultiDropdown","ActionDropdown","MultiActionDropdown","Input","Text","Slider","Toggle","Paragraph","Canvas","TextSlider"}
    local aliases = {label="text",switch="toggle",slidebar="slider",namedslider="textslider"}
    Runtime[101] = function(name)
        local key = tostring(name):lower():gsub("[%s_%-]", ""):gsub("^create", "")
        key = aliases[key] or key
        for index, value in ipairs(names) do
            if value:lower() == key then return index, value:lower() end
        end
        error("Componente desconhecido: " .. tostring(name), 2)
    end
    for _, name in ipairs(names) do
        SectionMethods["Create" .. name] = function(self, settings) return self:CreateFeature(name, settings) end
        TabMethods["Create" .. name] = function(self, settings)
            if not self._implicitSection or self._implicitSection._destroyed then
                self._implicitSection = self:CreateSection({Name="Controles"})
            end
            return self._implicitSection["Create" .. name](self._implicitSection, settings)
        end
        WindowMethods["Create" .. name] = function(self, settings)
            return self.DefaultTab["Create" .. name](self.DefaultTab, settings)
        end
    end
    for _, methods in ipairs({SectionMethods,TabMethods,WindowMethods}) do
        methods.CreateLabel = methods.CreateText
        methods.CreateNamedSlider = methods.CreateTextSlider
        methods.CreateSwitch = methods.CreateToggle
        methods.CreateSlidebar = methods.CreateSlider
    end
    for _, name in ipairs({"Root","Scroll","Plate","Unit","Width","TextSize","LineHeight","Font","Query","Metrics","SetContentHeight","SetContentLines","Invalidate","Clear","OnResize","Attach","Frame","Text","Button","Image","Model","Bar","Dock","SetDock"}) do
        OptionMethods[name] = function(self, ...) return self:GetSurface()[name](self:GetSurface(), ...) end
    end
end

Protected[1] = function(section, row)
    local alive = true
    local connections = {}
    local function refresh(force)
        if not alive or section._destroyed or not row.Parent then return false end
        if not force and Runtime.windowAnimating then return end
        local constraint = row:FindFirstChildOfClass("UIAspectRatioConstraint")
        local aspect = row:GetAttribute("ChilliResponsiveAspect") or (constraint and constraint.AspectRatio)
        -- Dropdowns, paragraphs and canvas calculate their own expanded height.
        if not aspect then return end
        local width = row.Parent.AbsoluteSize.X
        if width <= 0 then width = section._content.AbsoluteSize.X end
        if width <= 0 then width = section.Tab.Page.AbsoluteSize.X end
        if width <= 0 then return end
        local scale = RESIZE_KEEPS_OPTION_WIDTH and ROW_WIDTH_SCALE / ContentScale.X or ROW_WIDTH_SCALE
        row.Size = UDim2.new(scale, 0, 0, math.max(1, math.floor(width * scale / aspect + 0.5)))
        section._refreshHeight()
    end
    table.insert(connections, section._content:GetPropertyChangedSignal("AbsoluteSize"):Connect(refresh))
    table.insert(connections, row:GetAttributeChangedSignal("ChilliResponsiveAspect"):Connect(refresh))
    section._rowUpdaters = section._rowUpdaters or {}
    table.insert(section._rowUpdaters, refresh)
    ContentScale.OnChanged(function() return refresh(true) end)
    refresh(true)
    return function()
        alive = false
        for _, connection in ipairs(connections) do connection:Disconnect() end
        for index, updater in ipairs(section._rowUpdaters) do
            if updater == refresh then table.remove(section._rowUpdaters, index); break end
        end
    end
end

Protected[2] = function(tab)
    tab.Window.Page = tab.Page
    tab.Window.Content = tab.Page
    if tab._applySearch then tab._applySearch(tab._searchQuery or "") end
end

Protected[3] = function(page, name)
    local template = objects.obj25
    for _, property in ipairs({"AnchorPoint","Position","Size","BackgroundColor3","BackgroundTransparency","BorderSizePixel","ClipsDescendants","ZIndex","ScrollBarThickness","ScrollBarImageColor3","ScrollBarImageTransparency","VerticalScrollBarInset","HorizontalScrollBarInset"}) do
        page[property] = Runtime.originalProperty and Runtime.originalProperty(template,property) or template[property]
    end
    page.Name = name .. "Page"
    page.Active = true
    page.CanvasPosition = Vector2.new(0,0)
    page.ScrollingDirection = Enum.ScrollingDirection.Y
    page.AutomaticCanvasSize = Enum.AutomaticSize.None
    local layout = Instance.new("UIListLayout")
    layout.Name = "PageLayout"
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Padding = UDim.new(0, 4)
    layout.Parent = page
    local function updateCanvas()
        if not page.Parent then return end
        local total, count = 0, 0
        for _, child in ipairs(page:GetChildren()) do
            if child:IsA("GuiObject") and child.Visible then
                total += math.max(child.AbsoluteSize.Y, child.Size.Y.Offset)
                count += 1
            end
        end
        page.CanvasSize = UDim2.fromOffset(0, math.ceil(math.max(layout.AbsoluteContentSize.Y, total + math.max(0,count-1)*4)) + 8)
    end
    trackRootConnection(layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas))
    trackRootConnection(page:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvas))
    return layout, updateCanvas
end

Protected[4] = function(tab)
    return function(query)
        query = tostring(query or ""):lower()
        tab._searchQuery = query
        for _, section in ipairs(tab.Sections) do
            local sectionMatch = query == "" or tostring(section.DisplayName):lower():find(query,1,true) ~= nil
            local any = false
            for _, option in ipairs(section.Options) do
                local match = sectionMatch or (tostring(option.DisplayName or option.Name) .. " " .. tostring(option._sourceConfig.Note or option._sourceConfig.Description or "")):lower():find(query,1,true) ~= nil
                local host = option._visibilityHost or option.Instance
                if query == "" then
                    option._preSearchVisible = nil
                    host.Visible = option._resolvedVisible ~= false
                else
                    option._preSearchVisible = option._resolvedVisible ~= false
                    option._searchMatched = match
                    host.Visible = match and option._preSearchVisible
                end
                any = any or host.Visible
            end
            section._container.Visible = query == "" or any or sectionMatch
            section._refreshHeight()
        end
        tab._updateCanvas()
        return tab
    end
end
function TabMethods:SetSearchQuery(query) return self._applySearch(query) end
function TabMethods:GetSearchQuery() return self._searchQuery end
function WindowMethods:SetSearchQuery(query) self.SelectedTab:SetSearchQuery(query); return self end

optionFactories[12] = function(settings)
    local labels = settings.Values or settings.Labels or settings.Options
    assert(type(labels) == "table" and #labels >= 2, "TextSlider precisa de pelo menos dois nomes.")
    labels = table.clone(labels)
    for index, value in ipairs(labels) do labels[index] = tostring(value) end
    local function resolve(value)
        if type(value) == "number" then return math.clamp(math.round(value),1,#labels) end
        for index, name in ipairs(labels) do if name == tostring(value) then return index end end
        error("Nome inexistente no TextSlider: " .. tostring(value),2)
    end
    local spec = copyTable(settings)
    spec.Min, spec.Max, spec.Increment, spec.AllowDecimals = 1, #labels, 1, false
    spec.Default = resolve(settings.Default or labels[1])
    spec.ValueFormat = function(value) return labels[math.clamp(math.round(value),1,#labels)] end
    spec.ValueParse = function(text)
        for index, name in ipairs(labels) do if name:lower() == tostring(text):lower() then return index end end
        return nil
    end
    spec.Callback = function(index) safeCallback(settings.Callback, labels[index], index) end
    local row, controller = createLibrarySliderRow(spec)
    local get, set = controller.GetValue, controller.SetValue
    controller.GetValue = function() return labels[get()] end
    controller.SetValue = function(value, fire) set(resolve(value), fire) end
    controller.GetIndex = get
    controller.SetIndex = function(value, fire) set(resolve(value), fire) end
    controller.GetLabels = function() return table.clone(labels) end
    return row, controller
end
function OptionMethods:GetIndex()
    assert(self._controller.GetIndex, "GetIndex requer TextSlider.")
    return self._controller.GetIndex()
end
function OptionMethods:SetIndex(index, fire) return self:Set(index, fire) end
function OptionMethods:GetLabels()
    assert(self._controller.GetLabels, "GetLabels requer TextSlider.")
    return self._controller.GetLabels()
end

local window = ChilliLibrary:CreateWindow(config)
window.Gui, window.Main, window.Launcher = rootGui, mainFrame, launcherGui
window.Version = "4.4.0"
objects.obj9.Text = window.Name
-- A separate scope prevents the extensions from increasing the constructor's register count.
local function installExtensions()
local rgb = Color3.fromRGB
local themeNames = {"Original","Dark","Rose","Roxo","Verde","VermelhoEscuro","Azul","Preto","Lilas","Dourado","Ciano","Laranja","Turquesa","Magenta","Prata","Ambar","Marinho","Menta"}
-- Each profile specifies its own body, inset, bevel and highlight colors.
-- These are art-directed layer colors, rather than a filter over the whole UI.
local themeProfiles = {
    -- Window, plate, field, lower bevel, header, button top/bottom, fill top/bottom, reflection.
    Dark={"101319","191E27","0D1118","222B37","4A5B70","8293A8","344356","B0C6DF","536F92","E0E9F6"},
    Rose={"190F17","291A23","180F17","542235","BE547F","EFA6C2","973D62","F4A3C4","A74D7A","FFE7F0"},
    Roxo={"140F20","251B35","150F24","39204F","824CCD","BD91F1","61318F","C6A0FA","7847B9","F0E5FF"},
    Verde={"0C1812","17291F","0B1912","17452B","278954","7ED5A1","216D46","73E0A1","33865A","DAF8E8"},
    VermelhoEscuro={"1B0E13","2B161E","1A0D13","3D151F","A93245","DE7C85","772130","ED8995","9E394C","FFE3E7"},
    Azul={"0C1523","18273B","0B1628","1A345B","306AB3","8FC5F4","264E8C","83CCFF","3B7DB6","E1F0FF"},
    Preto={"090A0C","181A1E","0B0C0F","1D1F25","34353B","777A85","24262C","BAC0CC","5A6270","DDDFE5"},
    Lilas={"191421","2B2239","181321","46304F","936CB7","D5B6ED","73508E","D8BEF5","9974BE","F7EDFF"},
    Dourado={"19140B","2C2415","181208","493315","C7983D","F0D49A","946A29","F1CF83","B38936","FFF2CD"},
    Ciano={"0A1920","142D37","091A23","153F50","1E849F","8FE1EF","1F6179","79E2F3","3696B0","DEF9FF"},
    Laranja={"1C130C","2F2117","1B1109","4B2916","B56C28","F4B67E","83401F","FFC087","B76C2B","FFF0DD"},
    Turquesa={"0C1B19","172E2A","0B1B19","1A4039","237E76","89D9C9","225D56","81E5CB","398F7D","E0FFF5"},
    Magenta={"1C0F1B","301D2D","1B0D1A","4B1D3C","BC388C","EE97D6","8D2869","F99ADF","AF488B","FFE4F9"},
    Prata={"12171D","242C34","111820","303D49","677685","C0CEDA","455361","D5E0EC","879BAF","F0F5FC"},
    Ambar={"1B150B","2D2415","1A1309","443015","A87522","F0C576","755025","F3C86B","AA7D2B","FFF2CF"},
    Marinho={"0A1120","152237","091322","132743","24446F","688ABA","1D3455","83ACDF","345F93","DCE8FA"},
    Menta={"101C17","1F3028","0F1D17","2C4939","4C9477","B4E6CE","457D67","B5F1D2","659F81","EDFFF4"},
}
local palettes = {}
local function profileColor(hex)
    return rgb(tonumber(hex:sub(1,2),16),tonumber(hex:sub(3,4),16),tonumber(hex:sub(5,6),16))
end
for name, values in pairs(themeProfiles) do
    local c = {}
    for index, hex in ipairs(values) do c[index] = profileColor(hex) end
    palettes[name] = {
        Window=c[1],Surface=c[2],Field=c[3],BevelBase=c[4],
        HeaderTop=c[5],HeaderBottom=c[5]:Lerp(c[4],0.48),HeaderBase=c[4]:Lerp(c[1],0.30),
        FaceTop=c[6],FaceBottom=c[7],
        EdgeTop=c[6]:Lerp(c[10],0.32),EdgeBottom=c[7]:Lerp(c[4],0.12),
        InnerTop=c[6]:Lerp(c[10],0.08),InnerBottom=c[7]:Lerp(c[4],0.10),
        SelectedTop=c[6]:Lerp(c[10],0.42),SelectedBottom=c[7]:Lerp(c[8],0.20),
        SelectedBase=c[4]:Lerp(c[8],0.25),
        Accent=c[8],AccentBottom=c[9],
        Track=c[3]:Lerp(c[2],0.26),ThumbBase=c[4]:Lerp(c[2],0.32),
        Thumb=c[10]:Lerp(c[6],0.16),Arrow=c[8]:Lerp(c[10],0.20),
        Shadow=c[1]:Lerp(rgb(0,0,0),0.68),Border=c[4]:Lerp(rgb(0,0,0),0.64),
        TextOutlineTop=c[4]:Lerp(c[8],0.08),TextOutlineBottom=c[1]:Lerp(rgb(0,0,0),0.35),
    }
end
local baseline = setmetatable({}, {__mode="k"})
local themeBound = setmetatable({}, {__mode="k"})
local themePainting = setmetatable({}, {__mode="k"})
local themeQueued = setmetatable({}, {__mode="k"})
local textOverrides = setmetatable({}, {__mode="k"})
local textBound = setmetatable({}, {__mode="k"})
local textPainting = setmetatable({}, {__mode="k"})
local colorRules = {}
local textStyle = {Font=normalTextFont, Color=shinyTextGradient, Rotation=90}
local styledRoots = {rootGui,launcherGui}
local styledRootConnections = setmetatable({}, {__mode="k"})
local referenceTextStyles = setmetatable({}, {__mode="k"})
local globalTextColor,globalTextFont = false,false
local function isText(instance)
    return instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox")
end
local function color(value)
    if typeof(value) == "Color3" or typeof(value) == "ColorSequence" then return value end
    if type(value) == "string" then
        local hex = value:gsub("^#", "")
        if #hex == 3 then hex = hex:sub(1,1):rep(2)..hex:sub(2,2):rep(2)..hex:sub(3,3):rep(2) end
        assert(#hex == 6 and hex:match("^%x+$"), "Use uma cor #RRGGBB ou #RGB.")
        return rgb(tonumber(hex:sub(1,2),16),tonumber(hex:sub(3,4),16),tonumber(hex:sub(5,6),16))
    end
    if type(value) == "table" then
        if #value == 3 and type(value[1]) == "number" then return rgb(value[1],value[2],value[3]) end
        assert(#value >= 2, "Um gradiente precisa de pelo menos duas cores.")
        local points = {}
        for index, entry in ipairs(value) do
            local point = type(entry) == "table" and entry.Color and entry or nil
            local c = color(point and point.Color or entry)
            assert(typeof(c) == "Color3", "Cada parada deve conter uma cor simples.")
            points[index] = ColorSequenceKeypoint.new(point and point.Time or (index-1)/(#value-1), c)
        end
        return ColorSequence.new(points)
    end
    error("Cor invalida: use Color3, ColorSequence, hexadecimal ou uma lista.",2)
end
local function sequence(value)
    value = color(value)
    return typeof(value) == "ColorSequence" and value or ColorSequence.new(value,value)
end
local function textSequence(value)
    value = color(value)
    if typeof(value) == "ColorSequence" then return value end
    -- Tint the reference shine, retaining its exact highlight break.
    local points = {}
    for index, point in ipairs(shinyTextGradient.Keypoints) do
        points[index] = ColorSequenceKeypoint.new(point.Time,
            Color3.new(value.R*point.Value.R,value.G*point.Value.G,value.B*point.Value.B))
    end
    return ColorSequence.new(points)
end
local function gradient(instance)
    local result = instance:FindFirstChildOfClass("UIGradient")
    if not result then
        result = Instance.new("UIGradient")
        result.Name = "MikotohStaticColor"
        result.Parent = instance
    end
    return result
end
local function bevelOwner(instance)
    local current = instance
    while current and current ~= mainFrame and current ~= rootGui and current ~= launcherGui do
        if current == closeButton or current == chilliButton then return current end
        if current:IsA("GuiButton") then
            local base = current:FindFirstChild("Main")
            if base and base:FindFirstChild("ColorFrame") then return current end
        end
        current = current.Parent
    end
end
local function luminance(value) return value.R*0.2126+value.G*0.7152+value.B*0.0722 end
local function layerSequence(original, light, dark)
    local minimum, maximum = 1, 0
    for _, point in ipairs(original.Keypoints) do
        local brightness = luminance(point.Value)
        minimum, maximum = math.min(minimum,brightness),math.max(maximum,brightness)
    end
    local points = {}
    for index, point in ipairs(original.Keypoints) do
        local blend = maximum-minimum > 0.00001 and (luminance(point.Value)-minimum)/(maximum-minimum) or (1-point.Time)
        points[index] = ColorSequenceKeypoint.new(point.Time,dark:Lerp(light,blend))
    end
    return ColorSequence.new(points)
end
local function mapSequence(instance, original, palette)
    local parent = instance.Parent
    local role = parent:GetAttribute("MikotohColorRole")
    if role == "GuardCard" then return layerSequence(original,palette.Surface,palette.Window) end
    if role == "GuardTitle" or role == "GuardSwitchOn" then return layerSequence(original,palette.Accent,palette.AccentBottom) end
    if role == "GuardSwitchOff" then return layerSequence(original,palette.Track,palette.Track) end
    if role == "GuardOutline" then
        if #original.Keypoints==2 and original.Keypoints[1].Value==original.Keypoints[2].Value then return ColorSequence.new(palette.Border,palette.Border) end
        return layerSequence(original,palette.Accent,palette.Border)
    end
    if role == "PanelHeader" then return layerSequence(original,palette.HeaderTop,palette.HeaderBottom) end
    if role == "PanelAction" or role == "PanelPriority" then return layerSequence(original,palette.Accent,palette.AccentBottom) end
    if role == "PanelHud" then return layerSequence(original,palette.FaceTop,palette.FaceBottom) end
    if role == "PanelCancel" or role == "PanelQueued" then return layerSequence(original,palette.InnerTop,palette.InnerBottom) end
    if role == "PanelSurface" then return layerSequence(original,palette.Surface,palette.Window) end
    if parent:IsA("UIStroke") then
        return layerSequence(original,palette.TextOutlineTop,palette.TextOutlineBottom)
    end
    if parent == objects.obj6 then return layerSequence(original,palette.HeaderTop,palette.HeaderBottom) end
    if parent.Name == "FreeLauncher" then return layerSequence(original,palette.FaceTop,palette.FaceBottom) end
    if instance.Name == "OFF" then return ColorSequence.new(palette.Track) end
    if instance.Name == "ON" or instance.Name == "AccentGradient" or parent.Name == "Bar" or parent.Name == "Fill" then
        return layerSequence(original,palette.Accent,palette.AccentBottom)
    end
    if parent.Name == "Arm" and parent.Parent and parent.Parent.Name == "Arrow" then
        -- The section chevron has separate white face and dark outline layers.
        if luminance(original.Keypoints[1].Value) > 0.8 then return original end
        return layerSequence(original,palette.TextOutlineTop,palette.TextOutlineBottom)
    end
    local owner = bevelOwner(parent)
    if owner then
        local selected = owner:GetAttribute("MikotohSelected") == true
        if parent.Name == "Transparent" then
            return layerSequence(original,selected and palette.SelectedTop or palette.InnerTop,
                selected and palette.SelectedBottom or palette.InnerBottom)
        end
        return layerSequence(original,selected and palette.SelectedTop:Lerp(palette.Thumb,0.10) or palette.EdgeTop,
            selected and palette.SelectedBottom or palette.EdgeBottom)
    end
    return layerSequence(original,palette.Accent,palette.AccentBottom)
end
Runtime.themeColor = function(original)
    local palette = palettes[window.Theme]
    if not palette then return original end
    if original == rgb(255,54,54) then return palette.SelectedBase end
    return palette.BevelBase
end
local function themeProperty(instance, property, original, palette)
    if instance:GetAttribute("MikotohKeepColor") then return original end
    if instance:IsA("UIGradient") and instance.Parent and instance.Parent:GetAttribute("MikotohKeepColor") then return original end
    local role = instance:GetAttribute("MikotohColorRole")
    if property == "Color" then
        if instance:IsA("UIGradient") then return mapSequence(instance,original,palette) end
        if instance:IsA("UIStroke") then
            if role == "GuardIconOn" then return palette.Accent end
            if role == "GuardIconOff" then return palette.Track end
            if role == "PanelHighlight" then return palette.EdgeTop end
            if role == "PanelOutline" then return palette.Border end
            if instance:FindFirstChildOfClass("UIGradient") then return rgb(255,255,255) end
            if isText(instance.Parent) then return palette.TextOutlineBottom end
            return bevelOwner(instance.Parent) and palette.Border or palette.Shadow
        end
    elseif property == "ScrollBarImageColor3" then return palette.Accent
    elseif property == "ImageColor3" then
        if role == "PanelSurface" then return instance:FindFirstChildOfClass("UIGradient") and rgb(255,255,255) or palette.Surface end
        -- Preserve asset colors and the original neutral texture overlays.
        return original
    elseif property == "BackgroundColor3" then
        if role == "GuardIcon" then return palette.Field end
        if role == "PanelSurface" and not instance:FindFirstChildOfClass("UIGradient") then return palette.Surface end
        if instance == mainFrame then return palette.Window end
        if instance == topBar then return palette.HeaderBase end
        if instance:FindFirstChildOfClass("UIGradient") and not isText(instance) then
            -- Roblox multiplies UIGradient by the base color: the carrier must stay white.
            return rgb(255,255,255)
        end
        if instance == objects.obj7 or instance == objects.obj18 then return palette.Shadow end
        if instance.Name == "FreeLauncherShadow" then return palette.Shadow end
        local owner = bevelOwner(instance)
        if owner and (instance == owner:FindFirstChild("Main")) then
            return owner:GetAttribute("MikotohSelected") == true and palette.SelectedBase or palette.BevelBase
        end
        if instance.Name == "Hold" then return palette.ThumbBase end
        if instance.Name == "Color" and instance.Parent.Name == "Hold" then return palette.Thumb end
        if instance.Name == "Slider" or instance.Name == "Switch" then return palette.Track end
        if instance.Name == "Arm" then return palette.Arrow end
        if instance.Name == "UnitDivider" or instance.Name == "DockRule" then return palette.Border end
        if instance.Name == "Main" then return palette.Surface end
        if instance.Name == "Dropdown" or instance.Name == "Field" or instance.Name == "Value"
            or instance.Name == "SearchField" or instance.Name == "Menu" or instance.Name == "UnitMenu"
            or instance.Name:match("^Option%d+$") then return palette.Field end
        if instance.BackgroundTransparency == 1 then return original end
        local _, saturation = original:ToHSV()
        return saturation > 0.12 and palette.Accent or palette.Surface
    end
    return original
end
local function paintText(instance)
    if not isText(instance) or (instance:IsA("TextButton") and instance.Text == "") then return end
    if instance:GetAttribute("MikotohShadowText") then return end
    if textPainting[instance] then return end
    textPainting[instance] = true
    local reference = referenceTextStyles[instance]
    local override = textOverrides[instance]
    local style = override or ((reference and not globalTextColor) and reference or textStyle)
    local font = override and override.Font or (globalTextFont and textStyle.Font) or (reference and reference.Font) or textStyle.Font
    if type(font) == "string" then font = Enum.Font[font] end
    if typeof(font) == "EnumItem" then instance.Font = font else instance.FontFace = font end
    local colors = textSequence(style.Color or textStyle.Color)
    if reference and not override and not globalTextColor and palettes[window.Theme] then
        local palette = palettes[window.Theme]
        if reference.Role == "Accent" then colors=layerSequence(colors,palette.Accent,palette.AccentBottom)
        elseif reference.Role == "Hud" then colors=layerSequence(colors,palette.FaceTop,palette.FaceBottom) end
    end
    if style.Plain and not override and not globalTextColor then
        instance.TextColor3=colors.Keypoints[1].Value
        local generated=instance:FindFirstChild("MikotohStaticColor")
        if generated then generated:Destroy() end
    elseif instance:IsA("TextBox") then
        -- UIGradient does not support TextBox. Never hide the native value text.
        instance.TextColor3 = colors.Keypoints[1].Value
        instance.PlaceholderColor3 = colors.Keypoints[1].Value
        instance.TextTransparency = 0
        for _, child in ipairs(instance:GetChildren()) do
            if child:IsA("UIGradient") or child.Name == "MikotohInputText" then child:Destroy() end
        end
    else
        local g = gradient(instance)
        g.Color = colors
        g.Rotation = style.Rotation or textStyle.Rotation
        g.Enabled = true
        g.Transparency = NumberSequence.new(0)
        instance.TextColor3 = rgb(255,255,255)
    end
    textPainting[instance] = nil
    if not textBound[instance] then
        textBound[instance] = true
        for _, property in ipairs(instance:IsA("TextBox") and {"TextColor3","TextTransparency","FontFace"} or {"TextColor3","FontFace"}) do
            trackRootConnection(instance:GetPropertyChangedSignal(property):Connect(function()
                if not window._destroyed and instance.Parent then paintText(instance) end
            end))
        end
    end
end
local function matches(instance, target)
    if typeof(target) == "Instance" then return instance == target end
    if target == "Text" or target == "AllText" then return isText(instance) end
    return instance.Name == target or instance:GetFullName() == target
end
local function paintPart(instance, value, property, rotation)
    local parsed = color(value)
    local colors = sequence(parsed)
    local existing = instance:IsA("UIGradient") and instance or instance:FindFirstChildOfClass("UIGradient")
    if existing and not baseline[existing] then baseline[existing] = {Color=existing.Color} end
    if typeof(parsed) == "Color3" and existing and existing.Name ~= "MikotohStaticColor" then
        local original = baseline[existing] and baseline[existing].Color or existing.Color
        local maximum = 0
        for _, point in ipairs(original.Keypoints) do maximum = math.max(maximum,luminance(point.Value)) end
        local points = {}
        for index, point in ipairs(original.Keypoints) do
            local shade = maximum > 0 and luminance(point.Value)/maximum or 1
            points[index] = ColorSequenceKeypoint.new(point.Time,Color3.new(parsed.R*shade,parsed.G*shade,parsed.B*shade))
        end
        colors = ColorSequence.new(points)
    end
    if isText(instance) and property == "TextColor3" then
        textOverrides[instance] = {Color=color(value),Rotation=rotation or 90}
        paintText(instance)
        return
    end
    if property then
        if typeof(parsed) == "ColorSequence" then
            if property == "TextColor3" then
                textOverrides[instance] = {Color=color(value),Rotation=rotation or 90}
                paintText(instance)
                return
            end
            assert(property == "BackgroundColor3" or property == "ImageColor3" or property == "Color", "Essa propriedade nao aceita gradiente.")
        elseif not existing or (property ~= "BackgroundColor3" and property ~= "Color") then
            instance[property] = parsed
            return
        end
    end
    if isText(instance) and (not property or property == "TextColor3") then
        textOverrides[instance] = {Color=color(value),Rotation=rotation or 90}
        paintText(instance)
    elseif instance:IsA("UIGradient") then
        instance.Color = colors
    else
        local g = gradient(instance)
        g.Color, g.Rotation, g.Enabled = colors, rotation or 90, true
        g.Transparency = NumberSequence.new(0)
        if instance:IsA("UIStroke") then instance.Color = rgb(255,255,255)
        elseif instance:IsA("ImageLabel") or instance:IsA("ImageButton") then instance.ImageColor3 = rgb(255,255,255)
        elseif instance:IsA("GuiObject") then instance.BackgroundColor3 = rgb(255,255,255)
        else error("Esse objeto nao possui uma cor visual editavel.",2) end
    end
end
local function capture(instance)
    if baseline[instance] then return baseline[instance] end
    local saved = {}
    if instance:IsA("UIGradient") then saved.Color = instance.Color
    elseif instance:IsA("UIStroke") then saved.Color = instance.Color end
    if instance:IsA("GuiObject") then saved.BackgroundColor3 = instance.BackgroundColor3 end
    if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then saved.ImageColor3 = instance.ImageColor3 end
    if instance:IsA("ScrollingFrame") then saved.ScrollBarImageColor3 = instance.ScrollBarImageColor3 end
    baseline[instance] = saved
    return saved
end
local function paint(instance)
    if window._destroyed or not instance.Parent then return end
    if themePainting[instance] then return end
    local saved = capture(instance)
    if instance:IsA("UIGradient") and isText(instance.Parent) then
        paintText(instance.Parent)
        if instance.Parent then
            for _, rule in ipairs(colorRules) do
                if matches(instance,rule.Target) then paintPart(instance,rule.Color,rule.Property,rule.Rotation) end
            end
        end
        return
    end
    themePainting[instance] = true
    for property, original in pairs(saved) do
        if instance.Name ~= "MikotohStaticColor" then
            local palette = palettes[window.Theme]
            instance[property] = palette and themeProperty(instance,property,original,palette) or original
        end
    end
    paintText(instance)
    for _, rule in ipairs(colorRules) do
        local match = matches(instance,rule.Target)
            or (rule.Descendants and typeof(rule.Target)=="Instance" and instance:IsDescendantOf(rule.Target))
        if match and (not rule.TextOnly or isText(instance))
            and not (rule.ResetText and not rule.Property and isText(instance)) then
            paintPart(instance,rule.Color,rule.Property,rule.Rotation)
        end
        if instance:IsA("UIGradient") and instance.Parent and not isText(instance.Parent)
            and not rule.TextOnly and matches(instance.Parent,rule.Target)
            and (not rule.Property or rule.Property == "BackgroundColor3" or rule.Property == "Color" or rule.Property == "ImageColor3") then
            paintPart(instance.Parent,rule.Color,rule.Property,rule.Rotation)
        end
    end
    themePainting[instance] = nil
    if not themeBound[instance] then
        themeBound[instance] = true
        for property in pairs(saved) do
            trackRootConnection(instance:GetPropertyChangedSignal(property):Connect(function()
                if themePainting[instance] or themeQueued[instance] or not palettes[window.Theme] then return end
                themeQueued[instance] = true
                task.defer(function()
                    themeQueued[instance] = nil
                    if not window._destroyed and instance.Parent then paint(instance) end
                end)
            end))
        end
    end
end
local function paintTree(container)
    capture(container)
    local children = container:GetDescendants()
    for _, child in ipairs(children) do capture(child) end
    paint(container)
    for _, child in ipairs(children) do paint(child) end
end
Runtime.themeTabChanged = function(button)
    if palettes[window.Theme] then paintTree(button) end
end
Runtime.originalProperty = function(instance,property)
    local saved = baseline[instance]
    return saved and saved[property] or instance[property]
end
function WindowMethods:GetThemes() return table.clone(themeNames) end
function WindowMethods:SetTheme(name)
    assertObject(self,"Window")
    name = tostring(name or "Original")
    local found
    for _, value in ipairs(themeNames) do if value:lower() == name:lower() then found = value; break end end
    if name:lower() == "vermelho" then found = "VermelhoEscuro" end
    assert(found, "Tema desconhecido: " .. name)
    self.Theme = found
    for _, container in ipairs(styledRoots) do paintTree(container) end
    if self.SelectedTab then setTabSelected(self.SelectedTab,true) end
    return self
end
function WindowMethods:SetTextStyle(style)
    assertObject(self,"Window")
    assert(type(style) == "table", "SetTextStyle precisa de uma tabela.")
    if style.Color ~= nil then style = table.clone(style); style.Color = color(style.Color) end
    if style.Font ~= nil then
        assert(typeof(style.Font)=="Font" or typeof(style.Font)=="EnumItem" or type(style.Font)=="string","Fonte invalida.")
    end
    if style.Color ~= nil then globalTextColor=true end
    if style.Font ~= nil then globalTextFont=true end
    for key, value in pairs(style) do textStyle[key] = value end
    for _, container in ipairs(styledRoots) do paintTree(container) end
    return self
end
function WindowMethods:SetTextColor(value) return self:SetTextStyle({Color=value}) end
function WindowMethods:ResetTextStyle()
    assertObject(self,"Window")
    textStyle = {Font=normalTextFont,Color=shinyTextGradient,Rotation=90}
    globalTextColor,globalTextFont=false,false
    table.clear(textOverrides)
    for index=#colorRules,1,-1 do
        local rule = colorRules[index]
        if rule.TextOnly or rule.Property == "TextColor3" or rule.Target == "Text" or rule.Target == "AllText"
            or (typeof(rule.Target) == "Instance" and isText(rule.Target) and not rule.Property) then
            table.remove(colorRules,index)
        else rule.ResetText = true end
    end
    for _, container in ipairs(styledRoots) do paintTree(container) end
    return self
end
function WindowMethods:SetComponentColor(target, value, options)
    assertObject(self,"Window")
    assert(typeof(target) == "Instance" or type(target) == "string", "Alvo deve ser um nome ou Instance.")
    local settings = options or {}
    for index=#colorRules,1,-1 do if colorRules[index].Target == target then table.remove(colorRules,index) end end
    table.insert(colorRules,{Target=target,Color=color(value),Property=settings.Property,Rotation=settings.Rotation,Descendants=settings.Descendants,TextOnly=settings.TextOnly})
    for _, container in ipairs(styledRoots) do paintTree(container) end
    return self
end
function WindowMethods:ResetComponentColor(target)
    assertObject(self,"Window")
    local descendants = false
    for index=#colorRules,1,-1 do
        if colorRules[index].Target == target then
            descendants = descendants or colorRules[index].Descendants
            table.remove(colorRules,index)
        end
    end
    local function selected(instance)
        return matches(instance,target) or (descendants and typeof(target)=="Instance" and instance:IsDescendantOf(target))
    end
    for instance in pairs(textOverrides) do if selected(instance) then textOverrides[instance]=nil end end
    for _, container in ipairs(styledRoots) do
        for _, instance in ipairs(container:GetDescendants()) do
            if selected(instance) then
                local g = instance:FindFirstChild("MikotohStaticColor")
                if g then g:Destroy() end
            end
        end
        paintTree(container)
    end
    return self
end
function WindowMethods:SetColors(settings)
    for target, value in pairs(settings) do self:SetComponentColor(target,value) end
    return self
end
function OptionMethods:SetTextColor(value)
    window:SetComponentColor(self.Instance,value,{Descendants=true,TextOnly=true})
    return self
end
function OptionMethods:ResetTextColor()
    window:ResetComponentColor(self.Instance)
    return self
end
function OptionMethods:SetColor(part, value, options)
    local instance = typeof(part) == "Instance" and part or self.Instance:FindFirstChild(part,true)
    assert(instance, "Parte do controle nao encontrada: " .. tostring(part))
    window:SetComponentColor(instance,value,options)
    return self
end
function OptionMethods:GetParts() return self.Instance:GetDescendants() end
Runtime.optionStyled = function(option,settings)
    if settings.TextColor then option:SetTextColor(settings.TextColor) end
    if settings.Colors then
        for part, value in pairs(settings.Colors) do option:SetColor(part,value) end
    end
end
Runtime.referenceTextStyle = function(instance,settings)
    local g=instance:FindFirstChildOfClass("UIGradient")
    referenceTextStyles[instance]={Font=instance.FontFace,Color=settings and settings.Color or (g and g.Color or instance.TextColor3),
        Rotation=settings and settings.Rotation or (g and g.Rotation or 90),Role=settings and settings.Role,Plain=settings and settings.Plain}
end
Runtime.setReferenceTextColor=function(instance,value,rotation,role)
    if not referenceTextStyles[instance] then Runtime.referenceTextStyle(instance) end
    local reference=referenceTextStyles[instance]
    reference.Color=value;reference.Rotation=rotation;reference.Role=role;paintText(instance)
end
Runtime.paintTree=paintTree
Runtime.setOriginalProperty=function(instance,property,value,paintNow)
    capture(instance)[property]=value
    instance[property]=value
    if paintNow~=false then paint(instance) end
end
Runtime.forgetStyledTree=function(container)
    for index=#colorRules,1,-1 do
        local target=colorRules[index].Target
        if typeof(target)=="Instance" and (target==container or target:IsDescendantOf(container)) then table.remove(colorRules,index) end
    end
end
Runtime.registerStyledRoot=function(container)
    if styledRootConnections[container] then return end
    local present=false
    for _, value in ipairs(styledRoots) do if value==container then present=true;break end end
    if not present then table.insert(styledRoots,container) end
    styledRootConnections[container]=trackRootConnection(container.DescendantAdded:Connect(function(instance)
        task.defer(function() if instance.Parent then paint(instance) end end)
    end))
    paintTree(container)
end
Runtime.unregisterStyledRoot=function(container)
    if styledRootConnections[container] then styledRootConnections[container]:Disconnect();styledRootConnections[container]=nil end
    for index=#styledRoots,1,-1 do if styledRoots[index]==container then table.remove(styledRoots,index) end end
    Runtime.forgetStyledTree(container)
end
for _, container in ipairs(styledRoots) do
    Runtime.registerStyledRoot(container)
end
window:SetTheme(config.Theme or "Original")
if config.TextStyle then window:SetTextStyle(config.TextStyle) end
if config.Colors then window:SetColors(config.Colors) end

-- Shared pointer drag with frame-based easing; no tween is restarted per input event.
do
local function installDrag()
    Runtime.attachSmoothDrag=function(handle,target,space,options)
        options=options or {}
        local connections={}
        local frameConnection
        local active,lastInput,wasDragged,goal
        local dead=false
        local function allowed() return not dead and target.Parent and (not options.CanStart or options.CanStart()) end
        local function pixels()
            local size=space.AbsoluteSize
            local position=target.Position
            return Vector2.new(position.X.Scale*size.X+position.X.Offset,position.Y.Scale*size.Y+position.Y.Offset)
        end
        local function clamp(point)
            local area,size,anchor=space.AbsoluteSize,target.AbsoluteSize,target.AnchorPoint
            local pad=options.Padding or 5
            local left,top=pad+size.X*anchor.X,pad+size.Y*anchor.Y
            local right,bottom=area.X-pad-size.X*(1-anchor.X),area.Y-pad-size.Y*(1-anchor.Y)
            return Vector2.new(math.clamp(point.X,left,math.max(left,right)),math.clamp(point.Y,top,math.max(top,bottom)))
        end
        local function place(point)
            target.Position=UDim2.fromOffset(point.X,point.Y)
            if options.OnMoved then options.OnMoved(target.Position) end
        end
        local function stopFrame()
            if frameConnection then frameConnection:Disconnect();frameConnection=nil end
        end
        local function startFrame()
            if frameConnection then return end
            frameConnection=RunService.RenderStepped:Connect(function(dt)
                if dead or not target.Parent then stopFrame();return end
                if not goal then stopFrame();return end
                local current=pixels()
                local nextPoint=current:Lerp(goal,1-math.exp(-(options.FollowSpeed or 45)*math.max(0,dt)))
                if (goal-nextPoint).Magnitude<=0.15 then nextPoint=goal end
                place(clamp(nextPoint))
                if not active and (goal-nextPoint).Magnitude<=0.15 then goal=nil;stopFrame() end
            end)
            trackRootConnection(frameConnection)
        end
        local function update(input)
            if not active then return end
            local point=Vector2.new(input.Position.X,input.Position.Y)
            local delta=point-active.Start
            wasDragged=wasDragged or delta.Magnitude>(options.Threshold or 5)
            if wasDragged then goal=clamp(active.Origin+delta);startFrame() end
        end
        handle.Active=true
        connections[#connections+1]=handle.InputBegan:Connect(function(input)
            if not allowed() or active then return end
            if input.UserInputType~=Enum.UserInputType.Touch and input.UserInputType~=Enum.UserInputType.MouseButton1 then return end
            for _, ignored in ipairs(options.Ignore or {}) do
                if ignored.Visible and pointInsideGui(ignored,Vector2.new(input.Position.X,input.Position.Y)) then return end
            end
            stopFrame();goal=nil;wasDragged=false;lastInput=input
            active={Input=input,Start=Vector2.new(input.Position.X,input.Position.Y),Origin=pixels()}
        end)
        connections[#connections+1]=UserInputService.InputChanged:Connect(function(input)
            if not active then return end
            if input~=active.Input and not (active.Input.UserInputType==Enum.UserInputType.MouseButton1 and input.UserInputType==Enum.UserInputType.MouseMovement) then return end
            update(input)
        end)
        connections[#connections+1]=UserInputService.InputEnded:Connect(function(input)
            if active and active.Input==input then
                -- MouseButton1's Position need not track MouseMovement, so keep the last pointer goal.
                if input.UserInputType==Enum.UserInputType.Touch then update(input) end
                active=nil
                if not goal then stopFrame() end
            end
        end)
        connections[#connections+1]=UserInputService.WindowFocusReleased:Connect(function()
            active,goal=nil,nil;wasDragged=true;stopFrame()
        end)
        connections[#connections+1]=space:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if target.Parent then place(clamp(pixels())) end
        end)
        for _, connection in ipairs(connections) do trackRootConnection(connection) end
        local controller={}
        function controller.AllowActivation(input)
            if input and lastInput and input~=lastInput and (input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1) then return false end
            return not dead and not wasDragged
        end
        function controller.Clamp() if target.Parent then place(clamp(pixels())) end end
        function controller.Cancel() active,goal=nil,nil;wasDragged=true;stopFrame() end
        function controller.Destroy()
            if dead then return end
            dead=true;active,goal=nil,nil;stopFrame()
            for _, connection in ipairs(connections) do connection:Disconnect() end
        end
        return controller
    end
end
installDrag()
end


-- Steal Panel UI from the uploaded CHILLI_HUB (1).txt. No replacement skin or game automation.
do
local function installItemPanel()
    local styles={
        Hud={rgb(0,118,255),rgb(72,204,255),-90,rgb(0,28,76),rgb(172,226,255),"PanelHud"},
        Steal={rgb(60,255,0),rgb(136,255,0),-90,rgb(11,72,0),rgb(190,255,180),"PanelAction"},
        Queued={rgb(118,118,132),rgb(172,172,186),-90,rgb(28,28,34),rgb(214,214,226),"PanelQueued"},
        Priority={rgb(255,247,0),rgb(255,136,0),90,rgb(0,0,0),rgb(132,112,0),"PanelPriority"},
        Cancel={rgb(214,17,17),rgb(253,20,20),-90,rgb(72,0,0),rgb(255,103,103),"PanelCancel"},
        Chilli={nil,nil,-115,rgb(44,10,80),rgb(226,178,255),"PanelHud"},
    }
    styles.Chilli[1]=ColorSequence.new({ColorSequenceKeypoint.new(0,rgb(132,74,255)),ColorSequenceKeypoint.new(0.34,rgb(178,74,255)),ColorSequenceKeypoint.new(0.6,rgb(255,104,206)),ColorSequenceKeypoint.new(0.78,rgb(255,168,232)),ColorSequenceKeypoint.new(1,rgb(146,66,255))})
    local sortModes={"Best Rarity","Biggest Weight","Best Mutation","Highest Value","Lowest Value"}
    local PanelMethods,ItemMethods={},{}
    local function connect(owner,event,callback)
        local c=trackRootConnection(event:Connect(callback));table.insert(owner._connections,c);return c
    end
    local function live(self) assert(not self._destroyed and not window._destroyed,"O painel ou item foi destruido.") end
    local function image(value)
        if value==nil or value=="" then return "" end
        local text=tostring(value)
        if text:match("^%d+$") then return "rbxassetid://"..text end
        assert(text:match("^rbxassetid://%d+$") or text:match("^rbxasset://") or text:match("^rbxthumb://"),"Icon precisa ser um ID ou URI de imagem Roblox.")
        return text
    end
    local function labelOf(button) return button and (button:FindFirstChild("Label") or button:FindFirstChild("TextLabel")) end
    local function write(label,value)
        if not label then return end
        label.Text=tostring(value or "")
        for _,child in ipairs(label:GetDescendants()) do if child:IsA("TextLabel") then child.Text=label.Text end end
    end
    local function cloneVisual(source)
        local changed={}
        local parts=source:GetDescendants();table.insert(parts,1,source)
        for _,part in ipairs(parts) do
            if not part:IsA("LuaSourceContainer") and not part.Archivable then
                table.insert(changed,part);part.Archivable=true
            end
        end
        local ok,result=pcall(function() return source:Clone() end)
        for _,part in ipairs(changed) do part.Archivable=false end
        assert(ok and result,"Nao foi possivel clonar a interface original.")
        for _,child in ipairs(result:GetDescendants()) do if child:IsA("LuaSourceContainer") then child:Destroy() end end
        return result
    end
    local function remember(tree)
        local all=tree:GetDescendants();table.insert(all,1,tree)
        for _,part in ipairs(all) do
            if part:IsA("TextLabel") or (part:IsA("TextButton") and part.Text~="") then
                if part.Parent and (part.Parent:IsA("TextLabel") or (part.Parent:IsA("TextButton") and part.Parent.Text~="")) or part.Name:lower():find("shadow",1,true) then
                    part:SetAttribute("MikotohShadowText",true);part:SetAttribute("MikotohKeepColor",true)
                else Runtime.referenceTextStyle(part,{Plain=not part:FindFirstChildOfClass("UIGradient"),Role=part:GetAttribute("MikotohTextRole")}) end
            end
        end
    end
    local function skin(button,name,raw)
        if not button then return end
        local style=styles[name]
        button:SetAttribute("MikotohColorRole",style[6])
        local g=button:FindFirstChildOfClass("UIGradient")
        if g then g.Rotation=style[3];Runtime.setOriginalProperty(g,"Color",typeof(style[1])=="ColorSequence" and style[1] or ColorSequence.new(style[1],style[2]),not raw) end
        for _,entry in ipairs({{"UIStroke",style[4],"PanelOutline"},{"UIStrokeClr",style[5],"PanelHighlight"}}) do
            local stroke=button:FindFirstChild(entry[1]);if stroke then stroke:SetAttribute("MikotohColorRole",entry[3]);Runtime.setOriginalProperty(stroke,"Color",entry[2],not raw) end
        end
    end
    local function feedback(owner,button)
        if not button then return end
        button.Active=true;button.AutoButtonColor=false;pcall(function() button.Interactable=true end)
        local scale=button:FindFirstChild("BtnScale") or button:FindFirstChildOfClass("UIScale")
        if not scale then scale=Instance.new("UIScale");scale.Name="BtnScale";scale.Parent=button end
        scale.Scale=1
        local tween
        local function set(value)
            if tween then tween:Cancel() end
            tween=TweenService:Create(scale,TweenInfo.new(0.16,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Scale=value});tween:Play()
        end
        connect(owner,button.MouseEnter,function() set(1.08) end)
        connect(owner,button.MouseLeave,function() set(1) end)
        connect(owner,button.MouseButton1Down,function() set(0.94) end)
        connect(owner,button.MouseButton1Up,function() set(1.08) end)
        connect(owner,button.Destroying,function() if tween then tween:Cancel() end end)
    end
    local function sourceScreen(source,name)
        local ancestor=source.Parent
        while ancestor and not ancestor:IsA("ScreenGui") do ancestor=ancestor.Parent end
        local gui=Instance.new("ScreenGui");gui.Name=name;gui.ResetOnSpawn=false;gui:SetAttribute(OWNER_ATTRIBUTE,true)
        gui.IgnoreGuiInset=ancestor and ancestor.IgnoreGuiInset or false
        gui.ZIndexBehavior=ancestor and ancestor.ZIndexBehavior or Enum.ZIndexBehavior.Sibling
        gui.DisplayOrder=ancestor and ancestor.DisplayOrder or rootGui.DisplayOrder
        if ancestor then pcall(function() gui.ScreenInsets=ancestor.ScreenInsets end) end
        gui.Enabled=false;gui.Parent=rootGui.Parent;return gui
    end
    local function validTemplate(frame)
        if typeof(frame)~="Instance" or not frame:IsA("GuiObject") then return false end
        local header,list,close=frame:FindFirstChild("Header"),frame:FindFirstChild("ScrollingFrame"),frame:FindFirstChild("Close")
        local template=list and list:FindFirstChild("Template")
        local spacer=template and template:FindFirstChild("Spacer")
        return header and list and list:IsA("ScrollingFrame") and close and close:IsA("GuiButton") and spacer
            and spacer:FindFirstChild("TextLabel") and spacer:FindFirstChild("Unequip") and spacer.Unequip:IsA("GuiButton") and labelOf(spacer.Unequip)
    end
    local function findSources(config)
        local pg=player:FindFirstChildOfClass("PlayerGui")
        local active=pg and pg:FindFirstChild("ActivePets")
        local hud=pg and pg:FindFirstChild("HUD")
        local gameHud=hud and hud:FindFirstChild("GameHUD")
        local column=gameHud and gameHud:FindFirstChild("RightButtons")
        return config.Template or (active and active:FindFirstChild("Frame")),column,
            config.LauncherTemplate or (column and column:FindFirstChild("PetsButton")),column and column:FindFirstChild("EggsButton")
    end
    local function prepareRow(template)
        local spacer=template.Spacer;local name=spacer.TextLabel;local action=spacer.Unequip
        name.AnchorPoint=Vector2.new(name.AnchorPoint.X,0.5);name.Size=UDim2.fromScale(0.38,0.3);name.Position=UDim2.fromScale(0.415,0.2);write(name,"")
        local icon=spacer:FindFirstChild("Icon")
        if icon then icon.AnchorPoint=Vector2.new(0.5,0.5);icon.Size=UDim2.fromScale(0.2,1.3);icon.Position=UDim2.fromScale(0.1,0.5) end
        for _,entry in ipairs({{"Value",0.38,0.23,0.48,"Steal","Accent"},{"Detail",0.4,0.3,0.78,"Hud","Hud"},{"Rank",0.1,0.36,0.03,"Priority","Accent"}}) do
            local label=name:Clone();label.Name=entry[1];label.Size=UDim2.fromScale(entry[2],entry[3]);label.Position=UDim2.fromScale(entry[1]=="Rank" and 0.012 or 0.415,entry[4]);label.Parent=spacer
            local g=label:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient");local style=styles[entry[5]]
            g.Color=ColorSequence.new(style[1],style[2]);g.Rotation=entry[1]=="Rank" and 90 or style[3];g.Parent=label;label:SetAttribute("MikotohTextRole",entry[6])
            if entry[1]=="Rank" then label.AnchorPoint=Vector2.new();label.TextXAlignment=Enum.TextXAlignment.Left;label.ZIndex=6;label.Visible=false end
        end
        local cancel=action:Clone();cancel.Name="Cancel";cancel.Parent=spacer
        local square=Instance.new("UIAspectRatioConstraint");square.AspectRatio=1;square.DominantAxis=Enum.DominantAxis.Height;square.Parent=cancel
        cancel.Visible=false;skin(cancel,"Cancel",true);write(labelOf(cancel),"X")
        action.AnchorPoint=Vector2.new(1,0.5);action.Position=UDim2.fromScale(0.849,0.6);action.Size=UDim2.fromScale(0.2,0.56);skin(action,"Steal",true);write(labelOf(action),"Steal")
        for _,entry in ipairs({{"Star","★",0.955,"Queued"},{"Up","▲",0.743,"Hud"},{"Down","▼",0.849,"Hud"}}) do
            local button=cancel:Clone();button.Name=entry[1];button.AnchorPoint=Vector2.new(1,0.5);button.Size=UDim2.fromScale(0.1,0.56)
            button.Position=UDim2.fromScale(entry[3],0.6);button.Visible=entry[1]=="Star";button.Parent=spacer;skin(button,entry[4],true);write(labelOf(button),entry[2])
        end
        cancel.AnchorPoint=Vector2.new(1,0);cancel.Position=UDim2.fromScale(0.99,0.04);cancel.Size=UDim2.fromScale(0.06,0.28);cancel.ZIndex=8
        for _,child in ipairs(cancel:GetDescendants()) do if child:IsA("GuiObject") then child.ZIndex+=8 end end
    end
    local function validate(data)
        assert(type(data)=="table","Cada ovo precisa ser uma tabela.")
        image(data.Icon or data.ImageId or (data.Style and data.Style.Icon))
        for _,key in ipairs({"Callback","OnAction","OnCancel","OnPriority","OnMove"}) do assert(data[key]==nil or type(data[key])=="function",key.." precisa ser uma funcao.") end
        for _,key in ipairs({"TextColor","NameColor","ValueColor","DetailsColor"}) do if data[key] then color(data[key]) end end
    end
    local function numeric(data) return tonumber(data.SortValue or data.Value or data.Income) or 0 end
    local function income(value)
        local number=tonumber(value);if not number then return tostring(value or "") end
        local units={"","K","M","B","T","Qa","Qi","Sx"};local index=1
        while number>=1000 and index<#units do number/=1000;index+=1 end
        local str=index==1 and tostring(math.floor(number)) or string.format("%.1f",math.floor(number*10)/10)
        return "$"..str:gsub("%.0$","")..units[index].."/s"
    end
    local function render(item)
        if not item.Instance then return end
        local data,spacer=item.Data,item.Instance.Spacer;local style=data.Style or {}
        write(spacer.TextLabel,data.Name or style.Name or data.Category or "")
        write(spacer.Value,income(data.Value or data.Income))
        local detail=data.Details or data.Detail or data.Description or ""
        if type(detail)=="table" then detail=table.concat(detail,"  ·  ") end
        write(spacer.Detail,detail)
        local icon=spacer:FindFirstChild("Icon");if icon then icon.Image=image(data.Icon or data.ImageId or style.Icon) end
        if data.TextColor then window:SetComponentColor(item.Instance,data.TextColor,{Descendants=true,TextOnly=true}) end
        for _,pair in ipairs({{spacer.TextLabel,data.NameColor or style.GradientColor,data.NameRotation or style.GradientRotation},{spacer.Value,data.ValueColor},{spacer.Detail,data.DetailsColor}}) do
            if pair[2] then window:SetComponentColor(pair[1],pair[2],{Rotation=pair[3] or 90}) end
        end
    end
    local function rebuild(panel)
        if not panel.Instance or panel._destroyed then return end
        local items=table.clone(panel.Items)
        table.sort(items,function(a,b)
            local ar,br=table.find(panel.Queue,a),table.find(panel.Queue,b)
            if (ar~=nil)~=(br~=nil) then return ar~=nil end
            if ar and br then return ar<br end
            if panel.Sort==sortModes[1] then
                local av,bv=tonumber(a.Data.RarityNumber or (a.Data.Style and a.Data.Style.RarityNumber)) or 0,tonumber(b.Data.RarityNumber or (b.Data.Style and b.Data.Style.RarityNumber)) or 0
                if av~=bv then return av>bv end
            elseif panel.Sort==sortModes[2] then
                local av,bv=tonumber(a.Data.Weight) or 0,tonumber(b.Data.Weight) or 0
                if av~=bv then return av>bv end
            end
            local av,bv=numeric(a.Data),numeric(b.Data)
            if av~=bv then return panel.Sort==sortModes[5] and av<bv or panel.Sort~=sortModes[5] and av>bv end
            return a.Id<b.Id
        end)
        local height=math.max(1,math.floor(panel.List.AbsoluteSize.X/4.4262295081967213+0.5))
        local best
        for index,item in ipairs(items) do
            if item.Instance then
                local spacer=item.Instance.Spacer;local rank=table.find(panel.Queue,item)
                item.Instance.LayoutOrder=index;item.Instance.Size=UDim2.new(1,0,0,height)
                spacer.Unequip.Visible=rank==nil;spacer.Up.Visible=rank~=nil;spacer.Down.Visible=rank~=nil;spacer.Cancel.Visible=rank~=nil;spacer.Rank.Visible=rank~=nil
                write(spacer.Rank,rank and "#"..rank or "")
                skin(spacer.Star,rank==1 and "Priority" or "Queued")
                if rank then
                    skin(spacer.Up,rank>1 and "Hud" or "Queued");skin(spacer.Down,rank<#panel.Queue and "Hud" or "Queued")
                    local s=styles[item.Id==panel.ActiveId and "Steal" or "Priority"]
                    Runtime.setReferenceTextColor(spacer.Rank,ColorSequence.new(s[1],s[2]),90,"Accent")
                end
            end
            local state=item.Data.State
            local icon=item.Data.Icon or item.Data.ImageId or (item.Data.Style and item.Data.Style.Icon)
            if (not state or state=="Slot" or state=="Dropped") and icon and image(icon)~="" and (not best or numeric(item.Data)>numeric(best.Data)) then best=item end
        end
        if panel._layout then panel.List.CanvasSize=UDim2.fromOffset(0,math.max(panel._layout.AbsoluteContentSize.Y,#items*height)+6) end
        write(labelOf(panel.SortButton),"Sort: "..panel.Sort)
        if best and panel.LauncherImage then panel.LauncherImage.Image=image(best.Data.Icon or best.Data.ImageId or best.Data.Style.Icon) end
    end
    local function bindItem(panel,item)
        local row=panel._template:Clone();row.Name="Egg_"..item.Id;row.Visible=true;remember(row);item.Instance=row;row.Parent=panel.List
        local spacer=row.Spacer
        for _,button in ipairs({spacer.Unequip,spacer.Star,spacer.Up,spacer.Down,spacer.Cancel}) do feedback(item,button) end
        connect(item,spacer.Unequip.Activated,function() item:Press() end)
        connect(item,spacer.Star.Activated,function() safeCallback(item.Data.OnPriority or panel.Config.OnPriority,item,panel) end)
        connect(item,spacer.Cancel.Activated,function() safeCallback(item.Data.OnCancel or panel.Config.OnCancel,item,panel) end)
        connect(item,spacer.Up.Activated,function() item:RequestMove(-1) end)
        connect(item,spacer.Down.Activated,function() item:RequestMove(1) end)
        Runtime.paintTree(row);render(item)
    end
    function ItemMethods:GetData() return table.clone(self.Data) end
    function ItemMethods:SetInfo(patch)
        live(self);validate(patch);for key,value in pairs(patch) do if key~="Id" and key~="Uid" then self.Data[key]=value end end
        render(self);rebuild(self.Panel);return self
    end
    ItemMethods.Update=ItemMethods.SetInfo
    function ItemMethods:SetIcon(value) return self:SetInfo({Icon=value}) end
    function ItemMethods:Press() live(self);if not table.find(self.Panel.Queue,self) then safeCallback(self.Data.OnAction or self.Data.Callback or self.Panel.Config.OnAction,self,self.Panel) end;return self end
    function ItemMethods:RequestMove(delta)
        live(self);local rank=table.find(self.Panel.Queue,self)
        if rank and rank+delta>=1 and rank+delta<=#self.Panel.Queue then safeCallback(self.Data.OnMove or self.Panel.Config.OnMove,self,delta,self.Panel) end
        return self
    end
    function ItemMethods:SetTextColor(value) live(self);self.Data.TextColor=color(value);render(self);return self end
    function ItemMethods:SetColor(part,value,options)
        live(self);assert(self.Instance,"O painel aguarda o modelo original.")
        local target=typeof(part)=="Instance" and part or self.Instance:FindFirstChild(part,true);assert(target,"Parte do ovo nao encontrada: "..tostring(part))
        window:SetComponentColor(target,value,options);return self
    end
    function ItemMethods:Destroy()
        if self._destroyed then return end;self._destroyed=true
        for _,c in ipairs(self._connections) do c:Disconnect() end
        if self.Instance then Runtime.forgetStyledTree(self.Instance);self.Instance:Destroy() end
        local panel=self.Panel;local index=table.find(panel.Items,self);if index then table.remove(panel.Items,index) end
        index=table.find(panel.Queue,self);if index then table.remove(panel.Queue,index) end
        panel.ById[self.Id]=nil;rebuild(panel)
    end
    function PanelMethods:AddItem(data)
        live(self);validate(data);assert(#self.Items<20,"O painel aceita no maximo 20 ovos.")
        self._serial+=1;local id=tostring(data.Id or data.Uid or "egg_"..self._serial);assert(not self.ById[id],"Id repetido: "..id)
        local item=setmetatable({Id=id,Data=table.clone(data),Panel=self,Instance=nil,_connections={}},{__index=ItemMethods})
        table.insert(self.Items,item);self.ById[id]=item
        if self.Instance then bindItem(self,item) end;rebuild(self);return item
    end
    function PanelMethods:SetItems(items)
        live(self);assert(type(items)=="table" and #items<=20,"Items precisa ser uma lista de ate 20 ovos.")
        local incoming={}
        for index,data in ipairs(items) do validate(data);local id=tostring(data.Id or data.Uid or "entry_"..index);assert(not incoming[id],"Id repetido: "..id);incoming[id]=data end
        for _,item in ipairs(table.clone(self.Items)) do if not incoming[item.Id] then item:Destroy() end end
        for index,data in ipairs(items) do
            local id=tostring(data.Id or data.Uid or "entry_"..index)
            if self.ById[id] then self.ById[id]:SetInfo(data) else local spec=table.clone(data);spec.Id=id;self:AddItem(spec) end
        end
        rebuild(self);return self
    end
    function PanelMethods:SetQueue(ids,activeId)
        live(self);assert(type(ids)=="table","SetQueue recebe uma lista de IDs.");local queue,used={},{}
        for _,value in ipairs(ids) do
            local id=type(value)=="table" and value.Id or tostring(value);local item=self.ById[id]
            assert(item and not used[id],"ID ausente ou repetido na fila: "..tostring(id));used[id]=true;table.insert(queue,item)
        end
        self.Queue=queue;self.ActiveId=activeId and tostring(activeId) or nil;rebuild(self);return self
    end
    function PanelMethods:GetQueue() return table.clone(self.Queue) end
    function PanelMethods:GetItems() return table.clone(self.Items) end
    function PanelMethods:GetItem(id) return self.ById[tostring(id)] end
    function PanelMethods:GetCount() return #self.Items end
    function PanelMethods:Clear() live(self);for _,item in ipairs(table.clone(self.Items)) do item:Destroy() end;return self end
    function PanelMethods:GetSortModes() return table.clone(sortModes) end
    function PanelMethods:SetSort(mode)
        live(self);assert(table.find(sortModes,mode),"Escolha uma das cinco ordenacoes originais.");self.Sort=mode;rebuild(self);safeCallback(self.Config.OnSort,mode,self);return self
    end
    function PanelMethods:SetAutoSteal(value,fire) live(self);self.AutoStealState:Set(value==true,fire~=false);return self end
    function PanelMethods:SetInstantSteal(value,fire) live(self);self.InstantStealState:Set(value==true,fire~=false);return self end
    function PanelMethods:_syncActions()
        if not self.Instance then return end
        for _,entry in ipairs({{self.AutoStealButton,self.AutoStealState,"Auto Steal"},{self.InstantStealButton,self.InstantStealState,"Instant Steal"}}) do
            local on=entry[2]:Get()==true;skin(entry[1],on and "Steal" or "Cancel");write(labelOf(entry[1]),entry[3]..(on and ": ON" or ": OFF"))
        end
    end
    function PanelMethods:IsReady() return not self._destroyed and self.Instance~=nil end
    function PanelMethods:IsEnabled() return not self._destroyed and self.Enabled end
    function PanelMethods:IsVisible() return self:IsReady() and self.Gui.Enabled end
    function PanelMethods:_stopPolling() if self._poll then self._poll:Disconnect();self._poll=nil end end
    function PanelMethods:Refresh()
        live(self);self:_tryMount()
        if not self.Config.Resolver or self._refreshing then return self end
        self._refreshing=true;local ok,result=pcall(self.Config.Resolver,self)
        if ok and result~=nil and not self._destroyed then ok,result=pcall(self.SetItems,self,result) end
        self._refreshing=false;if not ok then warn("MIKOTOH EggPanel Resolver: "..tostring(result)) end;return self
    end
    function PanelMethods:_startPolling()
        if not self.Config.Resolver or self._poll or not self:IsVisible() then return end
        self:Refresh();if not self:IsVisible() then return end
        self._elapsed=0;self._poll=connect(self,RunService.Heartbeat,function(dt)
            self._elapsed+=dt;if self._elapsed>=math.max(0.2,tonumber(self.Config.Interval) or 1) then self._elapsed=0;self:Refresh() end
        end)
    end
    function PanelMethods:_display(value,instant)
        if not self.Instance or self._presented==value and not instant then return end
        self._presented=value
        if self._transition then self._transition:Cancel();self._transition=nil end
        if self._transitionDone then self._transitionDone:Disconnect();self._transitionDone=nil end
        local frame=self.Instance;local position=self._openPosition or frame.Position
        local outside=UDim2.new(position.X.Scale,math.ceil(frame.AbsoluteSize.X*1.392),position.Y.Scale,position.Y.Offset)
        if value then
            for _,native in ipairs(self._nativePanels or {}) do if native.Enabled then native.Enabled=false end end
        end
        if self._hudColumn and self._hudColumn.Parent and self.Config.ManageHUD~=false then
            if self._hudTween then self._hudTween:Cancel() end
            local base=self._hudPosition
            local target=value and UDim2.new(base.X.Scale,math.ceil(self._hudColumn.AbsoluteSize.X*1.03),base.Y.Scale,base.Y.Offset) or base
            if instant then self._hudColumn.Position=target
            else self._hudTween=TweenService:Create(self._hudColumn,TweenInfo.new(value and 0.22 or 0.3,value and Enum.EasingStyle.Quad or Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=target});self._hudTween:Play() end
        end
        if instant or self.Config.Animated==false then self.Gui.Enabled=value;frame.Position=position;return end
        if value and not self.Gui.Enabled then frame.Position=outside end
        if not value and not self.Gui.Enabled then frame.Position=position;return end
        self.Gui.Enabled=true
        local tween=TweenService:Create(frame,TweenInfo.new(value and 0.3 or 0.24,value and Enum.EasingStyle.Back or Enum.EasingStyle.Quad,value and Enum.EasingDirection.Out or Enum.EasingDirection.In),{Position=value and position or outside})
        self._transition=tween
        self._transitionDone=connect(self,tween.Completed,function(state)
            if self._destroyed or self._transition~=tween or state~=Enum.PlaybackState.Completed then return end
            self._transition=nil
            if self._transitionDone then self._transitionDone:Disconnect();self._transitionDone=nil end
            if not self.Enabled then self.Gui.Enabled=false end
            frame.Position=self._openPosition or position
        end)
        tween:Play()
    end
    function PanelMethods:SetEnabled(value)
        live(self);value=value==true;local changed=value~=self.Enabled;self.Enabled=value;self:_tryMount()
        self:_display(value)
        if value then self:_startPolling() else self:_stopPolling() end
        if self._toggle and self._toggle:Get()~=value then self._toggle:Set(value,false) end
        if changed then safeCallback(self.Config.OnEnabledChanged,value,self) end;return self
    end
    function PanelMethods:Show() return self:SetEnabled(true) end
    function PanelMethods:Hide() return self:SetEnabled(false) end
    function PanelMethods:Toggle() return self:SetEnabled(not self:IsEnabled()) end
    function PanelMethods:BindToggle(toggle)
        live(self);assert(type(toggle)=="table" and type(toggle.GetState)=="function","BindToggle precisa de um toggle.")
        if self._binding then self._binding:Disconnect() end;self._toggle=toggle
        self._binding=toggle:GetState():Subscribe(function(value) if not self._destroyed then self:SetEnabled(value) end end);self._binding.Internal=true
        self:SetEnabled(toggle:Get());return self
    end
    function PanelMethods:SetTitle(value) live(self);self.Config.Title=tostring(value);write(self.Title,value);return self end
    function PanelMethods:SetTextColor(value) live(self);self.Config.TextColor=color(value);if self.Instance then window:SetComponentColor(self.Instance,value,{Descendants=true,TextOnly=true}) end;return self end
    function PanelMethods:SetColor(part,value,options)
        live(self);assert(self.Instance,"O painel aguarda ActivePets.Frame.");local target=typeof(part)=="Instance" and part or self.Instance:FindFirstChild(part,true)
        assert(target,"Parte do painel nao encontrada: "..tostring(part));window:SetComponentColor(target,value,options);return self
    end
    function PanelMethods:SetLayout(settings)
        live(self);settings=settings or {};self.Config.Layout=self.Config.Layout or {}
        for _,key in ipairs({"Size","Position","AnchorPoint"}) do
            if settings[key] then
                assert(typeof(settings[key])==(key=="AnchorPoint" and "Vector2" or "UDim2"),key.." invalido.");self.Config.Layout[key]=settings[key]
            end
        end
        if self.Instance then
            for key,value in pairs(self.Config.Layout) do self.Instance[key]=value end
            self._openPosition=self.Config.Layout.Position or self._openPosition or self.Instance.Position
            if not self._mounting then self:_display(self.Enabled,true) end;rebuild(self)
        end;return self
    end
    function PanelMethods:GetLayout() if not self.Instance then return table.clone(self.Config.Layout or {}) end;return {Size=self.Instance.Size,Position=self._openPosition or self.Instance.Position,AnchorPoint=self.Instance.AnchorPoint} end
    function PanelMethods:_sizeStrokes(tree,width,reference)
        if not tree then return end
        self._strokeSizes=self._strokeSizes or setmetatable({}, {__mode="k"})
        for _,part in ipairs(tree:GetDescendants()) do
            if part:IsA("UIStroke") then
                local ok,mode=pcall(function() return part.StrokeSizingMode end)
                if not ok or mode~=Enum.StrokeSizingMode.ScaledSize then
                    self._strokeSizes[part]=self._strokeSizes[part] or part.Thickness
                    part.Thickness=self._strokeSizes[part]*math.max(1,width)/reference
                end
            end
        end
    end
    function PanelMethods:_mountLauncher(source,column,eggs)
        if self.Launcher or self.Config.Launcher==false or not source or not source:IsA("GuiButton") then return end
        local button=cloneVisual(source)
        for _,name in ipairs({"Notification","ReadyNotification","NightImage","NightText","ConsoleButton","Badge"}) do local part=button:FindFirstChild(name);if part then part:Destroy() end end
        button.Name="StealPanelLauncher";button.AnchorPoint=Vector2.new(0.5,0.5);button.LayoutOrder=0;button.Visible=true
        local gui=sourceScreen(source,"MIKOTOH_EggLauncher_4");gui.Enabled=true;button.Parent=gui
        self.Launcher,self.LauncherGui,self.LauncherImage=button,gui,button:FindFirstChild("ImageLabel")
        skin(button,"Chilli");remember(button);Runtime.registerStyledRoot(gui);feedback(self,button)
        connect(self,button.Activated,function() self:Toggle() end)
        local function place()
            if self._destroyed or not source.Parent then return end
            local center=source.AbsolutePosition+source.AbsoluteSize/2
            if eggs and eggs.Parent then local eggCenter=eggs.AbsolutePosition+eggs.AbsoluteSize/2;center=Vector2.new(eggCenter.X,eggCenter.Y-(center.Y-eggCenter.Y)) end
            button.Position=UDim2.fromOffset(center.X-gui.AbsolutePosition.X,center.Y-gui.AbsolutePosition.Y)
            local sizeSource=eggs or source
            local sourceScale=sizeSource:FindFirstChildOfClass("UIScale")
            local factor=sourceScale and math.max(0.001,sourceScale.Scale) or 1
            button.Size=UDim2.fromOffset(sizeSource.AbsoluteSize.X/factor,sizeSource.AbsoluteSize.Y/factor)
            button.Visible=true
            self:_sizeStrokes(button,button.AbsoluteSize.X,86.24)
        end
        place();connect(self,source:GetPropertyChangedSignal("AbsoluteSize"),place);connect(self,source:GetPropertyChangedSignal("AbsolutePosition"),place)
        connect(self,source:GetPropertyChangedSignal("Visible"),place)
        if eggs then connect(self,eggs:GetPropertyChangedSignal("AbsolutePosition"),place) end
        if eggs then connect(self,eggs:GetPropertyChangedSignal("AbsoluteSize"),place) end
        if column then connect(self,column:GetPropertyChangedSignal("Visible"),place) end
        rebuild(self)
    end
    function PanelMethods:_tryMount()
        if self._destroyed or self._mounting then return end
        local source,column,pets,eggs=findSources(self.Config)
        if self.Instance then self:_mountLauncher(pets,column,eggs);return end
        if not validTemplate(source) then return end
        self._mounting=true
        local frame=cloneVisual(source);frame.Name="StealPanel";frame.Visible=true
        local rootScale=frame:FindFirstChildOfClass("UIScale");if rootScale then rootScale.Scale=1 end
        frame:SetAttribute("MikotohColorRole","PanelSurface")
        local header,list,close=frame.Header,frame.ScrollingFrame,frame.Close;local template=list.Template
        for _,child in ipairs(list:GetChildren()) do if child~=template and child:IsA("GuiObject") and child.Name~="EmptyLast" then child:Destroy() end end
        local equip=frame:FindFirstChild("EquipBest");if equip then equip:Destroy() end
        local aspect=frame:FindFirstChildOfClass("UIAspectRatioConstraint");local oldAspect=aspect and aspect.AspectRatio or 1.25
        local mobile=not UserInputService.MouseEnabled;local sizeScale=mobile and 1.2 or 1;local heightScale=mobile and 1.15 or 1
        local ratio=(0.86/heightScale)/oldAspect
        frame.Size=UDim2.fromScale(0.3*sizeScale,0.62*sizeScale*heightScale)
        if not aspect then aspect=Instance.new("UIAspectRatioConstraint");aspect.Parent=frame end
        aspect.AspectRatio=0.86/heightScale;aspect.AspectType=Enum.AspectType.FitWithinMaxSize
        header.Size=UDim2.new(header.Size.X.Scale,header.Size.X.Offset,header.Size.Y.Scale*ratio,header.Size.Y.Offset)
        header.Position=UDim2.new(header.Position.X.Scale,header.Position.X.Offset,header.Position.Y.Scale*ratio,header.Position.Y.Offset)
        close.Size=UDim2.new(close.Size.X.Scale,close.Size.X.Offset,close.Size.Y.Scale*ratio,close.Size.Y.Offset)
        local top=(list.Position.Y.Scale-list.Size.Y.Scale*list.AnchorPoint.Y)*ratio
        local bottom=1-(1-(list.Position.Y.Scale+list.Size.Y.Scale*(1-list.AnchorPoint.Y)))*ratio
        local actions=Instance.new("Frame");actions.Name="PanelActions";actions.BackgroundTransparency=1;actions.BorderSizePixel=0;actions.AnchorPoint=Vector2.new(0.5,0)
        actions.Position=UDim2.fromScale(0.5,top+0.02*ratio);actions.Size=UDim2.fromScale(0.9,0.1*ratio);actions.Parent=frame
        local layout=Instance.new("UIListLayout");layout.FillDirection=Enum.FillDirection.Horizontal;layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
        layout.VerticalAlignment=Enum.VerticalAlignment.Center;layout.SortOrder=Enum.SortOrder.LayoutOrder;layout.Padding=UDim.new(0.06,0);layout.Parent=actions
        local newTop=top+0.03*ratio+0.1*ratio
        list.Size=UDim2.new(list.Size.X.Scale,list.Size.X.Offset,bottom-newTop,0)
        list.Position=UDim2.new(list.Position.X.Scale,list.Position.X.Offset,newTop+(bottom-newTop)*list.AnchorPoint.Y,0)
        self.AutoStealButton=template.Spacer.Unequip:Clone();self.AutoStealButton.Name="AutoSteal";self.AutoStealButton.Size=UDim2.fromScale(0.46,1);self.AutoStealButton.LayoutOrder=1;self.AutoStealButton.Parent=actions
        self.InstantStealButton=template.Spacer.Unequip:Clone();self.InstantStealButton.Name="InstantSteal";self.InstantStealButton.Size=UDim2.fromScale(0.46,1);self.InstantStealButton.LayoutOrder=2;self.InstantStealButton.Parent=actions
        header:SetAttribute("MikotohColorRole","PanelHeader")
        local g=header:FindFirstChildOfClass("UIGradient")
        if g then g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,rgb(200,18,24)),ColorSequenceKeypoint.new(0.53,rgb(255,88,90)),ColorSequenceKeypoint.new(1,rgb(214,28,34))}) end
        self.Gui=sourceScreen(source,"MIKOTOH_ItemPanel_4");frame.Parent=self.Gui
        self.Instance,self.List,self.Title,self.CloseButton,self.SortButton=frame,list,header:FindFirstChild("Title"),close,header:FindFirstChild("PlusEquip")
        self._openPosition=frame.Position
        self._hudColumn=column;self._hudPosition=column and column.Position
        local pg=player:FindFirstChildOfClass("PlayerGui")
        self._nativePanels={}
        for _,name in ipairs({"ActivePets","GrowingEggs"}) do
            local native=pg and pg:FindFirstChild(name)
            if native and native:IsA("ScreenGui") then
                table.insert(self._nativePanels,native)
                connect(self,native:GetPropertyChangedSignal("Enabled"),function() if native.Enabled and self.Enabled then self:Hide() end end)
            end
        end
        self.TemplateSource=self.Config.Template and "Custom" or "ActivePets"
        local listLayout=list:FindFirstChildOfClass("UIListLayout")
        if not listLayout then listLayout=Instance.new("UIListLayout");listLayout.SortOrder=Enum.SortOrder.LayoutOrder;listLayout.Parent=list end
        self._layout=listLayout;template.Parent=nil;template.Visible=false;self._template=template;prepareRow(template)
        remember(frame);Runtime.registerStyledRoot(self.Gui)
        for _,button in ipairs({self.AutoStealButton,self.InstantStealButton,close}) do feedback(self,button) end
        connect(self,self.AutoStealButton.Activated,function() self:SetAutoSteal(not self.AutoStealState:Get()) end)
        connect(self,self.InstantStealButton.Activated,function() self:SetInstantSteal(not self.InstantStealState:Get()) end)
        connect(self,close.Activated,function() self:Hide() end)
        if self.SortButton then
            skin(self.SortButton,"Steal");feedback(self,self.SortButton)
            connect(self,self.SortButton.Activated,function() self:SetSort(sortModes[(table.find(sortModes,self.Sort) or 4)%#sortModes+1]) end)
        end
        self:_syncActions();write(self.Title,self.Config.Title or "Steal Panel")
        for _,item in ipairs(self.Items) do bindItem(self,item) end
        local function resized() if self.Instance and not self._destroyed then self:_sizeStrokes(frame,frame.AbsoluteSize.X,556);rebuild(self) end end
        connect(self,frame:GetPropertyChangedSignal("AbsoluteSize"),resized);connect(self,list:GetPropertyChangedSignal("AbsoluteSize"),resized)
        resized();self:SetLayout(self.Config.Layout);if self.Config.TextColor then self:SetTextColor(self.Config.TextColor) end
        self._mounting=false;self:_mountLauncher(pets,column,eggs);self:_display(self.Enabled);self:_startPolling()
        safeCallback(self.Config.OnReady,self)
    end
    function PanelMethods:Destroy()
        if self._destroyed then return end;self._destroyed=true;self:_stopPolling()
        if self._transition then self._transition:Cancel() end
        if self._hudTween then self._hudTween:Cancel() end
        if self._hudColumn and self._hudColumn.Parent and self._hudPosition and self.Config.ManageHUD~=false then self._hudColumn.Position=self._hudPosition end
        if self._binding then self._binding:Disconnect() end
        for _,c in ipairs(self._connections) do c:Disconnect() end
        if self._toggle and not window._destroyed then self._toggle:Set(false,false) end
        for _,item in ipairs(table.clone(self.Items)) do item:Destroy() end
        for _,gui in ipairs({self.Gui or false,self.LauncherGui or false}) do if gui then Runtime.unregisterStyledRoot(gui);gui:Destroy() end end
        if self._template then self._template:Destroy() end
        for _,state in ipairs(self._ownedStates) do if not state._destroyed then state:Destroy() end end
        if window.ItemPanel==self then window.ItemPanel=nil end
    end
    function WindowMethods:CreateItemPanel(config)
        assertObject(self,"Window");config=config or {};assert(type(config)=="table","CreateEggPanel recebe uma tabela.")
        if self.ItemPanel and not self.ItemPanel._destroyed then return self.ItemPanel end
        if config.Template then assert(validTemplate(config.Template),"Template precisa ter a estrutura original ActivePets.Frame.") end
        assert(config.Actions==nil,"Actions personalizados foram retirados. O painel usa Auto Steal e Instant Steal originais.")
        if config.Sort then assert(table.find(sortModes,config.Sort),"Sort precisa ser uma das cinco opcoes originais.") end
        if config.Resolver then assert(type(config.Resolver)=="function","Resolver precisa ser uma funcao.") end
        if config.Items then
            assert(type(config.Items)=="table" and #config.Items<=20,"Items aceita ate 20 ovos.")
            local seen={}
            for index,data in ipairs(config.Items) do validate(data);local id=tostring(data.Id or data.Uid or "entry_"..index);assert(not seen[id],"Id repetido: "..id);seen[id]=true end
        end
        local panel=setmetatable({Window=self,Config=table.clone(config),Enabled=false,Items={},ById={},Queue={},Sort=config.Sort or sortModes[4],_serial=0,_connections={},_ownedStates={},TemplateSource="Pending"},{__index=PanelMethods})
        local function state(key,default)
            if config[key] then return config[key] end
            local result=self:CreateState({Name="EggPanel."..key,Default=default==true});table.insert(panel._ownedStates,result);return result
        end
        panel.AutoStealState=state("AutoStealState",config.AutoSteal);panel.InstantStealState=state("InstantStealState",config.InstantSteal)
        for _,entry in ipairs({{panel.AutoStealState,"OnAutoSteal"},{panel.InstantStealState,"OnInstantSteal"}}) do
            local c=entry[1]:Subscribe(function() panel:_syncActions() end);c.Internal=true;table.insert(panel._connections,c)
            table.insert(panel._connections,entry[1]:Subscribe(function(value) if not panel._destroyed then safeCallback(panel.Config[entry[2]],value,panel) end end))
        end
        self.ItemPanel=panel
        local pg=player:FindFirstChildOfClass("PlayerGui")
        if pg then connect(panel,pg.DescendantAdded,function() task.defer(function() if not panel._destroyed then panel:_tryMount() end end) end) end
        if config.Items then panel:SetItems(config.Items) end
        if config.Size or config.Position or config.AnchorPoint then panel:SetLayout(config) end
        panel:_tryMount()
        if config.Toggle then panel:BindToggle(config.Toggle) else panel:SetEnabled(config.Enabled==true) end
        return panel
    end
    WindowMethods.CreateEggPanel=WindowMethods.CreateItemPanel
    WindowMethods.CreateStealPanel=WindowMethods.CreateItemPanel
    WindowMethods.CreateReviewPanel=WindowMethods.CreateItemPanel
    function WindowMethods:GetItemPanel() return self.ItemPanel end
    local destroy=WindowMethods.Destroy
    function WindowMethods:Destroy() if self.ItemPanel then self.ItemPanel:Destroy() end;return destroy(self) end
end
installItemPanel()
end


-- Compact Anti Guard UI from CHILLI_HUB (1).txt, stripped of all character/game logic.
do
local function installGuardPanel()
    local colors={Card=rgb(15,15,19),CardTop=rgb(24,22,28),Stroke=rgb(48,46,56),Text=rgb(240,238,244),AccentA=rgb(255,72,72),AccentB=rgb(255,150,60),Off=rgb(58,56,66)}
    local Methods={}
    local function create(class,parent,name,properties)
        local instance=Instance.new(class);instance.Name=name
        for key,value in pairs(properties or {}) do instance[key]=value end
        instance.Parent=parent;return instance
    end
    local function connect(panel,event,callback)
        local c=trackRootConnection(event:Connect(callback));table.insert(panel._connections,c);return c
    end
    local function live(self) assert(not self._destroyed and not window._destroyed,"O painel foi destruido.") end
    local function animate(panel,instance,duration,properties,style)
        local previous=panel._tweens[instance];if previous then previous:Cancel() end
        local tween=TweenService:Create(instance,TweenInfo.new(duration,style or Enum.EasingStyle.Quint,Enum.EasingDirection.Out),properties)
        panel._tweens[instance]=tween;tween:Play()
    end
    function Methods:_syncBorderAnimation()
        local run=not self._destroyed and self.Config.AnimateBorder~=false and self.Gui.Enabled and self.ValueState:Get()==true
        if not run then if self._borderFrame then self._borderFrame:Disconnect();self._borderFrame=nil end;return end
        if self._borderFrame then return end
        self._borderFrame=connect(self,RunService.RenderStepped,function(dt)
            self.OutlineGradient.Rotation=(self.OutlineGradient.Rotation+dt*90)%360
        end)
    end
    function Methods:_render(instant)
        local on=self.ValueState:Get()==true;local duration=instant and 0 or 0.28
        self.Switch:SetAttribute("MikotohColorRole",on and "GuardSwitchOn" or "GuardSwitchOff")
        Runtime.setOriginalProperty(self.SwitchGradient,"Color",on and ColorSequence.new(colors.AccentA,colors.AccentB) or ColorSequence.new(colors.Off,colors.Off))
        Runtime.setOriginalProperty(self.OutlineGradient,"Color",on and ColorSequence.new({ColorSequenceKeypoint.new(0,colors.Stroke),ColorSequenceKeypoint.new(0.45,colors.AccentA),ColorSequenceKeypoint.new(0.55,colors.AccentB),ColorSequenceKeypoint.new(1,colors.Stroke)}) or ColorSequence.new(colors.Stroke,colors.Stroke))
        self.IconStroke:SetAttribute("MikotohColorRole",on and "GuardIconOn" or "GuardIconOff")
        Runtime.setOriginalProperty(self.IconStroke,"Color",on and colors.AccentA or colors.Off)
        animate(self,self.Knob,duration,{Position=on and UDim2.new(1,-19,0.5,0) or UDim2.new(0,3,0.5,0)},Enum.EasingStyle.Back)
        animate(self,self.Icon,duration,{ImageTransparency=on and 0 or 0.35})
        animate(self,self.Outline,instant and 0 or 0.3,{Transparency=on and 0 or 0.2})
        self:_syncBorderAnimation()
    end
    function Methods:_cacheHotbars()
        self._hotbars={}
        local names={Hotbar=true,HotBar=true,Toolbar=true,ToolBar=true,Backpack=true,Inventory=true}
        local pg=player:FindFirstChildOfClass("PlayerGui")
        if pg then for _,part in ipairs(pg:GetDescendants()) do
            if part:IsA("GuiObject") and names[part.Name] then table.insert(self._hotbars,part) end
        end end
    end
    function Methods:_syncLayoutPolling()
        if self._destroyed or not self.Gui.Enabled then
            if self._layoutPoll then self._layoutPoll:Disconnect();self._layoutPoll=nil end
            return
        end
        if self._layoutPoll then return end
        self._layoutElapsed=0;self._cacheElapsed=0
        self._layoutPoll=connect(self,RunService.Heartbeat,function(dt)
            self._cacheElapsed+=dt;self._layoutElapsed+=dt
            if self._cacheElapsed>=3 then self._cacheElapsed=0;self:_cacheHotbars() end
            if self._layoutElapsed>=0.2 then self._layoutElapsed=0;self:_layout() end
        end)
    end
    function Methods:_layout()
        if self._destroyed then return end
        if self.Config.Position then self.Instance.Position=self.Config.Position end
        local camera=workspace.CurrentCamera
        local size=camera and camera.ViewportSize or self.Gui.AbsoluteSize
        if size.X<10 or size.Y<10 then return end
        local mobile=UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        local factor=math.min(size.X/1280,size.Y/720)
        local scale=mobile and math.clamp(factor*1.05,0.6,0.8)*0.97 or math.clamp(factor,0.8,1.1)
        self.Scale.Scale=scale
        self.Card.BackgroundTransparency=mobile and 0.3 or 0
        self.IconHolder.BackgroundTransparency=self.Card.BackgroundTransparency
        if self.Config.Position then return end
        local top=size.Y-8*scale
        local parts=table.clone(self._hotbars or {})
        pcall(function()
            if not game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then return end
            for _,part in ipairs(CoreGui.RobloxGui.Backpack:GetChildren()) do
                if part:IsA("GuiObject") then table.insert(parts,part) end
            end
        end)
        local inset=0
        pcall(function() inset=GuiService:GetGuiInset().Y end)
        local found=false
        for _,part in ipairs(parts) do
            if part.Parent then
                local visible=true;local current=part
                while current do
                    if current:IsA("GuiObject") and not current.Visible then visible=false;break end
                    if current:IsA("ScreenGui") and not current.Enabled then visible=false;break end
                    current=current.Parent
                end
                local area,pos=part.AbsoluteSize,part.AbsolutePosition
                if visible and area.X>20 and area.Y>20 and area.Y<size.Y*0.4 and pos.Y+area.Y/2>size.Y*0.5 then
                    local first=pos.Y
                    for _,child in ipairs(part:GetDescendants()) do if child:IsA("GuiButton") and child.Visible and child.AbsoluteSize.X>8 and child.AbsoluteSize.Y>8 then first=math.min(first,child.AbsolutePosition.Y) end end
                    found=true;top=math.min(top,first+inset)
                end
            end
        end
        if found then self._lastHotbarBottom=size.Y-top elseif self._lastHotbarBottom then top=size.Y-self._lastHotbarBottom end
        self.Instance.Position=UDim2.new(0.5,0,0,math.max(top-(mobile and 4 or 6)*scale-52*scale/2,52*scale/2+8))
    end
    function Methods:Get() live(self);return self.ValueState:Get()==true end
    function Methods:Set(value,fire) live(self);self.ValueState:Set(value==true,fire~=false);return self end
    function Methods:GetState() return self.ValueState end
    function Methods:IsVisible() return not self._destroyed and self.Gui.Enabled end
    function Methods:SetVisible(value)
        live(self);value=value==true;local changed=self.Gui.Enabled~=value;self.Gui.Enabled=value
        if self.VisibilityToggle:Get()~=value then self.VisibilityToggle:Set(value,false) end
        if value then self:_layout() end
        self:_syncBorderAnimation()
        self:_syncLayoutPolling()
        if changed then safeCallback(self.Config.OnVisibleChanged,value,self) end;return self
    end
    Methods.SetEnabled=Methods.SetVisible
    Methods.IsEnabled=Methods.IsVisible
    function Methods:Show() return self:SetVisible(true) end
    function Methods:Hide() return self:SetVisible(false) end
    function Methods:SetTitle(value) live(self);self.Title.Text=tostring(value);return self end
    function Methods:SetBrand(value) live(self);self.Brand.Text=tostring(value);return self end
    function Methods:SetColor(part,value,options)
        live(self);local target=typeof(part)=="Instance" and part or self.Instance:FindFirstChild(part,true)
        assert(target,"Parte do painel nao encontrada: "..tostring(part));window:SetComponentColor(target,value,options);return self
    end
    function Methods:SetTextColor(value) live(self);window:SetComponentColor(self.Instance,value,{Descendants=true,TextOnly=true});return self end
    function Methods:SetPosition(value) live(self);assert(typeof(value)=="UDim2","Position precisa ser UDim2.");self.Config.Position=value;self:_layout();return self end
    function Methods:ResetPosition() live(self);self.Config.Position=nil;self:_layout();return self end
    function Methods:Destroy()
        if self._destroyed then return end;self._destroyed=true
        for _,c in ipairs(self._connections) do c:Disconnect() end
        for _,tween in pairs(self._tweens) do tween:Cancel() end
        Runtime.unregisterStyledRoot(self.Gui);self.Gui:Destroy()
        if self._ownsToggle and not self.VisibilityToggle._destroyed then self.VisibilityToggle:Destroy() end
        if self._ownsState and not self.ValueState._destroyed then self.ValueState:Destroy() end
        if window.AntiGuardPanel==self then window.AntiGuardPanel=nil end
    end
    function WindowMethods:CreateAntiGuardPanel(config)
        assertObject(self,"Window");config=config or {};assert(type(config)=="table","CreateAntiGuardPanel recebe uma tabela.")
        if self.AntiGuardPanel and not self.AntiGuardPanel._destroyed then return self.AntiGuardPanel end
        if config.Callback then assert(type(config.Callback)=="function","Callback precisa ser uma funcao.") end
        if config.Position then assert(typeof(config.Position)=="UDim2","Position precisa ser UDim2.") end
        local iconId=tostring(config.Icon or "rbxassetid://128961717706452")
        if iconId:match("^%d+$") then iconId="rbxassetid://"..iconId end
        assert(iconId:match("^rbxassetid://%d+$") or iconId:match("^rbxasset://") or iconId:match("^rbxthumb://"),"Icon precisa ser um ID de imagem.")
        local section=config.Section or self.DefaultTab
        local name=config.Name or "Anti Guard Panel"
        local state=config.State or self:CreateState({Name=name..".Value",Default=config.Value==true})
        local toggle=config.Toggle or section:CreateToggle({Name=name,Default=config.Default~=false})
        local gui=create("ScreenGui",rootGui.Parent,"MIKOTOH_AntiGuardPanel_4",{ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=-100,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Enabled=toggle:Get()==true})
        gui:SetAttribute(OWNER_ATTRIBUTE,true)
        local frame=create("Frame",gui,"AntiGuardPanel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,1,-120),Size=UDim2.fromOffset(226,52),BackgroundTransparency=1})
        local scale=create("UIScale",frame,"ResponsiveScale",{Scale=1})
        local card=create("Frame",frame,"Card",{Size=UDim2.fromScale(1,1),BackgroundColor3=colors.Card,BorderSizePixel=0,Active=true})
        card:SetAttribute("MikotohColorRole","GuardCard")
        create("UICorner",card,"CardCorner",{CornerRadius=UDim.new(0,14)})
        local entrance=create("UIScale",card,"EntranceScale",{Scale=0.86})
        create("UIGradient",card,"CardGradient",{Color=ColorSequence.new(colors.CardTop,colors.Card),Rotation=90})
        local outline=create("UIStroke",card,"CardOutline",{Thickness=1.5,Color=rgb(255,255,255),Transparency=0.2,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})
        outline:SetAttribute("MikotohColorRole","GuardOutline");outline:SetAttribute("MikotohFixedStroke",true)
        local outlineGradient=create("UIGradient",outline,"OutlineGradient",{Color=ColorSequence.new(colors.Stroke,colors.Stroke)})
        local holder=create("Frame",card,"IconHolder",{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Size=UDim2.fromOffset(36,36),BackgroundColor3=rgb(28,26,32),BorderSizePixel=0,ZIndex=2})
        holder:SetAttribute("MikotohColorRole","GuardIcon")
        create("UICorner",holder,"IconCorner",{CornerRadius=UDim.new(0,11)})
        local iconStroke=create("UIStroke",holder,"IconOutline",{Thickness=1.5,Color=colors.Off,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})
        iconStroke:SetAttribute("MikotohFixedStroke",true)
        local icon=create("ImageLabel",holder,"Icon",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromScale(0.86,0.86),BackgroundTransparency=1,Image=iconId,ImageTransparency=0.35,ScaleType=Enum.ScaleType.Crop,ZIndex=3})
        create("UICorner",icon,"ImageCorner",{CornerRadius=UDim.new(0,8)})
        local iconScale=create("UIScale",icon,"PressScale",{Scale=1})
        local brand=create("TextLabel",card,"Brand",{BackgroundTransparency=1,Position=UDim2.new(0,56,0,7),Size=UDim2.new(1,-112,0,15),Font=Enum.Font.BuilderSansExtraBold,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=rgb(255,255,255),Text=config.Brand or "Chilli Hub",ZIndex=2})
        brand:SetAttribute("MikotohColorRole","GuardTitle")
        create("UIGradient",brand,"BrandGradient",{Color=ColorSequence.new(rgb(255,120,100),rgb(255,190,110))})
        local title=create("TextLabel",card,"Title",{BackgroundTransparency=1,Position=UDim2.new(0,56,0,22),Size=UDim2.new(1,-112,0,20),Font=Enum.Font.GothamBlack,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=colors.Text,Text=config.Title or "Anti Guard",ZIndex=2})
        local switch=create("TextButton",card,"Switch",{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-12,0.5,0),Size=UDim2.fromOffset(42,22),BackgroundColor3=rgb(255,255,255),AutoButtonColor=false,BorderSizePixel=0,Text="",ZIndex=2})
        create("UICorner",switch,"SwitchCorner",{CornerRadius=UDim.new(1,0)})
        local switchGradient=create("UIGradient",switch,"SwitchGradient",{Color=ColorSequence.new(colors.Off,colors.Off)})
        local knob=create("Frame",switch,"Knob",{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,3,0.5,0),Size=UDim2.fromOffset(16,16),BackgroundColor3=rgb(245,245,250),BorderSizePixel=0,ZIndex=3})
        knob:SetAttribute("MikotohKeepColor",true);create("UICorner",knob,"KnobCorner",{CornerRadius=UDim.new(1,0)})
        local hit=create("TextButton",card,"HitTarget",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,AutoButtonColor=false,Text="",ZIndex=10})
        local panel=setmetatable({Window=self,Config=table.clone(config),Gui=gui,Instance=frame,Card=card,Scale=scale,Icon=icon,IconHolder=holder,IconStroke=iconStroke,
            Title=title,Brand=brand,Switch=switch,SwitchGradient=switchGradient,Knob=knob,Outline=outline,OutlineGradient=outlineGradient,HitTarget=hit,
            ValueState=state,VisibilityToggle=toggle,_connections={},_tweens={},_ownsToggle=not config.Toggle,_ownsState=not config.State},{__index=Methods})
        self.AntiGuardPanel=panel;toggle.Panel=panel
        Runtime.referenceTextStyle(brand,{Color=brand.BrandGradient.Color,Rotation=0,Role="Accent"})
        Runtime.referenceTextStyle(title,{Color=colors.Text,Plain=true})
        Runtime.registerStyledRoot(gui)
        local valueConnection=state:Subscribe(function() if not panel._destroyed then panel:_render(false) end end)
        valueConnection.Internal=true;table.insert(panel._connections,valueConnection)
        table.insert(panel._connections,state:Subscribe(function(value) if not panel._destroyed then safeCallback(panel.Config.Callback,value,panel) end end))
        local visibilityConnection=toggle:GetState():Subscribe(function(value) if not panel._destroyed then panel:SetVisible(value) end end)
        visibilityConnection.Internal=true;table.insert(panel._connections,visibilityConnection)
        connect(panel,hit.Activated,function()
            panel:Set(not panel:Get());animate(panel,iconScale,0.12,{Scale=1.15})
            task.delay(0.12,function() if not panel._destroyed then animate(panel,iconScale,0.3,{Scale=1},Enum.EasingStyle.Back) end end)
        end)
        connect(panel,hit.MouseEnter,function() animate(panel,switch,0.15,{Size=UDim2.fromOffset(44,24)}) end)
        connect(panel,hit.MouseLeave,function() animate(panel,switch,0.15,{Size=UDim2.fromOffset(42,22)}) end)
        connect(panel,gui:GetPropertyChangedSignal("AbsoluteSize"),function() panel:_layout() end)
        local pg=player:FindFirstChildOfClass("PlayerGui")
        if pg then
            connect(panel,pg.DescendantAdded,function(part)
                if part:IsA("GuiObject") and (part.Name:lower():find("bar",1,true) or part.Name=="Inventory" or part.Name=="Backpack") then
                    task.defer(function() if not panel._destroyed then panel:_cacheHotbars();panel:_layout() end end)
                end
            end)
        end
        panel:_cacheHotbars();panel:_render(true);panel:_layout();panel:_syncLayoutPolling();animate(panel,entrance,0.45,{Scale=1},Enum.EasingStyle.Back)
        if config.TextColor then panel:SetTextColor(config.TextColor) end
        return panel
    end
    function SectionMethods:CreateAntiGuardPanel(config)
        assertObject(self,"Section");local settings=table.clone(config or {});settings.Section=self;return window:CreateAntiGuardPanel(settings)
    end
    function TabMethods:CreateAntiGuardPanel(config)
        assertObject(self,"Tab");local settings=table.clone(config or {});settings.Section=self;return window:CreateAntiGuardPanel(settings)
    end
    for _,methods in ipairs({WindowMethods,SectionMethods,TabMethods}) do methods.CreatePanelToggle=methods.CreateAntiGuardPanel end
    local destroy=WindowMethods.Destroy
    function WindowMethods:Destroy() if self.AntiGuardPanel then self.AntiGuardPanel:Destroy() end;return destroy(self) end
end
installGuardPanel()
end


-- Pixel-sized launcher on its own screen; its ring never enters the window's stroke scaler.
do
local function installLauncher()
    local gui=Instance.new("ScreenGui")
    gui.Name="MIKOTOH_FreeLauncher_4"
    gui.ResetOnSpawn=false
    gui.IgnoreGuiInset=true
    gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    gui.DisplayOrder=math.max(rootGui.DisplayOrder,launcherGui.DisplayOrder)+1
    gui.Enabled=false
    gui:SetAttribute(OWNER_ATTRIBUTE,true)
    gui.Parent=rootGui.Parent
    local host=Instance.new("Frame")
    host.Name="FreeLauncherHost"
    host.BackgroundTransparency=1
    host.BorderSizePixel=0
    host.AnchorPoint=Vector2.new(0.5,0.5)
    host.Position=UDim2.new(0,30,0.5,0)
    host.Size=UDim2.fromOffset(36,36)
    host.ZIndex=200
    host.Visible=false
    host.Parent=gui
    local aspect=Instance.new("UIAspectRatioConstraint")
    aspect.AspectRatio=1
    aspect.Parent=host
    local bounds=Instance.new("UISizeConstraint")
    bounds.MinSize=Vector2.new(36,36)
    bounds.MaxSize=Vector2.new(36,36)
    bounds.Parent=host
    local ring=Instance.new("Frame")
    ring.Name="LauncherRing"
    ring.Size=UDim2.new(1,-2,1,-2)
    ring.Position=UDim2.fromOffset(1,1)
    ring.BackgroundTransparency=1
    ring.BorderSizePixel=0
    ring.ZIndex=202
    ring.Parent=host
    local borderCorner=Instance.new("UICorner")
    borderCorner.CornerRadius=UDim.new(0.5,0)
    borderCorner.Parent=ring
    local border=Instance.new("UIStroke")
    border.Name="LauncherBorder"
    border.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
    border.LineJoinMode=Enum.LineJoinMode.Round
    border.Color=rgb(0,0,0)
    border.Thickness=1
    border:SetAttribute("MikotohFixedStroke",true)
    border:SetAttribute("MikotohKeepColor",true)
    pcall(function() border.StrokeSizingMode=Enum.StrokeSizingMode.FixedSize end)
    pcall(function() border.BorderStrokePosition=Enum.BorderStrokePosition.Outer end)
    border.Parent=ring
    local button=Instance.new("ImageButton")
    button.Name="FreeLauncher"
    button.BackgroundTransparency=1
    button.BorderSizePixel=0
    button.AutoButtonColor=false
    button.ImageColor3=rgb(255,255,255)
    button.Size=UDim2.new(1,-2,1,-2)
    button.Position=UDim2.fromOffset(1,1)
    button.ScaleType=Enum.ScaleType.Crop
    button.Image=""
    button.ClipsDescendants=true
    button.Visible=false
    button.ZIndex=201
    button:SetAttribute("MikotohKeepColor",true)
    button.Parent=host
    local corner=Instance.new("UICorner")
    corner.CornerRadius=UDim.new(0.5,0)
    corner.Parent=button
    local options={Mode="Original",Enabled=false,Size=36,ImageId="",BorderColor="#000000",BorderThickness=1,
        Draggable=true,Position=host.Position}
    local dragController=Runtime.attachSmoothDrag(button,host,gui,{
        CanStart=function() return options.Enabled and options.Draggable~=false end,
        OnMoved=function(position) options.Position=position end,
        FollowSpeed=45,Padding=3,Threshold=5,
    })
    window.OpenButton=button
    window.OpenButtonHost=host
    window.OpenButtonGui=gui
    window.OpenButtonBorder=border
    Runtime.registerStyledRoot(gui)
    local function assetImage(value)
        local text=tostring(value or "")
        local id=text:match("^rbxassetid://(%d+)$") or text:match("^(%d+)$")
        assert(id and tonumber(id)>0,"O botao Free exige ImageId com o ID de uma imagem.")
        return "rbxassetid://"..id,id
    end
    function WindowMethods:SetOpenButton(patch)
        assertObject(self,"Window")
        if type(patch)=="boolean" then patch={Mode=patch and "Free" or "Original"} end
        patch=patch or {}
        assert(type(patch)=="table","Use uma tabela para configurar o botao.")
        local nextOptions=table.clone(options)
        for key,value in pairs(patch) do nextOptions[key]=value end
        local mode=tostring(patch.Mode or (patch.Enabled~=nil and (patch.Enabled and "Free" or "Original"))
            or ((patch.ImageId~=nil or patch.Image~=nil) and "Free") or nextOptions.Mode):lower()
        if mode=="normal" then mode="original" end
        if mode=="round" or mode=="livre" then mode="free" end
        assert(mode=="original" or mode=="free","Escolha Mode=Original ou Mode=Free.")
        nextOptions.Mode=mode=="free" and "Free" or "Original"
        nextOptions.Enabled=mode=="free"
        nextOptions.Size=math.clamp(tonumber(nextOptions.Size) or 36,24,80)
        nextOptions.BorderThickness=math.clamp(tonumber(nextOptions.BorderThickness) or 1,0,3)
        if nextOptions.Position then assert(typeof(nextOptions.Position)=="UDim2","Position precisa ser UDim2.") end
        color(nextOptions.BorderColor)
        if nextOptions.ImageRectOffset then assert(typeof(nextOptions.ImageRectOffset)=="Vector2","ImageRectOffset precisa ser Vector2.") end
        if nextOptions.ImageRectSize then assert(typeof(nextOptions.ImageRectSize)=="Vector2","ImageRectSize precisa ser Vector2.") end
        local image
        if mode=="free" then image,nextOptions.ImageId=assetImage(patch.ImageId or patch.Image or nextOptions.ImageId) end
        options=nextOptions
        dragController.Cancel()
        bounds.MaxSize=Vector2.new(80,80)
        bounds.MinSize=Vector2.new(options.Size,options.Size)
        bounds.MaxSize=Vector2.new(options.Size,options.Size)
        host.Size=UDim2.fromOffset(options.Size,options.Size)
        if patch.Position then host.Position=options.Position end
        button.Position=UDim2.fromOffset(options.BorderThickness,options.BorderThickness)
        button.Size=UDim2.new(1,-2*options.BorderThickness,1,-2*options.BorderThickness)
        ring.Position=button.Position
        ring.Size=button.Size
        ring.Visible=options.BorderThickness>0
        border.Thickness=options.BorderThickness
        border.Transparency=math.clamp(tonumber(options.BorderTransparency) or 0,0,1)
        if image then button.Image=image end
        button.ImageRectOffset=options.ImageRectOffset or Vector2.new()
        button.ImageRectSize=options.ImageRectSize or Vector2.new()
        if options.ImageColor then window:SetComponentColor(button,options.ImageColor,{Property="ImageColor3"}) end
        window:SetComponentColor(border,options.BorderColor,{Property="Color"})
        gui.Enabled=options.Enabled
        host.Visible=options.Enabled
        button.Visible=options.Enabled
        launcherGui.Enabled=not options.Enabled
        dragController.Clamp()
        return self
    end
    WindowMethods.ConfigureOpenButton=WindowMethods.SetOpenButton
    function WindowMethods:GetOpenButtonOptions() return table.clone(options) end
    function WindowMethods:GetOpenButtonPosition() return host.Position end
    trackRootConnection(button.Activated:Connect(function(input)
        if options.Enabled and (options.Draggable==false or dragController.AllowActivation(input)) then window:ToggleVisible() end
    end))
    trackRootConnection(button.Destroying:Connect(dragController.Destroy))
    local destroy=WindowMethods.Destroy
    function WindowMethods:Destroy()
        if gui.Parent then dragController.Destroy();Runtime.unregisterStyledRoot(gui);gui:Destroy() end
        return destroy(self)
    end
    if config.OpenButton then window:SetOpenButton(config.OpenButton) end
end
installLauncher()
end


end
installExtensions()

trackRootConnection(connectSafeActivation(closeButton, function() window:Close() end))
trackRootConnection(connectSafeActivation(chilliButton, function() window:ToggleVisible() end))
makeButtonFeedback(closeButton)
makeButtonFeedback(chilliButton)
Runtime.windowDragController = makeDraggable(topBar, mainFrame,
    function() return Runtime.chilliIsOpen and not Runtime.windowAnimating end,
    function(position) Runtime.windowRestPosition = position end)
applyOriginalStrokeSizing()
if config.Visible ~= false then window:Open() end
return ChilliLibrary, window

end -- installApi
return installApi()
end -- buildWindow
local Library = {Version = "4.4.0"}
function Library:CreateWindow(config)
    if self.Window and not self.Window._destroyed then self.Window:Destroy() end
    local implementation, window = buildWindow(config)
    self.Window = window
    self.Rich = implementation.Rich
    self.NoStateChange = implementation.NoStateChange
    return window
end
function Library:GetThemes()
    return {"Original", "Dark", "Rose", "Roxo", "Verde", "VermelhoEscuro", "Azul", "Preto", "Lilas", "Dourado", "Ciano", "Laranja", "Turquesa", "Magenta", "Prata", "Ambar", "Marinho", "Menta"}
end
function Library:Destroy()
    if self.Window and not self.Window._destroyed then self.Window:Destroy() end
    self.Window = nil
end
return Library
