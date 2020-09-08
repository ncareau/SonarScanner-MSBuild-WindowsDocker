# SonarScanner-MSBuild-WindowsDocker

[![Docker Pulls](https://img.shields.io/docker/pulls/ncareau/sonarscanner-msbuild-windowsdocker)](https://hub.docker.com/r/ncareau/sonarscanner-msbuild-windowsdocker)

Windows docker images for SonarScanner MSBuild with aspnet framework for testing.

* Based on [mcr.microsoft.com/dotnet/framework/sdk:4.8](https://hub.docker.com/_/microsoft-dotnet-framework-sdk/)
* With [Sonarscanner MSBuild v4.10](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-msbuild/)
* With [Java server jre 1.8u261](https://www.oracle.com/java/technologies/javase-server-jre8-downloads.html)

Use `SonarScanner.MSBuild.exe` or `C:\SonarScanner\SonarScanner.MSBuild.exe` to run SonarScanner

# Tags

| Tag              | Based on                     | Dockerfile |
|------------------|------------------------------|------------|
| `2004`, `latest` | `4.8-windowsservercore-2004` | [Dockerfile](https://github.com/ncareau/SonarScanner-MSBuild-WindowsDocker/blob/master/Dockerfile-2004) |
| `1909`, `latest` | `4.8-windowsservercore-1909` | [Dockerfile](https://github.com/ncareau/SonarScanner-MSBuild-WindowsDocker/blob/master/Dockerfile-1909) |
| `1903`, `latest` | `4.8-windowsservercore-1903` | [Dockerfile](https://github.com/ncareau/SonarScanner-MSBuild-WindowsDocker/blob/master/Dockerfile-1903) |
| `ltsc2016`, `latest` | `4.8-windowsservercore-ltsc2016` | [Dockerfile](https://github.com/ncareau/SonarScanner-MSBuild-WindowsDocker/blob/master/Dockerfile-ltsc2016) |
| `ltsc2019`, `latest` | `4.8-windowsservercore-ltsc2019` | [Dockerfile](https://github.com/ncareau/SonarScanner-MSBuild-WindowsDocker/blob/master/Dockerfile-ltsc2019) |

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

        docker build -f Dockerfile -t sonarscanner .

# Note

This project is beeing built on self-hosted gitlab using a windows server on latest version 2004. All steps are in the `.gitlab-ci.yml`