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
    cmake ../ -DIMGUI_STATIC="ON"
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

            $debugpath = "../ImGui/dist/Debug-Win64/"
            if(!(Test-Path $debugpath))
            {
                mkdir $debugpath
            }

            cp -Path "Debug/*" -Destination $debugpath
        }
        else
        {
            echo "Building release..."
            devenv /build Release cimgui.sln
            echo "Finished build."
            echo "Copying library..."

            $releasepath = "../ImGui/dist/Release-Win64/"
            if(!(Test-Path $releasepath))
            {
                mkdir $releasepath
            }

            cp -Path "Release/*" -Destination $releasepath
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
elseif($option -eq "all")
{
	./build_cimgui.ps1 make
	./build_cimgui.ps1 build debug
	./build_cimgui.ps1 build release
	./build_cimgui.ps1 generate
}