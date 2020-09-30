::calls the build commands for the editor, the debug template, the
::release template and the android template in succession.
::optional first arg sets number of cores used (default 4)
::literally googled 5 mins to learn batch scripting so...
::but I mean it works.

@echo off
set /p num_cores="Number of cores to use: "
echo .
REM echo "Compiling editor..."

REM CALL scons -j %num_cores% platform=windows target=release_debug 
REM NOTE turn disable_3d off for 3d games!
set batch_args= tools=no xml=no disable_3d=no ^
     disable_advanced_gui=yes module_bullet_enabled=no builtin_bullet=no builtin_enet=no ^
     builtin_libtheora=no builtin_libvpx=no builtin_libwebp=no  builtin_recast=no ^
	 builtin_thekla_atlas=no builtin_pcre2=no builtin_opus=no builtin_openssl=no ^
	 module_bmp_enabled=no module_openssl_enabled=no ^
	 module_csg_enabled=no module_cvtt_enabled=no module_dds_enabled=no ^
	 module_enet_enabled=no module_gridmap_enabled=no module_hdr_enabled=no ^
	 module_jpg_enabled=no module_mbedtls_enabled=no module_mobile_vr_enabled=no ^
	 module_mono_enabled=no module_opus_enabled=no module_pvr_enabled=no module_recast_enabled=no ^
	 module_regex_enabled=no module_squish_enabled=no module_tga_enabled=no ^
	 module_thekla_unwrap_enabled=no module_theora_enabled=no module_tinyexr_enabled=no ^
	 module_upnp_enabled=no module_visual_script_enabled=no module_webm_enabled=no ^
	 module_webp_enabled=no module_websocket_enabled=no deprecated=no minizip=no ^
	 module_svg_enabled=no module_gdnative_enabled=no
 ::module_vorbis_enabled=no module_stb_vorbis_enabled=no
	 
	 



echo Compiling debug template...
CALL scons -j %num_cores% platform=windows target=release_debug tools=no %batch_args%
echo.	
 
REM echo Compiling release template...
REM CALL scons -j %num_cores% platform=windows target=release tools=no %batch_args%
REM echo.

REM echo Compiling android debug template...
REM echo.   - armv7
REM CALL scons -j %num_cores% platform=android target=release_debug android_arch=armv7 %%batch_args%%
REM echo.   - armv8
REM CALL scons -j %num_cores% platform=android target=release_debug android_arch=arm64v8 %%batch_args%%
REM echo.   - x86
REM CALL scons -j %num_cores% platform=android target=release_debug android_arch=x86 %%batch_args%%
REM echo.   - x86_64
REM CALL scons -j %num_cores% platform=android target=release_debug android_arch=x86_64 %%batch_args%%
REM cd platform/android/java
REM CALL .\gradlew generateGodotTemplates
REM cd ..
REM cd ..
REM cd ..
REM echo.

REM echo Compiling android release template...
REM echo.   - armv7
REM CALL scons -j %num_cores% platform=android target=release android_arch=armv7 %%batch_args%%
REM echo.   - armv8
REM CALL scons -j %num_cores% platform=android target=release android_arch=arm64v8 %%batch_args%%
REM echo.   - x86
REM CALL scons -j %num_cores% platform=android target=release android_arch=x86 %%batch_args%%
REM echo.   - x86_64
REM CALL scons -j %num_cores% platform=android target=release android_arch=x86_64 %%batch_args%%
REM cd platform/android/java
REM CALL .\gradlew generateGodotTemplates
REM cd ..
REM cd ..
REM cd ..
echo Finished batch build!