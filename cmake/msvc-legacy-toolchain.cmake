# Get Visual Studio .NET 2002 installation path
cmake_host_system_information(
    RESULT VS_ProductDir
    QUERY WINDOWS_REGISTRY "HKEY_LOCAL_MACHINE\\SOFTWARE\\WOW6432Node\\Microsoft\\VisualStudio\\7.0\\Setup\\VS"
    VALUE "ProductDir"
)

if(NOT VS_ProductDir)
    message(FATAL_ERROR "Visual Studio .NET 2002 is not installed.")
endif()

# Wrap roots of Visual Studio common files
set(VSINTALLDIR "${VS_ProductDir}Common7\\IDE")
set(VCINSTALLDIR "${VS_ProductDir}")
set(FrameworkDir "C:\\Windows\\Microsoft.NET\\Framework")
set(FrameworkVersion "v1.0.3705")
set(FrameworkSDKDir "${VS_ProductDir}FrameworkSDK")

# Converted calls from vsvars32.bat
if(NOT VCINSTALLDIR)
    set(VCINSTALLDIR "${VSINSTALLDIR}")
endif()

set(DevEnvDir "${VSINTALLDIR}")
set(MSVCDir "${VCINSTALLDIR}\\VC7")
set(PATH "${DevEnvDir};${MSVCDir}\\BIN;${VCINSTALLDIR}\\Common7\\Tools;${VCINSTALLDIR}\\Common7\\Tools\\bin\\prerelease;${VCINSTALLDIR}\\Common7\\Tools\\bin;${FrameworkSDKDir}\\bin;${FrameworkDir}\\${FrameworkVersion};${PATH};")
set(INCLUDE "${MSVCDir}\\ATLMFC\\INCLUDE;${MSVCDir}\\INCLUDE;${MSVCDir}\\PlatformSDK\\include\\prerelease;${MSVCDir}\\PlatformSDK\\include;${FrameworkSDKDir}\\include;${INCLUDE}")
set(LIB "${MSVCDir}\\ATLMFC\\LIB;${MSVCDir}\\LIB;${MSVCDir}\\PlatformSDK\\lib\\prerelease;${MSVCDir}\\PlatformSDK\\lib;${FrameworkSDKDir}\\lib;${LIB}")

# Link and include directories
link_directories(LIB)
include_directories(SYSTEM INCLUDE)
