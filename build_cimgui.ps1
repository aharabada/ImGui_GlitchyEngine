$option = $args[0]

if(($option -eq "make") -or (!$option))
{
    if(Test-Path build)
    {
        echo "Removing old build directory..."
        rm -Recurse build
    }
    mkdir build
    cd build
    cmake ../cimgui
    cd ..
}
elseif($option -eq "clean")
{
    if(Test-Path build)
    {
        echo "Removing old build directory..."
        rm -Recurse build
    }
    else
    {
        echo "Already cleaned."
    }
}
elseif($option -eq "build")
{
    if(!(Test-Path build))
    {
        echo "Build directory doesn't exist."
    }
    else
    {
        cd build
        if($args[1] -eq "DEBUG")
        {
            echo "Building debug..."
            devenv /build Debug cimgui.sln
            echo "Finished build."
            echo "Copying library..."
            cp -Path "Debug/*" -Destination "../ImGui/dist/Debug-Win64/"
        }
        else
        {
            echo "Building release..."
            devenv /build Release cimgui.sln
            echo "Finished build."
            echo "Copying library..."
            cp -Path "Release/*" -Destination "../ImGui/dist/Release-Win64/"
        }
        echo "CImGui compiled."
        cd ..
    }
}
elseif($option -eq "generate")
{
    cd Generator
    echo "Building generator..."
    devenv /build Release Generator.sln
    echo "Running generator..."
    ./bin/Release/netcoreapp3.1/Generator.exe
    echo "Finished."
    cd ..
}