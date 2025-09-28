# 获取 AWS CodeArtifact 授权令牌
Write-Host "[Step1]-->Start to get aws codeartifact authorization-token..."
$token = aws codeartifact get-authorization-token --domain test --domain-owner 296062553964 --region ap-northeast-1 --query authorizationToken --output text
Write-Host "CODEARTIFACT_AUTH_TOKEN = $token"

# 设置环境变量
Write-Host "[Step2]-->Start to set environment variables..."
[Environment]::SetEnvironmentVariable("CODEARTIFACT_AUTH_TOKEN", $token, "User")

# 解析ddmarketinghub相关依赖
Write-Host "[Step3]-->Start to resolve ddmarketinghub dependencies..."
mvn dependency:resolve
Write-Host "The PowerShell script is executed successfully"
