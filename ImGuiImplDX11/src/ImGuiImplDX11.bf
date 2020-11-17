using System;
using DirectX.D3D11;

namespace ImGui
{
    public static class ImGuiImplDX11
    {
        [LinkName("ImGui_ImplDX11_Init")]
        private static extern bool ImGui_ImplDX11_Init_Impl(ID3D11Device* device, ID3D11DeviceContext* device_context);
        public static bool Init(ID3D11Device* device, ID3D11DeviceContext* device_context) => ImGui_ImplDX11_Init_Impl(device, device_context);

        [LinkName("ImGui_ImplDX11_Shutdown")]
        private static extern void ImGui_ImplDX11_Shutdown_Impl();
        public static void Shutdown() => ImGui_ImplDX11_Shutdown_Impl();

        [LinkName("ImGui_ImplDX11_NewFrame")]
        private static extern void ImGui_ImplDX11_NewFrame_Impl();
        public static void NewFrame() => ImGui_ImplDX11_NewFrame_Impl();

        [LinkName("ImGui_ImplDX11_RenderDrawData")]
        private static extern void ImGui_ImplDX11_RenderDrawData_Impl(ImGui.DrawData* drawData);
        public static void RenderDrawData(ref ImGui.DrawData drawData) => ImGui_ImplDX11_RenderDrawData_Impl(&drawData);

        [LinkName("ImGui_ImplDX11_InvalidateDeviceObjects")]
        private static extern void ImGui_ImplDX11_InvalidateDeviceObjects_Impl();
        public static void InvalidateDeviceObjects() => ImGui_ImplDX11_InvalidateDeviceObjects_Impl();

        [LinkName("ImGui_ImplDX11_CreateDeviceObjects")]
        private static extern bool ImGui_ImplDX11_CreateDeviceObjects_Impl();
        public static bool CreateDeviceObjects() => ImGui_ImplDX11_CreateDeviceObjects_Impl();
    }
}