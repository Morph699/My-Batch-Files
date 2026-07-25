@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC" /v "ExePath" /t REG_SZ /d "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AC3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_APE" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_ASF" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AVI" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_AVS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_CDDA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_CDXA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_DSM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_DTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLIC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_FLV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_GIF" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_HTTP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MATROSKA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MISC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MMS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MP4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPEG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_MPEGTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_OGG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_REALMEDIA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RFS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTMP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_RTSP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_SUBS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_UDP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_VTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "SRC_WTV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AC3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AC4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_ALAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_ALS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AMR" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AMVV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_AV1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_DIVX" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_DTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLIC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_FLV4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_H263" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_INDEO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_LPCM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MJPEG" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPEG1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MSMPEG4" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MSVIDEO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_NELLY" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_OPUS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_PCM" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_PS2AUD" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_RA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_RV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_SCREEN" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_SVQ3" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_THEORA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_V210_V410" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VORBIS" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP356" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP8" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMA" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMALL" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMAPRO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_WMV" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_XVID" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_H264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_HEVC" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_MPEG2" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VC1" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters" /v "TRA_VP9" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "SampleConvertDither" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "DRCEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "AutoAVSync" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Output51Legacy" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "ExpandMono" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingLayout" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingFlags" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Mixing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingCenterLevel" /t REG_DWORD /d "10000" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "MixingLFELevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_ac3" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_dts" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_eac3" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_dtshd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVAudio" /v "Bitstreaming_truehd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "QueueMaxPackets" /t REG_DWORD /d "350" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "QueueMaxSize" /t REG_DWORD /d "128" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVSplitter" /v "NetworkAnalysisDuration" /t REG_DWORD /d "2100" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo" /v "TrayIcon" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo" /v "MSWMV9DMO" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWAccel" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "h264" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "vc1" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "hevc" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "hevc10" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "vp9" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "av1" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "mpeg2" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "mpeg4" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "dvd" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWAccelDeviceD3D11" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Internal Filters\LAVVideo\HWAccel" /v "HWResFlags" /t REG_DWORD /d "6" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "DSVidRen" /t REG_DWORD /d "14" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AutoloadSubtitles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SubtitleRenderer" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AudioRendererType" /t REG_SZ /d "Internal Audio Renderer" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AllowDroppingSubpic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AutoDownloadSubtitles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RenderSSAUsingLibass" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SubtitlesProviders" /t REG_SZ /d "<|OpenSubtitles|||0|1|><|podnapisi|||1|0|><|SubDB|||1|0|><|Napisy24|||0|0|>" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "AudioNormalize" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "ShowOSD" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "UseSeekPreview" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "FastSeek" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "KeepHistory" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberFilePos" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberPosForAudioFiles" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "RememberPosForLongerThan" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "BlockRDP" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "MPCTheme" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "ModernThemeMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "DefaultToolbarSize" /t REG_DWORD /d "28" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "IconLibVersion" /t REG_DWORD /d "1337" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Settings" /v "SettingsVersion" /t REG_DWORD /d "9" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "0" /t REG_SZ /d "Disabled" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "1" /t REG_SZ /d "Sharpen" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PreResize0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PreResize1" /t REG_SZ /d ".\Sharpen complex 2.hlsl" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PostResize0" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Shaders\Presets" /v "PostResize1" /t REG_SZ /d "" /f
Reg.exe add "HKCU\SOFTWARE\MPC-HC\MPC-HC\Toolbars\PlayerToolBar" /v "DefaultToolbarSize" /t REG_DWORD /d "28" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
