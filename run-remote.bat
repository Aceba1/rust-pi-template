@ECHO OFF

set PROJECT_NAME=rust-pi-template

set BUILD_TARGET=armv7-unknown-linux-gnueabihf
set BUILD_PROFILE=debug

set REMOTE_SSH_DOMAIN=pi@raspberrypi.local
set REMOTE_EXEC_PATH=/tmp/vscode-rust-exec

echo run-remote: Copying build to remote...
scp .\target\%BUILD_TARGET%\%BUILD_PROFILE%\%PROJECT_NAME% %REMOTE_SSH_DOMAIN%:%REMOTE_EXEC_PATH%

IF %ERRORLEVEL% == 0 (
  echo run-remote: Starting remote execution...
  echo:
  ssh %REMOTE_SSH_DOMAIN% "chmod +x %REMOTE_EXEC_PATH% && %REMOTE_EXEC_PATH%"

  IF %ERRORLEVEL% == 0 (
    echo:
    echo run-remote: Completed remote execution!
  ) ELSE (
    echo:
    echo run-remote: Failed remote execution!
  )
) ELSE (
  echo run-remote: Failed to copy to remote!
)
