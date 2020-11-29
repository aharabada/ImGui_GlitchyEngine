using System;

namespace ImGui
{
    public static class ImGuiImplWin32
    {
        [LinkName("ImGui_ImplWin32_Init")]
        private static extern bool ImGui_ImplWin32_Init_Impl(Windows.HWnd hWnd);
        public static bool Init(Windows.HWnd hWnd) => ImGui_ImplWin32_Init_Impl(hWnd);
        
		[LinkName("ImGui_ImplWin32_Shutdown")]
		private static extern void ImGui_ImplWin32_Shutdown_Impl();
		public static void Shutdown() => ImGui_ImplWin32_Shutdown_Impl();

		[LinkName("ImGui_ImplWin32_NewFrame")]
		private static extern void ImGui_ImplWin32_NewFrame_Impl();
		public static void NewFrame() => ImGui_ImplWin32_NewFrame_Impl();
		
		[LinkName("ImGui_ImplWin32_WndProcHandler")]
		private static extern bool ImGui_ImplWin32_WndProcHandler_Impl(Windows.HWnd hWnd, uint32 uMsg, uint wParam, int lParam);
		public static bool WndProcHandler(Windows.HWnd hWnd, uint32 uMsg, uint wParam, int lParam) => ImGui_ImplWin32_WndProcHandler_Impl(hWnd, uMsg, wParam, lParam);
		
		[LinkName("ImGui_ImplWin32_EnableDpiAwareness")]
		private static extern void ImGui_ImplWin32_EnableDpiAwareness_Impl();
		public static void EnableDpiAwareness() => ImGui_ImplWin32_EnableDpiAwareness_Impl();

		[LinkName("ImGui_ImplWin32_GetDpiScaleForHwnd")]
		private static extern float ImGui_ImplWin32_GetDpiScaleForHwnd_Impl(Windows.HWnd hWnd);
		public static float GetDpiScaleForHwnd(Windows.HWnd hWnd) => ImGui_ImplWin32_GetDpiScaleForHwnd_Impl(hWnd);
		
		[LinkName("ImGui_ImplWin32_GetDpiScaleForMonitor")]
		private static extern float ImGui_ImplWin32_GetDpiScaleForMonitor_Impl(void* monitor);
		public static float GetDpiScaleForMonitor(void* monitor) => ImGui_ImplWin32_GetDpiScaleForMonitor_Impl(monitor);
    }
}