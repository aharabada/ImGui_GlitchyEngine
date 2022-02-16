using System;

using static ImGui.ImGui;

namespace ImGuizmo
{
	public static class ImGuizmo
	{
		// -- Auto-Generated --

        [AllowDuplicates]
        public enum MODE 
        {
            LOCAL = 0,
            WORLD = 1,
        
        }
        
        [AllowDuplicates]
        public enum OPERATION 
        {
            TRANSLATE_X = 1,
            TRANSLATE_Y = 2,
            TRANSLATE_Z = 4,
            ROTATE_X = 8,
            ROTATE_Y = 16,
            ROTATE_Z = 32,
            ROTATE_SCREEN = 64,
            SCALE_X = 128,
            SCALE_Y = 256,
            SCALE_Z = 512,
            BOUNDS = 1024,
            SCALE_XU = 2048,
            SCALE_YU = 4096,
            SCALE_ZU = 8192,
            TRANSLATE = 7,
            ROTATE = 120,
            SCALE = 896,
            SCALEU = 14336,
            UNIVERSAL = 14463,
        
        }
        
        [LinkName("ImGuizmo_AllowAxisFlip")]
        private static extern void AllowAxisFlipImpl(bool value);
        public static void AllowAxisFlip(bool value) => AllowAxisFlipImpl(value);
        
        [LinkName("ImGuizmo_BeginFrame")]
        private static extern void BeginFrameImpl();
        public static void BeginFrame() => BeginFrameImpl();
        
        [LinkName("ImGuizmo_DecomposeMatrixToComponents")]
        private static extern void DecomposeMatrixToComponentsImpl(float* matrix, float* translation, float* rotation, float* scale);
        public static void DecomposeMatrixToComponents(float* matrix, float* translation, float* rotation, float* scale) => DecomposeMatrixToComponentsImpl(matrix, translation, rotation, scale);
        
        [LinkName("ImGuizmo_DrawCubes")]
        private static extern void DrawCubesImpl(float* view, float* projection, float* matrices, int32 matrixCount);
        public static void DrawCubes(float* view, float* projection, float* matrices, int32 matrixCount) => DrawCubesImpl(view, projection, matrices, matrixCount);
        
        [LinkName("ImGuizmo_DrawGrid")]
        private static extern void DrawGridImpl(float* view, float* projection, float* matrix, float gridSize);
        public static void DrawGrid(float* view, float* projection, float* matrix, float gridSize) => DrawGridImpl(view, projection, matrix, gridSize);
        
        [LinkName("ImGuizmo_Enable")]
        private static extern void EnableImpl(bool enable);
        public static void Enable(bool enable) => EnableImpl(enable);
        
        [LinkName("ImGuizmo_IsOver_Nil")]
        private static extern bool IsOverImpl();
        public static bool IsOver() => IsOverImpl();
        
        [LinkName("ImGuizmo_IsOver_OPERATION")]
        private static extern bool IsOverImpl(OPERATION op);
        public static bool IsOver(OPERATION op) => IsOverImpl(op);
        
        [LinkName("ImGuizmo_IsUsing")]
        private static extern bool IsUsingImpl();
        public static bool IsUsing() => IsUsingImpl();
        
        [LinkName("ImGuizmo_Manipulate")]
        private static extern bool ManipulateImpl(float* view, float* projection, OPERATION operation, MODE mode, float* matrix, float* deltaMatrix, float* snap, float* localBounds, float* boundsSnap);
        public static bool Manipulate(float* view, float* projection, OPERATION operation, MODE mode, float* matrix, float* deltaMatrix = null, float* snap = null, float* localBounds = null, float* boundsSnap = null) => ManipulateImpl(view, projection, operation, mode, matrix, deltaMatrix, snap, localBounds, boundsSnap);
        
        [LinkName("ImGuizmo_RecomposeMatrixFromComponents")]
        private static extern void RecomposeMatrixFromComponentsImpl(float* translation, float* rotation, float* scale, float* matrix);
        public static void RecomposeMatrixFromComponents(float* translation, float* rotation, float* scale, float* matrix) => RecomposeMatrixFromComponentsImpl(translation, rotation, scale, matrix);
        
        [LinkName("ImGuizmo_SetDrawlist")]
        private static extern void SetDrawlistImpl(DrawList* drawlist);
        public static void SetDrawlist(DrawList* drawlist = null) => SetDrawlistImpl(drawlist);
        
        [LinkName("ImGuizmo_SetGizmoSizeClipSpace")]
        private static extern void SetGizmoSizeClipSpaceImpl(float value);
        public static void SetGizmoSizeClipSpace(float value) => SetGizmoSizeClipSpaceImpl(value);
        
        [LinkName("ImGuizmo_SetID")]
        private static extern void SetIDImpl(int32 id);
        public static void SetID(int32 id) => SetIDImpl(id);
        
        [LinkName("ImGuizmo_SetImGuiContext")]
        private static extern void SetImGuiContextImpl(Context* ctx);
        public static void SetImGuiContext(Context* ctx) => SetImGuiContextImpl(ctx);
        
        [LinkName("ImGuizmo_SetOrthographic")]
        private static extern void SetOrthographicImpl(bool isOrthographic);
        public static void SetOrthographic(bool isOrthographic) => SetOrthographicImpl(isOrthographic);
        
        [LinkName("ImGuizmo_SetRect")]
        private static extern void SetRectImpl(float x, float y, float width, float height);
        public static void SetRect(float x, float y, float width, float height) => SetRectImpl(x, y, width, height);
        
        [LinkName("ImGuizmo_ViewManipulate")]
        private static extern void ViewManipulateImpl(float* view, float length, Vec2 position, Vec2 size, U32 backgroundColor);
        public static void ViewManipulate(float* view, float length, Vec2 position, Vec2 size, U32 backgroundColor) => ViewManipulateImpl(view, length, position, size, backgroundColor);
    }
}