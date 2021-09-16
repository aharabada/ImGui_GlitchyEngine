using System;
using DirectX.D3D11;

namespace ImGui
{
    public static class ImGuiImplDX11
    {
        [LinkName("ImGui_ImplDX11_CreateDeviceObjects")]
        private static extern bool CreateDeviceObjectsImpl();
        public static bool CreateDeviceObjects() => CreateDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplDX11_Init")]
        private static extern bool InitImpl(ID3D11Device* device, ID3D11DeviceContext* device_context);
        public static bool Init(ID3D11Device* device, ID3D11DeviceContext* device_context) => InitImpl(device, device_context);
        
        [LinkName("ImGui_ImplDX11_InvalidateDeviceObjects")]
        private static extern void InvalidateDeviceObjectsImpl();
        public static void InvalidateDeviceObjects() => InvalidateDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplDX11_NewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("ImGui_ImplDX11_RenderDrawData")]
        private static extern void RenderDrawDataImpl(ImGui.DrawData* draw_data);
        public static void RenderDrawData(ImGui.DrawData* draw_data) => RenderDrawDataImpl(draw_data);
        
        [LinkName("ImGui_ImplDX11_Shutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
    }
}