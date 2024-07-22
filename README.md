# Vulkan-SDL-3-Renderer
A basic Vulkan renderer with SDL 3 for windowing and ImGUI. A nice template for my future projects.

## Building

### Windows

Depends on Visual Studio 2022+ and Vulkan 1.3. Run `ProjectSetup.py` and it should pull all the Vender projects, compile SDL 3, and generate the project. From there just build for `Debug`, `Release`, or `Dist` and make sure to grab a DLL from `Venders/SDL/Build` for one of the targets.