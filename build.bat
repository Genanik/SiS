:: �رտ���̨����  
@echo off

:: ����app.json
go build github.com/Tnze/CoolQ-Golang-SDK/tools/cqcfg
go generate

:: ���û�������  
SET CGO_LDFLAGS=-Wl,--kill-at
SET CGO_ENABLED=1
SET GOOS=windows
SET GOARCH=386
SET GOPROXY=https://goproxy.cn

:: ����app.dll
go build -ldflags "-s -w" -buildmode=c-shared -o app.dll

:: ��������˻������������app.dll��app.json���Ƶ���Q��dev�ļ���
R:: SET DevDir=D:\��Q Pro\dev\cn.miaoscraft.sis
if defined DevDir
for %%f in (app.dll,app.json) do move %%f "%DevDir%\%%f" > nul