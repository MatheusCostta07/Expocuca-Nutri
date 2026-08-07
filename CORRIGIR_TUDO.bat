@echo off
REM Script para corrigir TODOS os caminhos no index.html
echo ====================================
echo Corrigindo caminhos do projeto...
echo ====================================
echo.

REM Backup
if exist "index.html" (
    copy "index.html" "index.html.backup" > nul
    echo [OK] Backup criado: index.html.backup
)

REM Corrigir CSS
powershell -Command "(Get-Content 'index.html') -replace 'href=\"home\.css\"', 'href=\"css/home.css\"' | Set-Content 'index.html'"
echo [OK] CSS corrigido: home.css ^-^> css/home.css

REM Corrigir logos e imagens
powershell -Command "(Get-Content 'index.html') -replace 'src=\"logo nutri\.png\"', 'src=\"assets/logo nutri.png\"' | Set-Content 'index.html'"
echo [OK] Logo corrigido: logo nutri.png ^-^> assets/logo nutri.png

powershell -Command "(Get-Content 'index.html') -replace 'src=\"logo insta\.png\"', 'src=\"assets/logo insta.png\"' | Set-Content 'index.html'"
echo [OK] Logo corrigido: logo insta.png ^-^> assets/logo insta.png

powershell -Command "(Get-Content 'index.html') -replace 'href=\"logo nutri\.png\"', 'href=\"assets/logo nutri.png\"' | Set-Content 'index.html'"
echo [OK] Favicon corrigido

REM Corrigir imagens da pasta images/
powershell -Command "(Get-Content 'index.html') -replace 'src=\"muie img\.png\"', 'src=\"images/muie img.png\"' | Set-Content 'index.html'"
echo [OK] Imagens corrigidas

echo.
echo ====================================
echo Pronto! Caminhos corrigidos!
echo ====================================
echo.
echo Proximos passos:
echo 1. Atualize o navegador (Ctrl+F5)
echo 2. Verifique se CSS esta funcionando
echo 3. Depois faca:
echo    git add .
echo    git commit -m "Corrige caminhos de CSS e imagens"
echo    git push origin main
echo.
pause
