using System;

namespace ImGui
{
    public static class ImGuiImplWin32
    {
        [LinkName("ImGui_ImplWin32_EnableAlphaCompositing")]
        private static extern void EnableAlphaCompositingImpl(void* hwnd);
        public static void EnableAlphaCompositing(void* hwnd) => EnableAlphaCompositingImpl(hwnd);
        
        [LinkName("ImGui_ImplWin32_EnableDpiAwareness")]
        private static extern void EnableDpiAwarenessImpl();
        public static void EnableDpiAwareness() => EnableDpiAwarenessImpl();
        
        [LinkName("ImGui_ImplWin32_GetDpiScaleForHwnd")]
        private static extern float GetDpiScaleForHwndImpl(void* hwnd);
        public static float GetDpiScaleForHwnd(void* hwnd) => GetDpiScaleForHwndImpl(hwnd);
        
        [LinkName("ImGui_ImplWin32_GetDpiScaleForMonitor")]
        private static extern float GetDpiScaleForMonitorImpl(void* monitor);
        public static float GetDpiScaleForMonitor(void* monitor) => GetDpiScaleForMonitorImpl(monitor);
        
        [LinkName("ImGui_ImplWin32_Init")]
        private static extern bool InitImpl(void* hwnd);
        public static bool Init(void* hwnd) => InitImpl(hwnd);
        
        [LinkName("ImGui_ImplWin32_InitForOpenGL")]
        private static extern bool InitForOpenGLImpl(void* hwnd);
        public static bool InitForOpenGL(void* hwnd) => InitForOpenGLImpl(hwnd);
        
        [LinkName("ImGui_ImplWin32_NewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("ImGui_ImplWin32_Shutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();

		[LinkName("ImGui_ImplWin32_WndProcHandler")]
		private static extern bool ImGui_ImplWin32_WndProcHandler_Impl(Windows.HWnd hWnd, uint32 uMsg, uint wParam, int lParam);
		public static bool WndProcHandler(Windows.HWnd hWnd, uint32 uMsg, uint wParam, int lParam) => ImGui_ImplWin32_WndProcHandler_Impl(hWnd, uMsg, wParam, lParam);
    }
}