# SonarScanner-MSBuild-WindowsDocker

[![Docker Pulls](https://img.shields.io/docker/pulls/ncareau/mikro-watch)](https://hub.docker.com/r/ncareau/mikro-watch)

Windows docker images for SonarScanner MSBuild with aspnet framework for testing. 

* Based on [mcr.microsoft.com/dotnet/framework/sdk:4.8](https://hub.docker.com/_/microsoft-dotnet-framework-sdk/)
* With [Sonarscanner MSBuild v4.10](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-msbuild/)
* With [Java server jre 1.8u261](https://www.oracle.com/java/technologies/javase-server-jre8-downloads.html)

Use `SonarScanner.MSBuild.exe` or `C:\SonarScanner\SonarScanner.MSBuild.exe` to run SonarScanner

# Tags

latest

1903
1909
2004
ltsc2016
ltsc2019

| Tag              | Based on                     | Dockerfile |
|------------------|------------------------------|------------|
| `2004`, `latest` | `4.8-windowsservercore-2004` | [Dockerfile](https://github.com/ncareau/sonarscanner-msbuild-windowsdocker/blob/master/Dockerfile-2004) |
|                  |                            |            |
|                  |                            |            |

tag
based on 
dockerfile

# How to use

An example of script running in a CI :

    - nuget restore Project.sln
    - SonarScanner.MSBuild.exe begin /k:$SONAR_PROJECT_ID /d:sonar.host.url=$SONAR_HOST_URL /d:sonar.login=$SONAR_TOKEN
    - msbuild Project.sln -p:Configuration=Release -p:Platform=x64 -t:Rebuild
    - SonarScanner.MSBuild.exe end /d:sonar.login=$SONAR_TOKEN

Use environment variable or replace `$SONAR_` with correct values. 

# How to build

1. Clone repo
2. Add jre server from oracle: https://www.oracle.com/java/technologies/javase-server-jre8-downloads.html
    * Modify Dockerfile with newer java version if needed.
4. Run `docker build`

        docker build -f Dockerfile-ltsc2019 -t sonarscanner-ltsc2019 .
