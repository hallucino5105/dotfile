@echo off

for /F %%i in (extensions.txt) do (
    code --install-extension %%i
)
