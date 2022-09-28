using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiDestructorDefinition : ImGuiStructMethodDefinition
    {
        public ImGuiDestructorDefinition(string linkName, string structType, bool isGeneric) : base("~this", linkName, new List<object>(), structType, isGeneric, null) { }

        public override string Serialize()
        {
            return
            $@"
[LinkName(""{LinkName}"")]
private static extern void DestroyImpl({ParentType}{(IsGeneric ? "<T>" : "")}* ptr);
";
        }
    }
}
