
workspace "BTDSDK_3.0"
architecture "x64"
startproject "TestRenderer"

configurations
{
    "Debug",
    "Release",
    "Dist"
}

project "TestRenderer"
kind "ConsoleApp"
language "C++"

targetdir ("bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}-%{cfg.startproject}/%{prj.name}")
objdir ("bin-obj/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}-%{cfg.startproject}/%{prj.name}")


files 
{
    ---base code
    "includes/**.h",
    "src/**.c",
    "includes/**.hpp",
    "src/**.cpp",

    --volk
    --"Venders/Volk/volk.c",
    --"Venders/Volk/volk.h",

    ---vulkan bootstrapper
    "Venders/VKBootstrap/src/**.cpp",
    "Venders/VKBootstrap/src/**.h",

    ---imgui
    "Venders/ImGUI/imconfig.h",
	"Venders/ImGUI/imgui.h",
	"Venders/ImGUI/imgui.cpp",
	"Venders/ImGUI/imgui_draw.cpp",
	"Venders/ImGUI/imgui_internal.h",
	"Venders/ImGUI/imgui_tables.cpp",
	"Venders/ImGUI/imgui_widgets.cpp",
	"Venders/ImGUI/imstb_rectpack.h",
	"Venders/ImGUI/imstb_textedit.h",
	"Venders/ImGUI/imstb_truetype.h",
	"Venders/ImGUI/imgui_demo.cpp"
}

includedirs
{
    "includes",

    "Venders/SDL/include",
    "Venders/FMT/include",
    "Venders/GLM",

    "Venders/VKBootstrap/src",
    "Venders/VMA/include",
    --"Venders/Volk",
    "Venders/VulkanHeaders/include",

    "Venders/ImGUI"
}

links
{
    "C:/VulkanSDK/1.3.283.0/Lib/vulkan-1.lib"
}

defines
{
    "GLM_FORCE_RADIANS",
    "GLM_FORCE_DEPTH_ZERO_TO_ONE",
    "GLM_ENABLE_EXPERIMENTAL",
   -- "VK_NO_PROTOTYPES"
}

flags
{
    "NoRuntimeChecks",
    "MultiProcessorCompile"
}

buildoptions { "/utf-8" } --used for fmt

--platforms
filter "system:windows"
    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    defines
    {
        "Window_Build",
        "Desktop_Build",
        "VK_USE_PLATFORM_WIN32_KHR"
    }

filter "system:linux"
    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    defines
    {
        "Linux_Build",
        "Desktop_Build",
        "VK_USE_PLATFORM_XLIB_KHR"
    }

    filter "system:mac"
    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    defines
    {
        "MacOS_Build",
        "Desktop_Build",
        "VK_USE_PLATFORM_MACOS_MVK"
    }

--configs
filter "configurations:Debug"
    defines "BTD_DEBUG"
    symbols "On"

    links
    {
        "Venders/SDL/Build/RelWithDebInfo/SDL3.lib"
    }

filter "configurations:Release"
    defines "BTD_RELEASE"
    optimize "On"

    flags
    {
        
    }

    links
    {
       "Venders/SDL/Build/Release/SDL3.lib"
    }

filter "configurations:Dist"
    defines "BTD_DIST"
    optimize "On"

    defines
    {
        "NDEBUG"
    }

    flags
    {
       "LinkTimeOptimization"
    }

    links
    {
       "Venders/SDL/Build/MinSizeRel/SDL3.lib"
    }
