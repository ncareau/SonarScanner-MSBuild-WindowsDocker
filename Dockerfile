FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

ENV JAVA_PKG="server-jre-8u261-windows-x64.tar.gz" \
    JAVA_HOME="C:\\jdk1.8.0_261" \
    SONARSCAN_VERSION="4.10.0.19059" \
    SONARSCAN_PKG="sonar-scanner-msbuild-4.10.0.19059-net46.zip"

# Add Java
ADD $JAVA_PKG /

RUN setx /M PATH $($Env:PATH + \";${Env:JAVA_HOME}\bin\")

# Add SonarScanner
ADD https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONARSCAN_VERSION/$SONARSCAN_PKG /

RUN Expand-Archive -Path "C:\\$env:SONARSCAN_PKG" -DestinationPath C:\SonarScanner

RUN setx /M PATH $($Env:PATH + ';C:\SonarScanner')