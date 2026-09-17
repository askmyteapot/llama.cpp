@call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 -vcvars_ver=Preview
rmdir build /s /q
mkdir build && cd build
set CMAKE_CUDA_FLAGS="--split-compile=8"
"C:\Program Files\Microsoft Visual Studio\18\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" .. -G "Ninja" -DCMAKE_BUILD_TYPE:STRING="Release" -DCMAKE_C_COMPILER:FILEPATH="C:\Program Files\LLVM\bin\clang-cl.exe" -DCMAKE_CXX_COMPILER:FILEPATH="C:\Program Files\LLVM\bin\clang-cl.exe" -DLLAMA_CUBLAS=ON -DLLAMA_CUDA_DISABLE_DP4A=ON -DCMAKE_CUDA_ARCHITECTURES="75-real;86-real;120a-real" -DCMAKE_MAKE_PROGRAM="C:\Program Files\Microsoft Visual Studio\18\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja\ninja.exe" -DCMAKE_TOOLCHAIN_FILE="D:/vcpkg/scripts/buildsystems/vcpkg.cmake" -DCMAKE_CUDA_FLAGS="--compiler-options=/utf-8,/Zc:preprocessor,/EHsc" -DCMAKE_CUDA_RUNTIME_LIBRARY=Shared
"C:\Program Files\Microsoft Visual Studio\18\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" --build . --config Release -j30
copy /Y %~dp0\build\bin\koboldcpp_cublas.dll %~dp0\koboldcpp_cublas.dll
pause
