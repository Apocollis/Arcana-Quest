@echo off
echo ==================================================
echo   Arcana Quest InControl Spawn Rules Regenerator
echo ==================================================
echo.

echo [1/3] Regenerating potentialspawn.json...
python "%~dp0regenerate_potentialspawn.py"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: potentialspawn.json regeneration failed!
    pause
    exit /b %errorlevel%
)

echo.
echo [2/3] Regenerating spawn.json...
python "%~dp0regenerate_spawn_limits.py"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: spawn.json regeneration failed!
    pause
    exit /b %errorlevel%
)

echo.
echo [3/3] Running rules verification check...
python "%~dp0verify_current_rules_alignment.py"
if %errorlevel% neq 0 (
    echo.
    echo WARNING: Spawning rules verification returned alignment warnings!
) else (
    echo SUCCESS: Spawning rules regenerated and verified successfully!
)

echo.
pause
